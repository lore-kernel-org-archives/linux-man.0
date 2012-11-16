From: YOSHIFUJI Hideaki <yoshfuji-VfPWfsRibaP+Ru+s062T9g@public.gmane.org>
Subject: [RFC] socket.7: Describe sockaddr and sockaddr_storage
 structures.
Date: Sat, 17 Nov 2012 02:29:02 +0900
Message-ID: <201211161729.qAGHT2t5015672@94.43.138.210.xn.2iij.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: yoshfuji-VfPWfsRibaP+Ru+s062T9g@public.gmane.org
List-Id: linux-man@vger.kernel.org

Please review.

sockaddr_storage{}, which is useful for protocol independent
programming, is not documented at all.

Reference:

	RFC 3542

Signed-off-by: YOSHIFUJI Hideaki <yoshfuji-VfPWfsRibaP+Ru+s062T9g@public.gmane.org>
---
 man7/socket.7 |   39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/man7/socket.7 b/man7/socket.7
index ec1054a..50a59bb 100644
--- a/man7/socket.7
+++ b/man7/socket.7
@@ -198,6 +198,45 @@ must be installed via
 See the
 .I Signals
 discussion below.
+.SS Socket Address Structures
+.BR connect (2),
+.BR bind (2),
+.BR accept (2),
+.BR getsockname (2),
+.BR getpeername (2)
+and other functions take an opaque pointer to struct
+.IR sockaddr ,
+which contains at least the following element:
+.sp
+.in +4n
+.nf
+    sa_family_t sa_family;
+.fi
+.in
+.PP
+Some socket functions take socket address structure
+to be filled.  To define unified socket address
+buffer for multiple protocols, struct
+.I sockaddr_storage
+is provided, which contains at least the following element:
+.sp
+.in +4n
+.nf
+    sa_family_t ss_family;
+.fi
+.in
+.PP
+.I sockaddr_storage
+is suitable to accomodate all supported protocol specific socket
+address structures; it is large enough and is aligned properly.
+.PP
+Each socket address structure,
+.IR sockaddr ,
+.I sockaddr_storage
+and others has common initial element of
+.I sa_family_t
+type and can be used to determine protocol specific socket
+address structure.
 .SS Socket Options
 These socket options can be set by using
 .BR setsockopt (2)
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
