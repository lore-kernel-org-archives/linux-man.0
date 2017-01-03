From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 2/8] getrlimit.2: tfix
Date: Wed,  4 Jan 2017 00:36:51 +0100
Message-ID: <20170103233657.8875-2-jwilk@jwilk.net>
References: <20170103233657.8875-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170103233657.8875-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/getrlimit.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/getrlimit.2 b/man2/getrlimit.2
index 2ee56ae24..dd99bb2f8 100644
--- a/man2/getrlimit.2
+++ b/man2/getrlimit.2
@@ -299,7 +299,7 @@ The actual ceiling for the nice value is calculated as
 The useful range for this limit is thus from 1
 (corresponding to a nice value of 19) to 40
 (corresponding to a nice value of -20).
-This unusual choice of range is was necessary
+This unusual choice of range was necessary
 because negative numbers cannot be specified
 as resource limit values, since they typically have special meanings.
 For example,
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
