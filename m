From: Tobias Herzke <tobias.linuxpatches.2014-l5l7mIzdFukkB/skPZtzJg@public.gmane.org>
Subject: [patch] pthread_attr_setschedparam.3 : Describe EINVAL in ERRORS
Date: Sat, 11 Oct 2014 21:04:12 +0200
Message-ID: <54397F2C.7000008@gi2.herzkes.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030904020202060909040001"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------030904020202060909040001
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

The following example proves that the man page 
pthread_attr_setschedparam.3 is incorrect when it claims that the 
pthread_attr_setschedparam function always succeeds on linux:

#include <pthread.h>
#include <errno.h>
int main() {
   pthread_attr_t attr;
   struct sched_param p = {-1}; /* invalid priority */
   if (pthread_attr_init(&attr) == 0)
     if (pthread_attr_setschedpolicy(&attr, SCHED_OTHER) == 0)
       if (pthread_attr_setschedparam(&attr, &p) == EINVAL)
	return 1;
   return 0;
}

The program exits with exit code 1, therefore pthread_attr_setschedparam 
has returned error code EINVAL.

I could evoke this error on ubuntu 14.04, and verify it by examining the 
eglibc-2.19 source code. The function is implemented in file 
fbtl/pthread_attr_setschedparam.c. For error checking, it calls the 
helper function check_sched_priority_attr which is implemented inline in 
file ./fbtl/pthreadP.h. This function returns EINVAL if a range check fails.

The attached patch corrects the man page. The patch is against the 
current git master, 298f72af973e4bf3975d6a84369286b548e6fb63


--------------030904020202060909040001
Content-Type: text/x-patch;
 name="pthread_attr_setschedparam.3.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="pthread_attr_setschedparam.3.diff"

diff --git a/man3/pthread_attr_setschedparam.3 b/man3/pthread_attr_setschedparam.3
index f3db870..8ea4f47 100644
--- a/man3/pthread_attr_setschedparam.3
+++ b/man3/pthread_attr_setschedparam.3
@@ -86,15 +86,22 @@ to
 On success, these functions return 0;
 on error, they return a nonzero error number.
 .SH ERRORS
-POSIX.1 documents
+.BR pthread_attr_setschedparam ()
+can fail with the following error:
+.TP
 .B EINVAL
-and
+the priority specified in
+.I param
+does not make sense for the current scheduling policy of
+.IR attr .
+.PP
+POSIX.1 also documents an
 .B ENOTSUP
-errors for
+error for
 .BR pthread_attr_setschedparam ().
-On Linux these functions always succeed
+This value is never returned on Linux
 (but portable and future-proof applications should nevertheless
-handle a possible error return).
+handle this error return value).
 .\" .SH VERSIONS
 .\" Available since glibc 2.0.
 .SH ATTRIBUTES

--------------030904020202060909040001--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
