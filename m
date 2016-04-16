From: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 7/7] Makefile: Mention xz in the instructive comment at top
Date: Sat, 16 Apr 2016 03:09:36 +0200
Message-ID: <20160416030936.3a28fcc6.alex.miller@gmx.de>
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
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 2c5719c..2c4aa6a 100644
--- a/Makefile
+++ b/Makefile
@@ -1,7 +1,8 @@
 # Do "make screen" first, if you want to protect already installed,
 # more up-to-date manual pages than the ones included in this package.
 # Do "make install" to copy the pages to their destination.
-# Do "make gz" or "make bz2" first if you use compressed source pages.
+# Do "make gz", "make bz2", or "make xz" first if you use compressed
+# source pages.
 
 DESTDIR=
 prefix?=/usr
-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
