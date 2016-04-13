From: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/4] Makefile: Don't leave $(GROFF_LOG) files behind
Date: Thu, 14 Apr 2016 01:13:04 +0200
Message-ID: <20160414011304.289a6494.alex.miller@gmx.de>
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

Convert "GROFF_LOG" into a shell variable local to the
recipe for "check-groff-warnings" target such that the
temporary file is only created when needed.

Signed-off-by: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
---
 Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 237310d..1003843 100644
--- a/Makefile
+++ b/Makefile
@@ -63,14 +63,14 @@ install:
 
 # Check if groff reports warnings (may be words of sentences not displayed)
 # from http://lintian.debian.org/tags/manpage-has-errors-from-man.html 
-GROFF_LOG := $(shell mktemp /tmp/manpages-checksXXXX)
 check-groff-warnings:
+	GROFF_LOG=$$(mktemp /tmp/manpages-checksXXXX); \
 	for i in man?/*.[1-9]; \
 	do \
 		if grep -q 'SH.*NAME' $$i; then \
-			LC_ALL=en_US.UTF-8 MANWIDTH=80 man --warnings -E UTF-8 -l $$i > /dev/null 2>$(GROFF_LOG); \
-			[ -s $(GROFF_LOG) ] && ( echo "$$i: " ; cat $(GROFF_LOG) ; echo "" ); \
-			rm $(GROFF_LOG) 2>/dev/null; \
+			LC_ALL=en_US.UTF-8 MANWIDTH=80 man --warnings -E UTF-8 -l $$i > /dev/null 2>$$GROFF_LOG; \
+			[ -s $$GROFF_LOG ] && ( echo "$$i: " ; cat $$GROFF_LOG ; echo "" ); \
+			rm $$GROFF_LOG 2>/dev/null; \
 		fi \
 	done
 
-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
