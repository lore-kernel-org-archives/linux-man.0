From: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Subject: [PATCH] unix.7: Explain that MSG_NOSIGNAL is useless for recvmsg(2)
Date: Fri, 22 Jul 2016 08:45:22 +0200
Message-ID: <20160722064522.5159-1-laurent.georget@supelec.fr>
References: <bug-137351-11311@https.bugzilla.kernel.org/>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-137351-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

recvmsg(2) never causes a "Broken pipe" error but the unix(7) man page implies
that MSG_NOSIGNAL can be used in the flags of recvmsg(2) to avoid sending a
SIGPIPE. Fixes Bug 137351.

Signed-Off-By: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>

---
 man7/unix.7 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

Hi Michael,

I found the culprit line in unix(7). It can be misleading indeed because it
that it makes sense to use MSG_NOSIGNAL as a flag to recvmsg(2) to avoid a
SIGPIPE but recvmsg(2) actually never triggers such an error. I propose the
patch below to fix this.

Best regards,

Laurent Georget

diff --git a/man7/unix.7 b/man7/unix.7
index 82715f9..fce5eb2 100644
--- a/man7/unix.7
+++ b/man7/unix.7
@@ -515,12 +515,12 @@ Remote socket was closed on a stream socket.
 If enabled, a
 .B SIGPIPE
 is sent as well.
-This can be avoided by passing the
+Sending the signal can be avoided by passing the
 .B MSG_NOSIGNAL
 flag to
 .BR sendmsg (2)
-or
-.BR recvmsg (2).
+.RB ( recvmsg (2)
+never causes such an error).
 .TP
 .B EPROTONOSUPPORT
 Passed protocol is not
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
