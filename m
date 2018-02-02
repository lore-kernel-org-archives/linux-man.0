From: Nikolay Borisov <nborisov-IBi9RG/b67k@public.gmane.org>
Subject: [PATCH] fallocate.2: Mention introduction of FALLOC_FL_ZERO_RANGE to btrfs
Date: Fri,  2 Feb 2018 13:07:20 +0200
Message-ID: <1517569640-18587-1-git-send-email-nborisov@suse.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nikolay Borisov <nborisov-IBi9RG/b67k@public.gmane.org>
List-Id: linux-man@vger.kernel.org

In 4.16 btrfs will have FALLOC_FL_ZERO_RANGE implemented, let's make it
known in the man page for fallocate

Signed-off-by: Nikolay Borisov <nborisov-IBi9RG/b67k@public.gmane.org>
---
 man2/fallocate.2 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/man2/fallocate.2 b/man2/fallocate.2
index 461b2be2b654..3f75ce78695e 100644
--- a/man2/fallocate.2
+++ b/man2/fallocate.2
@@ -238,6 +238,9 @@ ext4, for extent-based files (since Linux 3.15)
 .IP *
 SMB3 (since Linux 3.17)
 .\" commit 30175628bf7f521e9ee31ac98fa6d6fe7441a556
+.IP *
+BTRFS (since Linux 4.16)
+.\" commit f27451f229966874a8793995b8e6b74326d125df 
 .SS Increasing file space
 Specifying the
 .BR FALLOC_FL_INSERT_RANGE
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
