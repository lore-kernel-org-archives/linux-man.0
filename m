From: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/7] Makefile: Use better xz options
Date: Sat, 16 Apr 2016 02:45:18 +0200
Message-ID: <20160416024518.7ec34d1f.alex.miller@gmx.de>
References: <20160416022503.1df762cb.alex.miller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160416022503.1df762cb.alex.miller-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

>From xz(1):
   The selected compression settings determine the memory requirements
   of the decompressor, thus using a too high preset level might make
   it painful to decompress the file on an old system with little RAM.
   Specifically, it's not a good idea to blindly use -9 for everything
   like it often is with gzip(1) and bzip2(1).

With small files like man pages, a large dictionary doesn't help at all;
so set a small dictionary size (1MiB). Also, "with text files having
one-byte alignment, setting pb=0 can improve compression slightly."
Otherwise the defaults are fine (specifically, the extreme presets
don't improve compression here and would be a waste of CPU cycles).

Signed-off-by: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
---
I made a few tests and the settings described above which should work
well in theory also did so in practice. The only surprise was that the
extreme presets actually compressed a little worse. Playing with the
"nice" parameter could squeeze out a few more bits, but I don't think
that would be appropriate; I don't want to optimize the settings for
the current man pages content.
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 237310d..95ffc2f 100644
--- a/Makefile
+++ b/Makefile
@@ -9,7 +9,7 @@ MANDIR=$(prefix)/share/man
 
 GZIP=gzip -9
 BZIP2=bzip2 -9
-LZMA=xz -9
+LZMA=xz --lzma2=dict=1M,pb=0
 
 all: screen remove install
 
-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
