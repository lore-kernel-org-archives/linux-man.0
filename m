From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/5] readdir.3: ffix
Date: Sun, 12 Aug 2012 21:34:25 -0400
Message-ID: <1344821668-11324-3-git-send-email-taffit@debian.org>
References: <1344821668-11324-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1344821668-11324-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/readdir.3 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/readdir.3 b/man3/readdir.3
index 0660efd..90f2ff1 100644
--- a/man3/readdir.3
+++ b/man3/readdir.3
@@ -227,7 +227,7 @@ as follows:
 .nf
 
 name_max = pathconf(dirpath, _PC_NAME_MAX);
-if (name_max == \-1)        /* Limit not defined, or error */
+if (name_max == \-1)         /* Limit not defined, or error */
     name_max = 255;         /* Take a guess */
 len = offsetof(struct dirent, d_name) + name_max + 1;
 entryp = malloc(len);
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
