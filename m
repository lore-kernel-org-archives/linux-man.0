From: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Subject: [PATCH 2/5] cmsg: be not --> not be
Date: Fri, 20 Dec 2013 16:37:40 -0800
Message-ID: <1387586263-9002-2-git-send-email-shawn@churchofgit.com>
References: <1387586263-9002-1-git-send-email-shawn@churchofgit.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387586263-9002-1-git-send-email-shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
---
 man3/cmsg.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/cmsg.3 b/man3/cmsg.3
index 22057c0..9677233 100644
--- a/man3/cmsg.3
+++ b/man3/cmsg.3
@@ -147,7 +147,7 @@ is a Linux extension.
 For portability, ancillary data should be accessed using only the macros
 described here.
 .BR CMSG_ALIGN ()
-is a Linux extension and should be not used in portable programs.
+is a Linux extension and should not be used in portable programs.
 .PP
 In Linux,
 .BR CMSG_LEN (),
@@ -157,7 +157,7 @@ and
 are constant expressions (assuming their argument is constant);
 this could be used to declare the size of global
 variables.
-This may be not portable, however.
+This may not be portable, however.
 .SH EXAMPLE
 This code looks for the
 .B IP_TTL
-- 
1.8.5.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
