From: Theodore Dubois <tblodt@icloud.com>
Subject: [PATCH] mmap.2: mmap with address NULL and MAP_FIXED results in EPERM
Date: Thu, 15 Jun 2017 12:09:01 -0700
Message-ID: <20170615190901.30119-1-tblodt@icloud.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mtk.manpages@gmail.com
Cc: linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, Theodore Dubois <tblodt@icloud.com>
List-Id: linux-man@vger.kernel.org

This can be verified with a simple test program. I'm not sure if this is
a kernel bug or a documentation bug, though...
---
 man2/mmap.2 | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/man2/mmap.2 b/man2/mmap.2
index d1942b52a..58361c837 100644
--- a/man2/mmap.2
+++ b/man2/mmap.2
@@ -515,6 +515,13 @@ was mounted no-exec.
 .\" (Since 2.4.25 / 2.6.0.)
 .TP
 .B EPERM
+The
+.I addr
+argument is 0 and
+.B MAP_FIXED
+is specified.
+.TP
+.B EPERM
 The operation was prevented by a file seal; see
 .BR fcntl (2).
 .TP
-- 
2.13.1
