From: bugme-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 12919] New: posix_fallocate: what if len == 0?
Date: Sun, 22 Mar 2009 11:51:02 -0700 (PDT)
Message-ID: <bug-12919-11311@http.bugzilla.kernel.org/>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=12919

           Summary: posix_fallocate: what if len == 0?
           Product: Documentation
           Version: unspecified
     KernelVersion: 2.6.28.4
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: e.dolstra-hGVxb2UgFK3z+pZb47iToQ@public.gmane.org


Hi,

I noticed the following in the manpage for posix_fallocate.  It currently (in
man-pages 3.19) says under "Errors":

  EINVAL  offset or len was less than 0.

However, the Linux kernel also returns EINVAL if len is *equal* to 0.  (See
fallocate() in
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob_plain;f=fs/open.c;hb=HEAD).
 This follows IEEE Std 1003.1-2001, which says
(http://www.opengroup.org/onlinepubs/009695399/functions/posix_fallocate.html):

[EINVAL]
    The len argument was zero or the offset argument was less than zero.

(Interestingly, this doesn't mention what should happen if len is negative...)

However POSIX.1-2008 says
(http://www.opengroup.org/onlinepubs/9699919799/functions/posix_fallocate.html):

[EINVAL]
    The len argument is less than zero, or the offset argument is less than   
zero, or the underlying file system does not support this operation.

Thus the manpage should probably be updated to reflect that you cannot rely on
len being allowed to be 0 in portable code.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
