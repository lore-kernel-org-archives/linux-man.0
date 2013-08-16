From: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Add mdoc-style section (.Sh) support in remove_COLOPHON.sh
Date: Fri, 16 Aug 2013 17:24:16 +0900
Message-ID: <CALhU9tnSRTajjannjgp82RykQontVKpeWDW=01xyVWa7fSp3GA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

mdoc.7 and mdoc.samples.7 are written in mdoc format,
but remove_COLOPHON.sh does not support mdoc format
and we need to remove the COLOPHON sections in these files manually.
A tiny fix can address this.

Thanks,
Akihiro

>From c0951b4a82d4849213f6495ac472a21367dc3a24 Mon Sep 17 00:00:00 2001
From: Akihiro MOTOKI <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Fri, 16 Aug 2013 16:54:24 +0900
Subject: [PATCH] Add mdoc-style section (.Sh) support in remove_COLOPHON.sh

---
 scripts/remove_COLOPHON.sh |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/remove_COLOPHON.sh b/scripts/remove_COLOPHON.sh
index 0f56d20..02f7118 100644
--- a/scripts/remove_COLOPHON.sh
+++ b/scripts/remove_COLOPHON.sh
@@ -9,5 +9,5 @@
 # the trees.)
 #
 for f in "$@"; do
-    sed -i '/^\.SH COLOPHON/,$d' "$f"
+    sed -i '/^\.S[Hh] COLOPHON/,$d' "$f"
 done
-- 
1.7.9.5
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
