From: Gleb Fotengauer-Malinovskiy <glebfm-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] umount.2: fix typo
Date: Wed, 1 Apr 2015 19:10:40 +0300
Message-ID: <20150401161012.GA16041@glebfm.cloud.tilaa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Gleb Fotengauer-Malinovskiy <glebfm-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
---
 man2/umount.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/umount.2 b/man2/umount.2
index 149da1a..7c4452a 100644
--- a/man2/umount.2
+++ b/man2/umount.2
@@ -164,7 +164,7 @@ are available in glibc since version 2.11.
 These functions are Linux-specific and should not be used in
 programs intended to be portable.
 .SH NOTES
-.SS umount() amd shared mount points
+.SS umount() and shared mount points
 Shared mount points cause any mount activity on a mount point, including
 .BR umount (2)
 operations, to be forwarded to every shared mount point in the
-- 
glebfm
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
