From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 61911] incorrect sentence in the description of struct pollfd's
 events field
Date: Thu, 07 Nov 2013 18:19:24 +0000
Message-ID: <bug-61911-11311-xH5yLpLcyk@https.bugzilla.kernel.org/>
References: <bug-61911-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-61911-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=61911

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         Resolution|---                         |CODE_FIX

--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Thanks, Paolo. I'm not sure what I was thinking of when I wrote that text. I
applied the patch below.

diff --git a/man2/poll.2 b/man2/poll.2
index b0159d2..0a70065 100644
--- a/man2/poll.2
+++ b/man2/poll.2
@@ -89,12 +89,15 @@ The field
 is an input parameter, a bit mask specifying the events the application
 is interested in for the file descriptor
 .IR fd .
-If this field is specified as zero,
-then all events are ignored for
-.IR fd
-and
+This field may be specified as zero,
+in which case the only events that can be returned in
 .I revents
-returns zero.
+are
+.BR POLLHUP ,
+.BR POLLERR ,
+and
+.B POLLNVAL
+(see below).

 The field
 .I revents

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
