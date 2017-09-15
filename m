From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 3/5] proc.5: tfix
Date: Fri, 15 Sep 2017 18:41:36 +0200
Message-ID: <20170915164138.2621-3-jwilk@jwilk.net>
References: <20170915164138.2621-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170915164138.2621-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man5/proc.5 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 78155918d..4d482d3a4 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -5463,7 +5463,7 @@ the callback function that is associated with the timer.
 During the Linux 4.11 development cycle,
 this file  was removed because of security concerns,
 as it exposes information across namespaces.
-Furthermore, it is possibile to obtain
+Furthermore, it is possible to obtain
 the same information via in-kernel tracing facilities such as ftrace.
 .TP
 .I /proc/tty
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
