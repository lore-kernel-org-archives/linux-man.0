From: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 3/4] Makefile: wsfix (trailing space)
Date: Thu, 14 Apr 2016 01:17:42 +0200
Message-ID: <20160414011742.367b3b00.alex.miller@gmx.de>
References: <20160414010434.1a7bdcfc.alex.miller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160414010434.1a7bdcfc.alex.miller-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 6531641..1b64974 100644
--- a/Makefile
+++ b/Makefile
@@ -62,7 +62,7 @@ install:
 	done; \
 
 # Check if groff reports warnings (may be words of sentences not displayed)
-# from http://lintian.debian.org/tags/manpage-has-errors-from-man.html 
+# from http://lintian.debian.org/tags/manpage-has-errors-from-man.html
 check-groff-warnings:
 	GROFF_LOG=$$(mktemp --tmpdir manpages-checksXXXX) || exit $$?; \
 	for i in man?/*.[1-9]; \
-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
