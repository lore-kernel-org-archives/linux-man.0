From: Fang Wenqi <anton.fang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] statfs.2: Add definition EXT4_SUPER_MAGIC = 0xEF53
Date: Wed, 12 May 2010 11:22:46 +0800
Message-ID: <1273634566-4159-1-git-send-email-antonf@turbolinux.com.cn>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nicolas.francois-Fa7rcPG4DJn7nK0/Xc0eeg@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: antonf-Qbad7dcHD6Y0jvc7zYWOs/8+0UxHXcjY@public.gmane.org, anton.fang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Fang Wenqi <antonf-Qbad7dcHD6Y0jvc7zYWOs/8+0UxHXcjY@public.gmane.org>
---
 man2/statfs.2 |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/man2/statfs.2 b/man2/statfs.2
index 73ec57f..36852af 100644
--- a/man2/statfs.2
+++ b/man2/statfs.2
@@ -73,6 +73,7 @@ File system types:
    EXT2_OLD_SUPER_MAGIC  0xEF51
    EXT2_SUPER_MAGIC      0xEF53
    EXT3_SUPER_MAGIC      0xEF53
+   EXT4_SUPER_MAGIC      0xEF53
    HFS_SUPER_MAGIC       0x4244
    HPFS_SUPER_MAGIC      0xF995E849
    HUGETLBFS_MAGIC       0x958458f6
-- 
1.6.6.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
