From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 3/3] feature_test_macros.7: tfix
Date: Sun, 13 Mar 2016 19:00:59 +0100
Message-ID: <1457892059-7685-3-git-send-email-jwilk@jwilk.net>
References: <1457892059-7685-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457892059-7685-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man7/feature_test_macros.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/feature_test_macros.7 b/man7/feature_test_macros.7
index 527bf73..b3c3295 100644
--- a/man7/feature_test_macros.7
+++ b/man7/feature_test_macros.7
@@ -133,7 +133,7 @@ The macros that you most likely need to use in modern source code are
 .BR _POSIX_C_SOURCE
 (for definitions from various versions of POSIX.1),
 .BR _XOPEN_SOURCE
-(fof definitions from various versions of SUS),
+(for definitions from various versions of SUS),
 .BR _GNU_SOURCE
 (for GNU and/or Linux specific stuff), and
 .BR _DEFAULT_SOURCE
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
