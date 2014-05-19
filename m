From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 01/20] open.2: spfix
Date: Tue, 20 May 2014 01:02:07 +0200
Message-ID: <1400540546-25578-2-git-send-email-rv@rasmusvillemoes.dk>
References: <1400540546-25578-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400540546-25578-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/open.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/open.2 b/man2/open.2
index 35061c3..d22bb1b 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -717,7 +717,7 @@ as described above).
 requires support by the underlying filesystem;
 only a subset of Linux filesystems provide that support.
 In the initial implementation, support was provided in
-the ex2, ext3, ext4, UDF, Minix, and shmem filesystems.
+the ext2, ext3, ext4, UDF, Minix, and shmem filesystems.
 XFS support was added
 .\" commit 99b6436bc29e4f10e4388c27a3e4810191cc4788
 .\" commit ab29743117f9f4c22ac44c13c1647fb24fb2bafe
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
