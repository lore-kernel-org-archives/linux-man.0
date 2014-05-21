From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] stdio.3: tfix
Date: Wed, 21 May 2014 23:35:18 +0200
Message-ID: <1400708118-19390-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=748887

Reported-by: Colin Williams <colinwilliams1968-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man3/stdio.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/stdio.3 b/man3/stdio.3
index 6002353..0058819 100644
--- a/man3/stdio.3
+++ b/man3/stdio.3
@@ -106,7 +106,7 @@ opened explicitly:
 .I standard input
 (for reading conventional input),
 .I standard output
-(for writing conventional input), and
+(for writing conventional output), and
 .I standard error
 (for writing diagnostic output).
 These streams are abbreviated
-- 
2.0.0.rc2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
