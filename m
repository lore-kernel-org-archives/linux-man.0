From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] bootparam.7: tfix
Date: Wed, 17 Jul 2013 22:05:56 -0400
Message-ID: <1374113157-4915-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/bootparam.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/bootparam.7 b/man7/bootparam.7
index fa4c5c3..89d8f72 100644
--- a/man7/bootparam.7
+++ b/man7/bootparam.7
@@ -42,7 +42,7 @@ When the kernel is booted directly by the BIOS (say from a floppy to
 which you copied a kernel using 'cp zImage /dev/fd0'),
 you have no opportunity to specify any parameters.
 So, in order to take advantage of this possibility you have to
-use boot loader software that is able to pass parameters, such as GRUB.
+use a boot loader software that is able to pass parameters, such as GRUB.
 
 .\" The LILO program (LInux LOader) written by Werner Almesberger is the
 .\" most commonly used.
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
