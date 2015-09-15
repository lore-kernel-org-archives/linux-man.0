From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 104601] New: Description of getname-related syscalls wrong
Date: Tue, 15 Sep 2015 15:28:35 +0000
Message-ID: <bug-104601-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=104601

            Bug ID: 104601
           Summary: Description of getname-related syscalls wrong
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: mattator-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No

For instance, if I look at the getsockname man page on ubuntu 15.04:
===
       getsockname()  returns  the current address to which the socket sockfd
is bound, in the buffer
       pointed to by addr.  The addrlen argument should be initialized  to 
indicate  the  amount  of
       space  (in  bytes)  pointed  to  by addr.  On return it contains the
actual size of the socket
       address.

       The returned address is truncated if the buffer provided is too
       small; in this case, addrlen will return a value greater than was
       supplied to the call.
===

I've looked at some getname function for different protocols in the 4.3 and
3.14 kernels and the addrlen parameter was never considered as an input or the
returned sockaddr* truncated.
This was the cause of a stack smashing in a userspace application I use and
possibly many others so I ranked it high.

More details here:
http://stackoverflow.com/questions/32522031/mismatch-between-manpage-and-kernel-behavior-about-getsockname

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
