From: Christian von Roques <roques-DeIDFP5fInQ@public.gmane.org>
Subject: [PATCH] open.2: tfix
Date: Mon, 25 Aug 2014 08:40:42 -0400
Message-ID: <1408970442-12572-1-git-send-email-roques@mti.ag>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christian von Roques <roques-DeIDFP5fInQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org


diff --git a/man2/open.2 b/man2/open.2
index 6dca2b8..51455aa 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -603,7 +603,7 @@ Write operations on the file will complete according to the requirements of
 synchronized I/O
 .I file
 integrity completion
-(by contrast with contrast with the
+(by contrast with the
 synchronized I/O
 .I data
 integrity completion
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
