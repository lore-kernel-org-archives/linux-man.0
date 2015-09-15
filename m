From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 104561] New: Autobind in unix domain sockets always requires
 call to bind
Date: Tue, 15 Sep 2015 07:45:12 +0000
Message-ID: <bug-104561-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=104561

            Bug ID: 104561
           Summary: Autobind in unix domain sockets always requires call
                    to bind
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: a0vhv-zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org
        Regression: No

Created attachment 187571
  --> https://bugzilla.kernel.org/attachment.cgi?id=187571&action=edit
Example code that shows bind() is necessary for autobind

In "man 7 unix" it says:
"If a bind(2) call specifies addrlen as sizeof(sa_family_t), or the SO_PASSCRED
socket option was specified for a socket that was not explicitly bound to an
address, then the socket is autobound to an abstract address."

However, only setting SO_PASSCRED is not enough to autobind. You always have to
call bind, as you can see in the attached example. If you run it, every call
should succeed and getsockname reports that the autobind address has a size of
8 bytes.
Now remove lines 20-22, so the socket gets no longer explicitly bound.
getsockname reports that the address size is 2 bytes (because
bound_addr.sun_path is not used) and the call to "listen" fails.

So it seems the call to "bind" is necessary even if SO_PASSCRED is used.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
