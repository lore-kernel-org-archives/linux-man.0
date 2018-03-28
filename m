From: =?UTF-8?q?J=C3=BCrg=20Billeter?= <j@bitron.ch>
Subject: [PATCH] readv.2, io_submit.2: Document RWF_APPEND added in Linux 4.16
Date: Wed, 28 Mar 2018 21:49:11 +0200
Message-ID: <20180328194911.49632-1-j@bitron.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mtk.manpages@gmail.com
Cc: linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?J=C3=BCrg=20Billeter?= <j@bitron.ch>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jürg Billeter <j@bitron.ch>
---
 man2/io_submit.2 | 10 ++++++++++
 man2/readv.2     | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/man2/io_submit.2 b/man2/io_submit.2
index 397fd0b75..79fcdfee4 100644
--- a/man2/io_submit.2
+++ b/man2/io_submit.2
@@ -111,6 +111,16 @@ field of the
 .I io_event
 structure (see
 .BR io_getevents (2)).
+.TP
+.BR RWF_APPEND " (since Linux 4.16)"
+.\" commit e1fc742e14e01d84d9693c4aca4ab23da65811fb
+Append data to the end of the file.
+See the description of the flag of the same name in
+.BR pwritev2 (2)
+as well as the description of
+.B O_APPEND
+in
+.BR open (2).
 .RE
 .TP
 .I aio_lio_opcode
diff --git a/man2/readv.2 b/man2/readv.2
index b3b7b9658..668fba576 100644
--- a/man2/readv.2
+++ b/man2/readv.2
@@ -248,6 +248,16 @@ to
 .BR EAGAIN .
 Currently, this flag is meaningful only for
 .BR preadv2 ().
+.TP
+.BR RWF_APPEND " (since Linux 4.16)"
+.\" commit e1fc742e14e01d84d9693c4aca4ab23da65811fb
+Provide a per-write equivalent of the
+.B O_APPEND
+.BR open (2)
+flag.
+This flag is meaningful only for
+.BR pwritev2 (),
+and its effect applies only to the data range written by the system call.
 .SH RETURN VALUE
 On success,
 .BR readv (),
-- 
2.16.2
