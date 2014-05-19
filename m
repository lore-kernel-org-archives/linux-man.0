From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 18/20] getspnam.3: fix prototype
Date: Tue, 20 May 2014 01:02:24 +0200
Message-ID: <1400540546-25578-19-git-send-email-rv@rasmusvillemoes.dk>
References: <1400540546-25578-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400540546-25578-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The struct spwd argument to putspent is const.
---
 man3/getspnam.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/getspnam.3 b/man3/getspnam.3
index 3fbc7d1..40d78c2 100644
--- a/man3/getspnam.3
+++ b/man3/getspnam.3
@@ -28,7 +28,7 @@ lckpwdf, ulckpwdf \- get shadow password file entry
 .sp
 .BI "struct spwd *sgetspent(const char *" s );
 .sp
-.BI "int putspent(struct spwd *" p ", FILE *" fp );
+.BI "int putspent(const struct spwd *" p ", FILE *" fp );
 .sp
 .B int lckpwdf(void);
 .sp
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
