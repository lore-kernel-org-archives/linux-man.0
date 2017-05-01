From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 1/3] ioctl_console.2: tfix
Date: Mon,  1 May 2017 23:30:02 +0200
Message-ID: <20170501213004.2199-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/ioctl_console.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/ioctl_console.2 b/man2/ioctl_console.2
index fdae38d8b..44ad6597d 100644
--- a/man2/ioctl_console.2
+++ b/man2/ioctl_console.2
@@ -229,7 +229,7 @@ Sets 256-character screen font.
 Load font into the EGA/VGA character
 generator.
 .I argp
-points to a 8192 byte map, with 32 bytes per
+points to an 8192 byte map, with 32 bytes per
 character.
 Only the first
 .I N
-- 
2.13.0.rc0.306.g87b477812d

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
