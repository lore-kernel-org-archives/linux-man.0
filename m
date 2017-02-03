From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] mtrace.1: ffix
Date: Sat,  4 Feb 2017 00:37:49 +0100
Message-ID: <20170203233749.957-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man1/mtrace.1 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man1/mtrace.1 b/man1/mtrace.1
index 975500018..35e96ae58 100644
--- a/man1/mtrace.1
+++ b/man1/mtrace.1
@@ -57,7 +57,8 @@ Print help and exit.
 Print version information and exit.
 .SH BUGS
 For bug reporting instructions, please see:
-<http://www.gnu.org/software/libc/bugs.html>.
+.UR http://www.gnu.org/software/libc/bugs.html
+.UE .
 .SH SEE ALSO
 .BR memusage (1),
 .BR mtrace (3)
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
