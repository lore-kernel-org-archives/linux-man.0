From: Stefan Hajnoczi <stefanha-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] vsock.7: clarify send(2)/recv(2) families of system calls
Date: Tue, 12 Dec 2017 09:34:48 +0000
Message-ID: <20171212093448.8192-1-stefanha@redhat.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Dexuan Cui <decui-0li6OtcxBFHby3iVrkZq2A@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jorgen Hansen <jhansen-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, Stefan Hajnoczi <stefanha-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Sockets support both read(2)/write(2) and send(2)/recv(2) system calls.
Each of these is actually a family of multiple system calls such as
send(2), sendfile(2), sendmsg(2), sendmmsg(2), and sendto(2).

This patch claries which families of system calls can be used.

Signed-off-by: Stefan Hajnoczi <stefanha-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man7/vsock.7 | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/man7/vsock.7 b/man7/vsock.7
index b6c394302..628200aa8 100644
--- a/man7/vsock.7
+++ b/man7/vsock.7
@@ -47,11 +47,15 @@ address using
 and then calling
 .BR listen (2).
 .PP
-Data is transferred using the usual
+Data is transmitted using the
 .BR send (2)
-and
+or
+.BR write (2)
+families of system calls and data is received using the
 .BR recv (2)
-family of socket system calls.
+or
+.BR read (2)
+families of system calls.
 .SS Address format
 A socket address is defined as a combination of a 32-bit Context Identifier
 (CID) and a 32-bit port number.
@@ -163,12 +167,13 @@ Operation not supported.
 This includes:
 the
 .B MSG_OOB
-flag that is not implemented for
-.BR sendmsg (2)
-and
+flag that is not implemented for the
+.BR send (2)
+family of syscalls and
 .B MSG_PEEK
-for
-.BR recvmsg (2).
+for the
+.BR recv (2)
+family of syscalls.
 .TP
 .B EPROTONOSUPPORT
 Invalid socket protocol number.
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
