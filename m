From: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 2/4] Makefile: Improve recipe for "check-groff-warnings"
 target
Date: Thu, 14 Apr 2016 01:16:55 +0200
Message-ID: <20160414011655.2bef8bbf.alex.miller@gmx.de>
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

* Fix race condition (don't remove and re-create $GROFF_LOG repeatedly),
* check for failure to create $GROFF_LOG,
* use $TMPDIR if set instead of hardcoded "/tmp",
* quote variables,
* use clobbering redirection (just in case),
* don't create unnecessary subshells,
* add a semicolon for consistency.

Signed-off-by: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
---
Note: I didn't remove the trailing space from 'echo "$$i: "' since
some scripts out there may rely on the output format.
---
 Makefile | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 1003843..6531641 100644
--- a/Makefile
+++ b/Makefile
@@ -64,15 +64,15 @@ install:
 # Check if groff reports warnings (may be words of sentences not displayed)
 # from http://lintian.debian.org/tags/manpage-has-errors-from-man.html 
 check-groff-warnings:
-	GROFF_LOG=$$(mktemp /tmp/manpages-checksXXXX); \
+	GROFF_LOG="$$(mktemp --tmpdir manpages-checksXXXX)" || exit $$?; \
 	for i in man?/*.[1-9]; \
 	do \
-		if grep -q 'SH.*NAME' $$i; then \
-			LC_ALL=en_US.UTF-8 MANWIDTH=80 man --warnings -E UTF-8 -l $$i > /dev/null 2>$$GROFF_LOG; \
-			[ -s $$GROFF_LOG ] && ( echo "$$i: " ; cat $$GROFF_LOG ; echo "" ); \
-			rm $$GROFF_LOG 2>/dev/null; \
-		fi \
-	done
+		if grep -q 'SH.*NAME' "$$i"; then \
+			LC_ALL=en_US.UTF-8 MANWIDTH=80 man --warnings -E UTF-8 -l "$$i" > /dev/null 2>| "$$GROFF_LOG"; \
+			[ -s "$$GROFF_LOG" ] && { echo "$$i: "; cat "$$GROFF_LOG"; echo; }; \
+		fi; \
+	done; \
+	rm -f "$$GROFF_LOG"
 
 # someone might also want to look at /var/catman/cat2 or so ...
 # a problem is that the location of cat pages varies a lot
-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
