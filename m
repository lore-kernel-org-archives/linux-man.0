From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 5/8] aio_suspend.3: tfix
Date: Wed,  4 Jan 2017 00:36:54 +0100
Message-ID: <20170103233657.8875-5-jwilk@jwilk.net>
References: <20170103233657.8875-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170103233657.8875-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man3/aio_suspend.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/aio_suspend.3 b/man3/aio_suspend.3
index 788538801..69a99637c 100644
--- a/man3/aio_suspend.3
+++ b/man3/aio_suspend.3
@@ -143,7 +143,7 @@ The glibc implementation of
 .BR aio_suspend ()
 is not async-signal-safe,
 .\" FIXME . https://sourceware.org/bugzilla/show_bug.cgi?id=13172
-in violation of the requirements of POSSIX.1.
+in violation of the requirements of POSIX.1.
 .SH SEE ALSO
 .BR aio_cancel (3),
 .BR aio_error (3),
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
