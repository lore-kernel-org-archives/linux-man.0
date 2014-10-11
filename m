From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 86061] New: Condition for read(2) to return EINVAL is
 inaccurate
Date: Sat, 11 Oct 2014 19:58:04 +0000
Message-ID: <bug-86061-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=86061

            Bug ID: 86061
           Summary: Condition for read(2) to return EINVAL is inaccurate
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: nodakai-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No

The man page reads

> If count is greater than SSIZE_MAX, the result is unspecified.

However when we look at the implementation, rw_verify_area() which is common to
vfs_read(), vfs_write() and so on actually tests if count fits ssize_t or not
and returns EINVAL otherwise.

http://lxr.free-electrons.com/source/fs/read_write.c#L348

So the man page should state so.

This is also important in terms of conformance/getting closer to POSIX. 
Quotes from POSIX.1-2008:

http://pubs.opengroup.org/onlinepubs/9699919799/functions/read.html

> If the value of nbyte is greater than {SSIZE_MAX}, the result is implementation-defined.

where "implementation-defined" is defined as:

http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap01.html#tag_01_05_02

> Describes a value or behavior that is not defined by POSIX.1-2008 but is selected by an implementor. (...snip...)
> 
> The implementor shall document such a value or behavior so that it can be used correctly by an application.

So it cannot be just "unspecified".

Moreover, write(2) doesn't say anything about the SSIZE_MAX limit.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
