From: Christoph Bartoschek <bartoschek-eefaeeawk+jFLWzOrOlZPg@public.gmane.org>
Subject: Problem in manpage of uname(2)
Date: Tue, 28 Apr 2009 13:21:59 +0200
Message-ID: <200904281323.23357.bartoschek@or.uni-bonn.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christian Panten <panten-eefaeeawk+jFLWzOrOlZPg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

I am using opensuse 11.1 with the most recent updates. The problem can also be 
found on the page 
http://www.kernel.org/doc/man-pages/online/pages/man2/uname.2.html

The page states that the member domainname of struct utsname is only available 
if _GNU_SOURCE is defined.

However in /usr/include/sys/utsname.h I can only find:

#if _UTSNAME_DOMAIN_LENGTH - 0
    /* Name of the domain of this node on the network.  */
# ifdef __USE_GNU
    char domainname[_UTSNAME_DOMAIN_LENGTH];
# else
    char __domainname[_UTSNAME_DOMAIN_LENGTH];
# endif

and in /usr/include/bits/utsname.h:

/* Length of the entries in `struct utsname' is 65.  */
#define _UTSNAME_LENGTH 65

/* Linux provides as additional information in the `struct utsname'
   the name of the current domain.  Define _UTSNAME_DOMAIN_LENGTH
   to a value != 0 to activate this entry.  */
#define _UTSNAME_DOMAIN_LENGTH _UTSNAME_LENGTH



This means that for linux the struct utname has always six members and the 
last one is either named domainname or __domainname. The manpage should state 
this to make clear that a struct utsname has to be initialized like this:

struct utsname name = {"", "", "", "", "", ""};

Thanks,
Christoph


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
