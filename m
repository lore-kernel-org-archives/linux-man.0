From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 5/5] migrate_pages.2: tfix
Date: Sun, 12 Aug 2012 21:34:28 -0400
Message-ID: <1344821668-11324-6-git-send-email-taffit@debian.org>
References: <1344821668-11324-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1344821668-11324-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/migrate_pages.2 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/migrate_pages.2 b/man2/migrate_pages.2
index 47615bf..9c7416e 100644
--- a/man2/migrate_pages.2
+++ b/man2/migrate_pages.2
@@ -87,7 +87,7 @@ privilege.
 .SH "RETURN VALUE"
 On success
 .BR migrate_pages ()
-returns the number of pages that cold not be moved
+returns the number of pages that could not be moved
 (i.e., a return of zero means that all pages were successfully moved).
 On error, it returns \-1, and sets
 .I errno
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
