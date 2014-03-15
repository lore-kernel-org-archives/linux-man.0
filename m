From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: [PATCH] fts.3 is not available in LFS builds
Date: Sat, 15 Mar 2014 06:54:16 -0700
Message-ID: <20140315135416.GA10430@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

As pointed out during a recent discussion on libc-hacker the fts(3)
APIs can't be used with large file offsets:

	https://sourceware.org/bugzilla/show_bug.cgi?id=15838

The manpage should mention this.  Note: the text probably needs some
better formatting at least, but I couldn't come up with proper markup
for compiler arguments.

Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>

diff --git a/man3/fts.3 b/man3/fts.3
index 9374463..2b14c0d 100644
--- a/man3/fts.3
+++ b/man3/fts.3
@@ -774,6 +774,10 @@ The options were invalid.
 These functions are available in Linux since glibc2.
 .SH CONFORMING TO
 4.4BSD.
+.SH BUGS
+All the APIs described in this manpage are not safe when compiling
+a program using the LFS APIs, e.g. by using
+-D_FILE_OFFSET_BITS=64.
 .\" The following statement is years old, and seems no closer to
 .\" being true -- mtk
 .\" The
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
