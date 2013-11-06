From: Christoph Hellwig <hch@infradead.org>
Subject: [PATCH] fallocate.2: clarify the zeroing behavior
Date: Wed, 6 Nov 2013 05:52:31 -0800
Message-ID: <20131106135231.GA3882@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-fsdevel-owner@vger.kernel.org
To: linux-man@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Fallocate only zeroes space that did not previously contain data,
but leaves existing data untouched.

Signed-off-by: Christoph Hellwig <hch@lst.de>

diff --git a/man2/fallocate.2 b/man2/fallocate.2
index f5c395d..f577ba8 100644
--- a/man2/fallocate.2
+++ b/man2/fallocate.2
@@ -44,8 +44,7 @@ The default operation (i.e.,
 .I mode
 is zero) of
 .BR fallocate ()
-allocates and initializes to zero the disk space
-within the range specified by
+allocates the disk space within the range specified by
 .I offset
 and
 .IR len .
@@ -54,6 +53,11 @@ The file size (as reported by
 will be changed if
 .IR offset + len
 is greater than the file size.
+Any subregion withing the range specified by
+.I offset
+and
+.IR len .
+that did not contain data before the call will be initialized to zero.
 This default behavior closely resembles the behavior of the
 .BR posix_fallocate (3)
 library function,
