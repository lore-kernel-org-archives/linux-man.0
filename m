From: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 2/7] Makefile: Improve uninstall target for compressed man
 pages
Date: Sat, 16 Apr 2016 02:52:23 +0200
Message-ID: <20160416025223.396d0775.alex.miller@gmx.de>
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

Now sources and installed man pages may be in plain/gz/bz2/xz
format (independently). Any combination works reliably.

Signed-off-by: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
---
I would have preferred find -print0, but sed is line-based. As long
as there are no man page filenames with newlines, that's good enough.
---
 Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 95ffc2f..a14078c 100644
--- a/Makefile
+++ b/Makefile
@@ -29,9 +29,9 @@ screen:
 	done
 
 uninstall remove:
-	for i in man?/*; do \
-		rm -f $(MANDIR)/"$$i" $(MANDIR)/"$$i".gz $(MANDIR)/"$$i".bz2; \
-	done
+	find man? -mindepth 1 -maxdepth 1 -print | \
+		sed -e 's/\.\(gz\|bz2\|xz\)$$//; s/.*/&\n&.gz\n&.bz2\n&.xz/' | \
+		(cd $(MANDIR) && xargs -d \\n rm -f)
 
 gz:
 	for i in man?; do $(GZIP) "$$i"/*; done
-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
