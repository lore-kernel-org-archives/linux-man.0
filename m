From: Nikola =?ISO-8859-1?Q?Forr=F3?= <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] recvmmsg.2, sendmmsg.2: point out that error handling is
 unreliable
Date: Thu, 26 Oct 2017 15:06:07 +0200
Message-ID: <1509023167.2859.2.camel@redhat.com>
Reply-To: nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

When an underlying recvmsg call fails after at least one message has
been received, recvmmsg stores the error code into sock->sk->sk_err,
and returns it on a subsequent call. But it doesn't take into account
that the error can be owerwritten in the meantime, for example in ICMP
error handler when an ICMP packet arrives.

When an underlying sendmsg call fails after at least one message has
been sent, sendmmsg discards the error code and expects the caller to
retry at first failed message. But the error code returned from the
subsqeuent call can be different from the previously discarded one.

Reference:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/tree/net/socket.c

Signed-off-by: Nikola Forró <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man2/recvmmsg.2 | 12 ++++++++++++
 man2/sendmmsg.2 |  8 ++++++++
 2 files changed, 20 insertions(+)

diff --git a/man2/recvmmsg.2 b/man2/recvmmsg.2
index 3ff1b63a3..ca05b1d3a 100644
--- a/man2/recvmmsg.2
+++ b/man2/recvmmsg.2
@@ -160,6 +160,8 @@ In addition, the following error can occur:
 .B EINVAL
 .I timeout
 is invalid.
+.PP
+See also BUGS.
 .SH VERSIONS
 The
 .BR recvmmsg ()
@@ -179,6 +181,16 @@ so that if up to
 .I vlen\-1
 datagrams are received before the timeout expires,
 but then no further datagrams are received, the call will block forever.
+.PP
+If an error occurs on an underlying
+.BR recvmsg (2)
+call after at least one message has been received, the call succeeds,
+and returns the number of messages received. The error code is expected
+to be returned on a subsequent call to
+.BR recvmmsq ().
+However, in the current implementation the error code can be overwritten
+in the meantime by an unrelated network event on a socket,
+for example an incoming ICMP packet.
 .SH EXAMPLE
 .PP
 The following program uses
diff --git a/man2/sendmmsg.2 b/man2/sendmmsg.2
index e61ed0b4e..2f4bbeb01 100644
--- a/man2/sendmmsg.2
+++ b/man2/sendmmsg.2
@@ -134,6 +134,7 @@ is set to indicate the error.
 Errors are as for
 .BR sendmsg (2).
 An error is returned only if no datagrams could be sent.
+See also BUGS.
 .\" commit 728ffb86f10873aaf4abd26dde691ee40ae731fe
 .\"     ... only return an error if no datagrams could be sent.
 .\"     If less than the requested number of messages were sent, the application
@@ -165,6 +166,13 @@ is capped to
 .\"     For error handling an application using sendmmsg needs to retry at
 .\"     the first unsent message, so capping is simpler and requires less
 .\"     application logic than returning EINVAL.
+.SH BUGS
+If an error occurs on an underlying
+.BR sendmsg (2)
+call after at least one message has been sent, the call succeeds,
+and returns the number of messages sent. The error code is lost.
+The caller can retry starting at first failed message, but there is
+no guarantee that the error returned will be the same as the previous one.
 .SH EXAMPLE
 The example below uses
 .BR sendmmsg ()
-- 
2.13.6

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
