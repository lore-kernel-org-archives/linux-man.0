From: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 6/7] Makefile: Avoid compressing very small files in
 gz/bz2/xz targets
Date: Sat, 16 Apr 2016 03:09:03 +0200
Message-ID: <20160416030903.624571b1.alex.miller@gmx.de>
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

Compressing very small files has only disadvantages. There is
the overhead of running a decompressor, and because of the
added file headers they become even bigger.

Since the scan and uninstall targets now properly handle
mixing compressed and uncompressed files, it becomes possible
to avoid compression where it's not beneficial.

Signed-off-by: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
---
If you want to support this feature but disable it by default,
you can set NOCOMPRESS_SIZE=0.
---
 Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 86b1568..2c5719c 100644
--- a/Makefile
+++ b/Makefile
@@ -10,6 +10,7 @@ MANDIR=$(prefix)/share/man
 GZIP=gzip -9
 BZIP2=bzip2 -9
 LZMA=xz --lzma2=dict=1M,pb=0
+NOCOMPRESS_SIZE=256
 
 all: screen remove install
 
@@ -53,15 +54,15 @@ uninstall remove:
 
 gz:
 	find man? -mindepth 1 -maxdepth 1 -name '*.[gx]z' -o -name '*.bz2' \
-		-o -exec $(GZIP) '{}' +
+		-o -size +$(NOCOMPRESS_SIZE)c -exec $(GZIP) '{}' +
 
 bz2:
 	find man? -mindepth 1 -maxdepth 1 -name '*.[gx]z' -o -name '*.bz2' \
-		-o -exec $(BZIP2) '{}' +
+		-o -size +$(NOCOMPRESS_SIZE)c -exec $(BZIP2) '{}' +
 
 xz:
 	find man? -mindepth 1 -maxdepth 1 -name '*.[gx]z' -o -name '*.bz2' \
-		-o -exec $(LZMA) '{}' +
+		-o -size +$(NOCOMPRESS_SIZE)c -exec $(LZMA) '{}' +
 
 uncompress:
 	find man? -name '*.gz' -exec gunzip '{}' + \
-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
