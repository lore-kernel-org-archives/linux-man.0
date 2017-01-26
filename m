From: Erik Kline <ekline-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] getenv.3: wfix
Date: Thu, 26 Jan 2017 19:17:58 +0900
Message-ID: <CANXoondEx4ggqjscYDkmDWJwgk4JpTgW0h3Wk3tgJgEL8xv_ZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

diff --git a/man3/getenv.3 b/man3/getenv.3
index 1bfb39677..c801f3924 100644
--- a/man3/getenv.3
+++ b/man3/getenv.3
@@ -76,7 +76,7 @@ the effective capability bit was set on the
executable file; or
 .IP *
 the process has a nonempty permitted capability set.
 .PP
-Secure execution may also required if triggered
+Secure execution may also be required if triggered
 by some Linux security modules.

 The
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
