From: Bernhard Walle <bernhard-X9USDgGjgfuzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] core.5: Mention that %E exists since Linux 3.0
Date: Wed, 22 Jan 2014 21:33:10 +0100
Message-ID: <1390422790-5482-1-git-send-email-bernhard@bwalle.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

'%E' in the 'core_pattern' has been introduced in kernel commit
57cc083ad9e1bfeeb4a0ee831e7bb008c8865bf0 which was included in
version 3.0. Add that information to the manual page.

Signed-off-by: Bernhard Walle <bernhard-X9USDgGjgfuzQB+pC5nmwQ@public.gmane.org>
---
 man5/core.5 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man5/core.5 b/man5/core.5
index 551f4a3..4855829 100644
--- a/man5/core.5
+++ b/man5/core.5
@@ -150,7 +150,8 @@ executable filename (without path prefix)
 .TP
 %E
 pathname of executable,
-with slashes (\(aq/\(aq) replaced by exclamation marks (\(aq!\(aq).
+with slashes (\(aq/\(aq) replaced by exclamation marks (\(aq!\(aq)
+(since Linux 3.0).
 .TP
 %c
 core file size soft resource limit of crashing process (since Linux 2.6.24)
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
