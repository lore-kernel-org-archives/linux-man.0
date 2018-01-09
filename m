From: Nikola =?ISO-8859-1?Q?Forr=F3?= <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2] recvmmsg.2, sendmmsg.2: point out that error handling is
 unreliable
Date: Tue, 09 Jan 2018 14:54:09 +0100
Message-ID: <1515506049.3260.40.camel@redhat.com>
Reply-To: nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

If an error occurs after at least one message has been received,
recvmmsg() call succeeds, and returns the number of messages received.
The error code is expected to be returned on a subsequent call.
In the current implementation, however, the error code can be overwritten
in the meantime by an unrelated network event on a socket, for example
an incoming ICMP packet.

If an error occurs after at least one message has been sent,
sendmmsg() call succeeds, and returns the number of messages sent.
The error code is lost. The caller can retry the transmission,
starting at first failed message, but there is no guarantee that,
if an error is returned, it will be the same as the one that was lost
on the previous call.

Reference:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/tree/net/socket.c

Signed-off-by: Nikola Forró <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man2/recvmmsg.2 | 10 ++++++++++
 man2/sendmmsg.2 |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/man2/recvmmsg.2 b/man2/recvmmsg.2
index e7dfe848a..7a1be5787 100644
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
@@ -179,6 +181,14 @@ so that if up to
 .I vlen\-1
 datagrams are received before the timeout expires,
 but then no further datagrams are received, the call will block forever.
+.PP
+If an error occurs after at least one message has been received,
+the call succeeds, and returns the number of messages received.
+The error code is expected to be returned on a subsequent call to
+.BR recvmmsq ().
+In the current implementation, however, the error code can be overwritten
+in the meantime by an unrelated network event on a socket,
+for example an incoming ICMP packet.
 .SH EXAMPLE
 .PP
 The following program uses
diff --git a/man2/sendmmsg.2 b/man2/sendmmsg.2
index a4895c1ac..ab08162bd 100644
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
+If an error occurs after at least one message has been sent,
+the call succeeds, and returns the number of messages sent.
+The error code is lost. The caller can retry the transmission,
+starting at first failed message, but there is no guarantee that,
+if an error is returned, it will be the same as the one that was lost
+on the previous call.
 .SH EXAMPLE
 The example below uses
 .BR sendmmsg ()
-- 
2.13.6

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
