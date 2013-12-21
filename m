From: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Subject: [PATCH 4/5] printf: %m is supported by uclibc and musl, no %n in bionic
Date: Fri, 20 Dec 2013 16:37:42 -0800
Message-ID: <1387586263-9002-4-git-send-email-shawn@churchofgit.com>
References: <1387586263-9002-1-git-send-email-shawn@churchofgit.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387586263-9002-1-git-send-email-shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
---
 man3/printf.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/printf.3 b/man3/printf.3
index 20a3b5d..a861126 100644
--- a/man3/printf.3
+++ b/man3/printf.3
@@ -791,10 +791,10 @@ The number of characters written so far is stored into the integer
 indicated by the
 .I "int\ *"
 (or variant) pointer argument.
-No argument is converted.
+No argument is converted. (absent in bionic)
 .TP
 .B m
-(Glibc extension.)
+(Glibc extension. Supported by uClibc and musl)
 Print output of
 .IR strerror(errno) .
 No argument is required.
-- 
1.8.5.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
