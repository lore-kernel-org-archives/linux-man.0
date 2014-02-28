From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] umount.2: Homogeneous wording, don't recall function name
Date: Sat,  1 Mar 2014 00:36:58 +0100
Message-ID: <1393630618-11940-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

See:
	man2/link.2:An invalid flag value was specified in
	man2/swapon.2:An invalid flag value was specified in
	man2/umount.2:An invalid flag value was specified in
	man2/unlink.2:An invalid flag value was specified in
---
 man2/umount.2 | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/man2/umount.2 b/man2/umount.2
index 86fff50..18a87a0 100644
--- a/man2/umount.2
+++ b/man2/umount.2
@@ -137,8 +137,7 @@ or
 .BR MNT_FORCE .
 .TP
 .BR EINVAL " (since Linux 2.6.34)"
-.BR umount2 ()
-was called with an invalid flag value in
+An invalid flag value was specified in
 .IR flags .
 .TP
 .B ENAMETOOLONG
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
