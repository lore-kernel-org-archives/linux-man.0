From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 137351] MSG_NOSIGNAL not documented in man 2 recv, OR misprint
 in man recvmsg in the line "This can be avoided by passing the MSG_NOSIGNAL
 flag to sendmsg(2) or recvmsg(2)."
Date: Sun, 24 Jul 2016 20:35:29 +0000
Message-ID: <bug-137351-11311-BseHQYJKeN@https.bugzilla.kernel.org/>
References: <bug-137351-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-137351-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=137351

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #3 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Applied the patch below. Closing this bug...

diff --git a/man7/unix.7 b/man7/unix.7
index e111734..0d44dd6 100644
--- a/man7/unix.7
+++ b/man7/unix.7
@@ -518,9 +518,9 @@ is sent as well.
 This can be avoided by passing the
 .B MSG_NOSIGNAL
 flag to
-.BR sendmsg (2)
+.BR send (2)
 or
-.BR recvmsg (2).
+.BR sendmsg (2).
 .TP
 .B EPROTONOSUPPORT
 Passed protocol is not

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
