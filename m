From: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 3/7] Makefile: Support compressed files for screen target
Date: Sat, 16 Apr 2016 02:59:45 +0200
Message-ID: <20160416025945.70bcdd4e.alex.miller@gmx.de>
References: <20160416022503.1df762cb.alex.miller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160416022503.1df762cb.alex.miller-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Now, make screen supports (optional, possibly different) compression
of the sources and installed man pages. Thus, allgz/allbz2/allxz/all
targets should update correctly even when switching compression types.

Signed-off-by: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
---
The formatting of the script is a bit unusual, but I wanted to keep
it compact and I think it's still readable. Feel free to add more
line breaks to the if blocks or use longer variable names if you
don't like it.
---
 Makefile | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index a14078c..8f2e25c 100644
--- a/Makefile
+++ b/Makefile
@@ -22,11 +22,29 @@ allxz: xz all
 screen:
 	mkdir -p not_installed
 	for i in man?/*; do \
-		if [ $(MANDIR)/"$$i" -nt "$$i" ]; then \
-			cmp -s $(MANDIR)/"$$i" "$$i" > /dev/null 2>&1; \
-			if [ "$$?" != 0 ]; then mv "$$i" not_installed; fi; \
-		fi; \
-	done
+		if b="$${i%.bz2}" && [ "$$b".bz2 = "$$i" ]; then c1=bunzip2; \
+		elif b="$${i%.gz}" && [ "$$b".gz = "$$i" ]; then c1=gunzip; \
+		elif b="$${i%.xz}" && [ "$$b".xz = "$$i" ]; then c1=unxz; \
+		else b="$$i"; c1=; fi; \
+		b=$(MANDIR)/"$$b"; \
+		if [ "$$b" -nt "$$i" ]; then c2=; \
+		elif [ "$$b".bz2 -nt "$$i" ]; then c2=bunzip2; b="$$b.bz2"; \
+		elif [ "$$b".gz -nt "$$i" ]; then c2=gunzip; b="$$b.gz"; \
+		elif [ "$$b".xz -nt "$$i" ]; then c2=unxz; b="$$b.xz"; \
+		else continue; fi; \
+		if [ -z "$$c1$$c2" ]; then \
+			cmp -s "$$i" "$$b"; \
+		elif [ -z "$$c1" ]; then \
+			$$c2 -c "$$b" | cmp -s "$$i" -; \
+		elif [ -z "$$c2" ]; then \
+			$$c1 -c "$$i" | cmp -s - "$$b"; \
+		else \
+			[ "$$c1" = "$$c2" ] && cmp -s "$$i" "$$b" || \
+			$$c1 -c "$$i" | { $$c2 -c "$$b" | \
+				cmp -s /dev/fd/3 -; } 3<&0; \
+		fi || mv "$$i" not_installed; \
+	done; \
+	rmdir not_installed 2> /dev/null; true
 
 uninstall remove:
 	find man? -mindepth 1 -maxdepth 1 -print | \
-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
