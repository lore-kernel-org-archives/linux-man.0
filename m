From: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Subject: [PATCH 5/5] FreeBSD and bionic have memmem
Date: Fri, 20 Dec 2013 16:37:43 -0800
Message-ID: <1387586263-9002-5-git-send-email-shawn@churchofgit.com>
References: <1387586263-9002-1-git-send-email-shawn@churchofgit.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387586263-9002-1-git-send-email-shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
---
 man3/memmem.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/memmem.3 b/man3/memmem.3
index 7b97d2d..667ff62 100644
--- a/man3/memmem.3
+++ b/man3/memmem.3
@@ -57,7 +57,7 @@ The
 function returns a pointer to the beginning of the
 substring, or NULL if the substring is not found.
 .SH CONFORMING TO
-This function is a GNU extension.
+This function is a GNU extension. Present in FreeBSD 6.0 and bionic.
 .SH BUGS
 This function was broken in Linux libraries up to and including libc 5.0.9;
 there the
-- 
1.8.5.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
