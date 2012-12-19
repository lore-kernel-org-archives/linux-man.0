From: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Subject: [PATCH] remap_file_pages.2: Not actually useful on real files.
Date: Wed, 19 Dec 2012 14:12:33 -0800
Message-ID: <5de30c3a21531919712fc7df213c18b46e521225.1355955125.git.luto@amacapital.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Linux commit 3ee6dafc677a68e461a7ddafc94a580ebab80735 caused
remap_file_pages to be emulated when used on real file.

Signed-off-by: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
---
 man2/remap_file_pages.2 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/man2/remap_file_pages.2 b/man2/remap_file_pages.2
index f96f594..f6dee99 100644
--- a/man2/remap_file_pages.2
+++ b/man2/remap_file_pages.2
@@ -148,6 +148,12 @@ The
 .BR remap_file_pages ()
 system call appeared in Linux 2.5.46;
 glibc support was added in version 2.3.3.
+
+.BR remap_file_pages ()
+has no performance advantage over
+.BR mmap (2)
+when used on real (as opposed to purely in-memory) files as of Linux 2.6.23:
+on real files it creates a separate vma for each range.
 .SH "CONFORMING TO"
 The
 .BR remap_file_pages ()
-- 
1.7.11.7

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
