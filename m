From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] fexecve.3: ffix
Date: Tue, 29 Oct 2013 22:37:32 -0400
Message-ID: <1383100652-7236-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/fexecve.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/fexecve.3 b/man3/fexecve.3
index f228f00..03a00da 100644
--- a/man3/fexecve.3
+++ b/man3/fexecve.3
@@ -114,7 +114,7 @@ Simply opening the file, checksumming the contents, and then doing an
 would not suffice, since, between the two steps, the filename,
 or a directory prefix of the pathname, could have been exchanged
 (by, for example, modifying the target of a symbolic link).
-.BR fexecve()
+.BR fexecve ()
 does not mitigate the problem that the
 .I contents
 of a file could be changed between the checksumming and the call to
-- 
1.8.4.rc3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
