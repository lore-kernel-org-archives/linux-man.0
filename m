From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/5] strcat.3: ffix
Date: Sun, 12 Aug 2012 21:34:26 -0400
Message-ID: <1344821668-11324-4-git-send-email-taffit@debian.org>
References: <1344821668-11324-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1344821668-11324-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/strcat.3 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/strcat.3 b/man3/strcat.3
index ef53641..a245283 100644
--- a/man3/strcat.3
+++ b/man3/strcat.3
@@ -108,7 +108,7 @@ Some systems (the BSDs, Solaris, and others) provide the following function:
 This function appends the null-terminated string
 .I src
 to the string
-.I dest,
+.IR dest ,
 copying at most
 .IR "size\-strlen(dest)\-1"
 from
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
