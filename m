From: Christoph Hellwig <hch@infradead.org>
Subject: [PATCH] update the sync.2 man page
Date: Tue, 9 Feb 2016 08:21:34 -0800
Message-ID: <20160209162134.GA18634@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-fsdevel-owner@vger.kernel.org
To: linux-man@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Clarify the description a bit, and document the Linux data integrity
guarantees.

Signed-off-by: Christoph Hellwig <hch@lst.de>

diff --git a/man2/sync.2 b/man2/sync.2
index 5e222cb..28a42c4 100644
--- a/man2/sync.2
+++ b/man2/sync.2
@@ -35,7 +35,7 @@
 .\"
 .TH SYNC 2 2015-08-08 "Linux" "Linux Programmer's Manual"
 .SH NAME
-sync, syncfs \- commit buffer cache to disk
+sync, syncfs \- commit filesystem caches to disk
 .SH SYNOPSIS
 .B #include <unistd.h>
 .sp
@@ -64,8 +64,8 @@ _GNU_SOURCE
 .ad
 .SH DESCRIPTION
 .BR sync ()
-causes all buffered modifications to file metadata and data to be
-written to the underlying filesystems.
+causes all pending modifications to file system metadata and cached file
+data to be written to the underlying filesystems.
 
 .BR syncfs ()
 is like
@@ -108,16 +108,21 @@ In glibc 2.2.1 and earlier,
 it was "int sync(void)", and
 .BR sync ()
 always returned 0.
-.SH BUGS
+
 According to the standard specification (e.g., POSIX.1-2001),
 .BR sync ()
 schedules the writes, but may return before the actual
-writing is done.
-However, since version 1.3.20 Linux does actually wait.
-(This still does not guarantee data integrity: modern disks have
-large caches.)
+writing is done.  However Linux waits for I/O completions,
+and thus
+.BR sync ()
+or
+.BR syncfs ()
+provide the same guarantees as fsync called on every file in
+the system or filesystem respectively.
+.SH BUGS
+Before version 1.3.20 Linux did not wait for I/O to complete
+before returning.
 .SH SEE ALSO
-.BR bdflush (2),
 .BR fdatasync (2),
 .BR fsync (2),
 .BR sync (1)
