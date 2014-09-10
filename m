From: "Carlos O'Donell" <carlos@redhat.com>
Subject: Re: [PATCH] getgrent.3: Add ENOENT to error list.
Date: Wed, 10 Sep 2014 12:57:04 -0400
Message-ID: <541082E0.8050707@redhat.com>
References: <54105ED1.5020206@redhat.com> <20140910145307.GC14885@spoyarek.pnq.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <libc-alpha-return-52690-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <20140910145307.GC14885@spoyarek.pnq.redhat.com>
To: Siddhesh Poyarekar <siddhesh@redhat.com>
Cc: Michael Kerrisk <mtk.manpages@gmail.com>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, Simo Sorce <ssorce@redhat.com>, Jakub Hrozek <jhrozek@redhat.com>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

On 09/10/2014 10:53 AM, Siddhesh Poyarekar wrote:
> On Wed, Sep 10, 2014 at 10:23:13AM -0400, Carlos O'Donell wrote:
>> It's possible to get ENOENT returned from getgrent
>> if the backend, for example say SSSD, isn't configured
>> or the daemon isn't running. The same can be said of any
>> of the NSS backend.
> 
> The daemon not running is internally a NSS_STATUS_TRYAGAIN +
> EAGAIN[1], i.e. that is what the sssd nss plugin should return to
> glibc.  glibc then should return that as a NOTFOUND, which for
> getgrent is a NULL return without errno set.  I don't see why ENOENT
> is necessary.

This is orthogonal to the discussion at hand.

At present glibc will return a NULL `struct group*' and errno set to
ENOENT if the NSS plugin returns NSS_STATUS_UNAVAIL and errno ENOENT
indicating it is incorrectly configured. This is a documented entry
in the glibc manual, and is presently how SSSD behaves (until it
gets fixed).

Wether we like it or not there is a present day distinction between
"permanently unavailable until an admin fixes it" (NSS_STATUS_UNAVAIL,ENOENT),
"temporarily unavailable" (NSS_STATUS_TRYAGAIN,EAGAIN), and the former
may be seen by the user, and may be useful to act upon by a program
that is interested in that behaviour. I do not think glibc should hide
NSS_STATUS_TRYAGAIN from the user.

To be clear ENOENT is neccessary if you want to actually detect that
something is wrong with your system and take evasive action. Simply
getting back no results is not sufficient to take corrective action.
In the case of sss however the intent of the inactive plugin is to
operate as if it had no data. At least this is what I've been told by
those working on SSSD at Red Hat.

SSSD should *not* use status==NSS_STATUS_TRYAGAIN and errno==EAGAIN
because that will simply result in EAGAIN being returned to userspace
from getgrent which is again a deviation from the entire philosophy
behind SSSD wanting `sss` in nsswitch.conf. The point is to appear
as a transparent plugin that is enabled at a later time by starting
up the daemon.

For example if you fix SSSD to use status==NSS_STATUS_TRYAGIN
errno==EAGAIN instead you get this still wrong behaviour from
this test case:


#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <grp.h>

int main(int argc, char *argv[])
{
    struct group *p_group;

    setgrent();
    while (1) {
        errno = 0;  /* initialize for  getgrent() */
        p_group = getgrent();
        if (p_group == NULL) {
            if (errno == 0) {
                    break;   /* end of groups */
            } else {
                perror("getgrent");
                /* error occurs. */
                printf("getgrent error %d \n", errno);
                endgrent();
                exit(-2);
            }
        }
        printf("getgrent() OK group(%d) = %s \n",p_group->gr_gid, p_group->gr_name);
    }

    exit(0);
}

With SSSD using status==NSS_STATUS_TRYAGAIN errno==EAGAIN:

getgrent() OK group(0) = root 
getgrent() OK group(1) = bin 
getgrent() OK group(2) = daemon 
...
getgrent: Resource temporarily unavailable
getgrent error 11 

With SSSD using status==NSS_STATUS_UNAVAIL errno==ENOENT:

getgrent() OK group(0) = root 
getgrent() OK group(1) = bin 
getgrent() OK group(2) = daemon 
...
getgrent: No such file or directory
getgrent error 2 

With SSSD using status==NSS_STATUS_NOTFOUND errno==0:
getgrent() OK group(0) = root 
getgrent() OK group(1) = bin 
getgrent() OK group(2) = daemon 
getgrent() OK group(3) = sys 
...
getgrent() OK group(185) = wildfly

Which completes successfully and is the only way it should
work for an installed SSSD nss module.

e.g.
diff -urN sssd-1.11.6/src/sss_client/nss_group.c sssd-1.11.6.mod/src/sss_client/nss_group.c
--- sssd-1.11.6/src/sss_client/nss_group.c	2014-06-03 10:31:33.000000000 -0400
+++ sssd-1.11.6.mod/src/sss_client/nss_group.c	2014-09-10 12:21:52.330685026 -0400
@@ -539,6 +539,11 @@
     if (nret != NSS_STATUS_SUCCESS) {
         errno = errnop;
     }
+    /* Always pretend we have no data.  */
+    if (nret == NSS_STATUS_UNAVAIL) {
+	nret = NSS_STATUS_NOTFOUND;
+	errno = 0;
+    }
 
     sss_nss_unlock();
     return nret;
@@ -639,6 +644,11 @@
     if (nret != NSS_STATUS_SUCCESS) {
         errno = errnop;
     }
+    /* Always pretend we have no data.  */
+    if (nret == NSS_STATUS_UNAVAIL) {
+	nret = NSS_STATUS_NOTFOUND;
+	errno = 0;
+    }
 
     sss_nss_unlock();
     return nret;
---

Please correct me if you think something I've said is wrong
or doesn't make sense.


Cheers,
Carlos.
