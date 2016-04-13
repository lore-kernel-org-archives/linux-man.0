From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] locale(5): country_car: add a better description
Date: Tue, 12 Apr 2016 22:05:38 -0400
Message-ID: <1460513138-16422-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man5/locale.5 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man5/locale.5 b/man5/locale.5
index 6aa8b9f..863de47 100644
--- a/man5/locale.5
+++ b/man5/locale.5
@@ -219,7 +219,7 @@ followed by the three-letter abbreviation of the country (ISO 3166).
 followed by the numeric country code as plain numbers (ISO 3166).
 .TP
 .I country_car
-followed by the code for the country car number.
+followed by the international licence plate country code.
 .TP
 .I country_isbn
 followed by the ISBN code (for books).
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
