From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] proc.5: ffix
Date: Mon, 25 Mar 2013 23:58:58 +0100
Message-ID: <1364252338-14762-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Fix a groff warning:
<standard input>:350: warning: macro `..' not defined
---
 man5/proc.5 |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 22b7cd0..b7cda37 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -347,7 +347,7 @@ The format of the file is:
 00652000-00655000 rw-p 00052000 08:02 173521      /usr/bin/dbus-daemon
 00e03000-00e24000 rw-p 00000000 00:00 0           [heap]
 00e24000-011f7000 rw-p 00000000 00:00 0           [heap]
-...
+\&...
 35b1800000-35b1820000 r-xp 00000000 08:02 135522  /usr/lib64/ld-2.15.so
 35b1a1f000-35b1a20000 r--p 0001f000 08:02 135522  /usr/lib64/ld-2.15.so
 35b1a20000-35b1a21000 rw-p 00020000 08:02 135522  /usr/lib64/ld-2.15.so
@@ -356,9 +356,9 @@ The format of the file is:
 35b1dac000-35b1fac000 ---p 001ac000 08:02 135870  /usr/lib64/libc-2.15.so
 35b1fac000-35b1fb0000 r--p 001ac000 08:02 135870  /usr/lib64/libc-2.15.so
 35b1fb0000-35b1fb2000 rw-p 001b0000 08:02 135870  /usr/lib64/libc-2.15.so
-...
+\&...
 f2c6ff8c000-7f2c7078c000 rw-p 00000000 00:00 0    [stack:986]
-...
+\&...
 7fffb2c0d000-7fffb2c2e000 rw-p 00000000 00:00 0   [stack]
 7fffb2d48000-7fffb2d49000 r-xp 00000000 00:00 0   [vdso]
 .fi
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
