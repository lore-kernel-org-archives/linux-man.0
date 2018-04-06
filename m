From: =?UTF-8?q?J=C3=BCrg=20Billeter?= <j@bitron.ch>
Subject: [PATCH v2] readv.2, io_submit.2: Document RWF_APPEND added in Linux 4.16
Date: Fri,  6 Apr 2018 15:51:06 +0200
Message-ID: <20180406135106.30342-1-j@bitron.ch>
References: <1f559be3-93df-ccdd-02dc-39c83c83a8c9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1f559be3-93df-ccdd-02dc-39c83c83a8c9@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mtk.manpages@gmail.com
Cc: linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?J=C3=BCrg=20Billeter?= <j@bitron.ch>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jürg Billeter <j@bitron.ch>
---
Changes since version 1:
- Explain offset handling

 man2/io_submit.2 | 13 +++++++++++++
 man2/readv.2     | 17 +++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/man2/io_submit.2 b/man2/io_submit.2
index 397fd0b75..25961138a 100644
--- a/man2/io_submit.2
+++ b/man2/io_submit.2
@@ -111,6 +111,19 @@ field of the
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
+The
+.I aio_offset
+field is ignored. The file offset is not changed.
 .RE
 .TP
 .I aio_lio_opcode
diff --git a/man2/readv.2 b/man2/readv.2
index b3b7b9658..9ef250e11 100644
--- a/man2/readv.2
+++ b/man2/readv.2
@@ -248,6 +248,23 @@ to
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
+The
+.I offset
+argument does not affect the write operation, the data is always appended
+to the end of the file. However, if the
+.I offset
+argument is \-1, the current file offset is updated.
+This matches the behavior when the file is opened in append mode.
 .SH RETURN VALUE
 On success,
 .BR readv (),
-- 
2.16.3
