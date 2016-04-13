From: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 4/4] Makefile: Remove line continuation at end of "install"
 recipe
Date: Thu, 14 Apr 2016 01:18:24 +0200
Message-ID: <20160414011824.11e3fc6e.alex.miller@gmx.de>
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
index 1b64974..61a1164 100644
--- a/Makefile
+++ b/Makefile
@@ -59,7 +59,7 @@ install:
 	for i in man?; do \
 		install -d -m 755 $(DESTDIR)$(MANDIR)/"$$i" || exit $$?; \
 		install -m 644 "$$i"/* $(DESTDIR)$(MANDIR)/"$$i" || exit $$?; \
-	done; \
+	done
 
 # Check if groff reports warnings (may be words of sentences not displayed)
 # from http://lintian.debian.org/tags/manpage-has-errors-from-man.html
-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
