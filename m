From: Oliver Ebert <oe-h0GdYU6q0jndfRFfCFeH3g@public.gmane.org>
Subject: [PATCH 1/4] proc.5: tfix
Date: Sun, 24 Sep 2017 23:41:35 +0200
Message-ID: <20170924214138.4852-2-oe@outputenable.net>
References: <20170924214138.4852-1-oe@outputenable.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170924214138.4852-1-oe-h0GdYU6q0jndfRFfCFeH3g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Oliver Ebert <oe-h0GdYU6q0jndfRFfCFeH3g@public.gmane.org>
List-Id: linux-man@vger.kernel.org

see linux 63f8e8d2a575ef62e5b705516b491a98a60517ff
---
 man5/proc.5 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 4d482d3a4..73b51eaca 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -2959,7 +2959,7 @@ The bits are as follows:
     14 - KPF_SWAPBACKED     (since Linux 2.6.31)
     15 - KPF_COMPOUND_HEAD  (since Linux 2.6.31)
     16 - KPF_COMPOUND_TAIL  (since Linux 2.6.31)
-    16 - KPF_HUGE           (since Linux 2.6.31)
+    17 - KPF_HUGE           (since Linux 2.6.31)
     18 - KPF_UNEVICTABLE    (since Linux 2.6.31)
     19 - KPF_HWPOISON       (since Linux 2.6.31)
     20 - KPF_NOPAGE         (since Linux 2.6.31)
-- 
2.13.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
