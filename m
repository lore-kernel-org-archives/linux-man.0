From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] locale.7: tfix
Date: Thu, 10 Apr 2014 18:40:20 -0400
Message-ID: <1397169620-10086-2-git-send-email-taffit@debian.org>
References: <1397169620-10086-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397169620-10086-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/locale.7 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man7/locale.7 b/man7/locale.7
index 1c7710f..0a91c3b 100644
--- a/man7/locale.7
+++ b/man7/locale.7
@@ -103,7 +103,7 @@ or
 .TP
 .BR LC_IDENTIFICATION " (GNU extension, since glibc 2.2)"
 .\" See ISO/IEC Technical Report 14652
-Change settings that relate to the metdata for the locale.
+Change settings that relate to the metadata for the locale.
 Applications that need this information can use
 .BR nl_langinfo (3)
 to retrieve nonstandard elements, such as
@@ -111,7 +111,7 @@ to retrieve nonstandard elements, such as
 (title of this locale document)
 and
 .B _NL_IDENTIFICATION_TERRITORY
-(geograpical territory to which this locale document applies),
+(geographical territory to which this locale document applies),
 which might return strings such as "English locale for the USA"
 and "USA".
 (Other element names are listed in
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
