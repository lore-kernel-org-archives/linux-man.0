From: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 4/7] Makefile: Skip already compressed files in gz/bz2/xz
 targets
Date: Sat, 16 Apr 2016 03:01:41 +0200
Message-ID: <20160416030141.505ec75c.alex.miller@gmx.de>
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

Signed-off-by: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
---
 Makefile | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 8f2e25c..cdedb4a 100644
--- a/Makefile
+++ b/Makefile
@@ -52,13 +52,16 @@ uninstall remove:
 		(cd $(MANDIR) && xargs -d \\n rm -f)
 
 gz:
-	for i in man?; do $(GZIP) "$$i"/*; done
+	find man? -mindepth 1 -maxdepth 1 -name '*.[gx]z' -o -name '*.bz2' \
+		-o -exec $(GZIP) '{}' +
 
 bz2:
-	for i in man?; do $(BZIP2) "$$i"/*; done
+	find man? -mindepth 1 -maxdepth 1 -name '*.[gx]z' -o -name '*.bz2' \
+		-o -exec $(BZIP2) '{}' +
 
 xz:
-	for i in man?; do $(LZMA) "$$i"/*; done
+	find man? -mindepth 1 -maxdepth 1 -name '*.[gx]z' -o -name '*.bz2' \
+		-o -exec $(LZMA) '{}' +
 
 # Use with
 #  make HTDIR=/some/dir HTOPTS=whatever html
-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
