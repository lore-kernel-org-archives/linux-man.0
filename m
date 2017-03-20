From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] socketcall(2): document call argument
Date: Mon, 20 Mar 2017 01:25:46 -0400
Message-ID: <20170320052546.28268-1-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man2/socketcall.2 | 108 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/man2/socketcall.2 b/man2/socketcall.2
index d3b16dcb37d3..11e4c21f5ec5 100644
--- a/man2/socketcall.2
+++ b/man2/socketcall.2
@@ -26,6 +26,8 @@
 .SH NAME
 socketcall \- socket system calls
 .SH SYNOPSIS
+.B #include <linux/net.h>
+.sp
 .BI "int socketcall(int " call ", unsigned long *" args );
 .SH DESCRIPTION
 .BR socketcall ()
@@ -39,6 +41,112 @@ which are passed through to the appropriate call.
 User programs should call the appropriate functions by their usual names.
 Only standard library implementors and kernel hackers need to know about
 .BR socketcall ().
+.PP
+.TS
+tab(:);
+l l.
+\fIcall\fR:Man page
+T{
+.B SYS_SOCKET
+T}:T{
+.BR socket (2)
+T}
+T{
+.B SYS_BIND
+T}:T{
+.BR bind (2)
+T}
+T{
+.B SYS_CONNECT
+T}:T{
+.BR connect (2)
+T}
+T{
+.B SYS_LISTEN
+T}:T{
+.BR listen (2)
+T}
+T{
+.B SYS_ACCEPT
+T}:T{
+.BR accept (2)
+T}
+T{
+.B SYS_GETSOCKNAME
+T}:T{
+.BR getsockname (2)
+T}
+T{
+.B SYS_GETPEERNAME
+T}:T{
+.BR getpeername (2)
+T}
+T{
+.B SYS_SOCKETPAIR
+T}:T{
+.BR socketpair (2)
+T}
+T{
+.B SYS_SEND
+T}:T{
+.BR send (2)
+T}
+T{
+.B SYS_RECV
+T}:T{
+.BR recv (2)
+T}
+T{
+.B SYS_SENDTO
+T}:T{
+.BR sendto (2)
+T}
+T{
+.B SYS_RECVFROM
+T}:T{
+.BR recvfrom (2)
+T}
+T{
+.B SYS_SHUTDOWN
+T}:T{
+.BR shutdown (2)
+T}
+T{
+.B SYS_SETSOCKOPT
+T}:T{
+.BR setsockopt (2)
+T}
+T{
+.B SYS_GETSOCKOPT
+T}:T{
+.BR getsockopt (2)
+T}
+T{
+.B SYS_SENDMSG
+T}:T{
+.BR sendmsg (2)
+T}
+T{
+.B SYS_RECVMSG
+T}:T{
+.BR recvmsg (2)
+T}
+T{
+.B SYS_ACCEPT4
+T}:T{
+.BR accept4 (2)
+T}
+T{
+.B SYS_RECVMMSG
+T}:T{
+.BR recvmmsg (2)
+T}
+T{
+.B SYS_SENDMMSG
+T}:T{
+.BR sendmmsg (2)
+T}
+.TE
 .SH CONFORMING TO
 This call is specific to Linux, and should not be used in programs
 intended to be portable.
-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
