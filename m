From: Gleb Fotengauer-Malinovskiy <glebfm-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] sendfile.2: tfix
Date: Sat, 8 Aug 2015 10:03:23 +0200
Message-ID: <20150808080128.GA7304@glebfm.cloud.tilaa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man2/sendfile.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/sendfile.2 b/man2/sendfile.2
index ef9ba6c..93cf7e1 100644
--- a/man2/sendfile.2
+++ b/man2/sendfile.2
@@ -140,7 +140,7 @@ operation is not available for
 .TP
 .B EINVAL
 .I out_fd
-was has the
+has the
 .B O_APPEND
 flag set.
 This is not currently supported by
-- 
glebfm
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
