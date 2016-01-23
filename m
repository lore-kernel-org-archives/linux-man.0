From: "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] vcs.4: tfix
Date: Sat, 23 Jan 2016 15:18:46 +0300
Message-ID: <20160123121846.GA20560@altlinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Fixes: 42c3e94740fb ("Convert inline formatting (\fX...\fP) to dot-directive formatting")
Reported-by: Pakin Yury <zxwarior-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org>
Signed-off-by: Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
---
 man4/vcs.4 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man4/vcs.4 b/man4/vcs.4
index e4928a7..3399c78 100644
--- a/man4/vcs.4
+++ b/man4/vcs.4
@@ -107,7 +107,7 @@ Note that the output does not contain
 newline characters, so some processing may be required, like
 in
 
-    old \-w 81 /dev/vcs3 | lpr
+    fold \-w 81 /dev/vcs3 | lpr
 
 or (horrors)
 
-- 
ldv
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
