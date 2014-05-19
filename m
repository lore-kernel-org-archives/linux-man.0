From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 03/20] remap_file_pages.2: Fix prototype
Date: Tue, 20 May 2014 01:02:09 +0200
Message-ID: <1400540546-25578-4-git-send-email-rv@rasmusvillemoes.dk>
References: <1400540546-25578-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400540546-25578-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The pgoff argument has type size_t, not ssize_t (and in the kernel it
is unsigned long).
---
 man2/remap_file_pages.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/remap_file_pages.2 b/man2/remap_file_pages.2
index 50c6ce2..e7879fd 100644
--- a/man2/remap_file_pages.2
+++ b/man2/remap_file_pages.2
@@ -34,7 +34,7 @@ remap_file_pages \- create a nonlinear file mapping
 .B #include <sys/mman.h>
 .sp
 .BI "int remap_file_pages(void *" addr ", size_t " size ", int " prot ,
-.BI "                     ssize_t " pgoff ", int " flags );
+.BI "                     size_t " pgoff ", int " flags );
 .fi
 .SH DESCRIPTION
 The
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
