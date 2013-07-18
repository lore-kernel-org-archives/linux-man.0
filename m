From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] bootparam.7: tfix
Date: Wed, 17 Jul 2013 22:05:57 -0400
Message-ID: <1374113157-4915-2-git-send-email-taffit@debian.org>
References: <1374113157-4915-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374113157-4915-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/bootparam.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/bootparam.7 b/man7/bootparam.7
index 89d8f72..b255e01 100644
--- a/man7/bootparam.7
+++ b/man7/bootparam.7
@@ -427,7 +427,7 @@ a 'ramdisk=N' parameter to tell its size.
 (This could also be set in the kernel image at compile time.)
 These days ram disks use the buffer cache, and grow dynamically.
 For a lot of information in conjunction with the new ramdisk
-setup), see the kernel source file
+setup, see the kernel source file
 .IR Documentation/blockdev/ramdisk.txt
 .RI ( Documentation/ramdisk.txt
 in older kernels).
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
