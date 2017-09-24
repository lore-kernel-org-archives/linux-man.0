From: Oliver Ebert <oe-h0GdYU6q0jndfRFfCFeH3g@public.gmane.org>
Subject: [PATCH 2/4] proc.5: Add KPF_BALLOON, KPF_ZERO_PAGE and KPF_IDLE for /proc/kpageflags
Date: Sun, 24 Sep 2017 23:41:36 +0200
Message-ID: <20170924214138.4852-3-oe@outputenable.net>
References: <20170924214138.4852-1-oe@outputenable.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170924214138.4852-1-oe-h0GdYU6q0jndfRFfCFeH3g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Oliver Ebert <oe-h0GdYU6q0jndfRFfCFeH3g@public.gmane.org>
List-Id: linux-man@vger.kernel.org

see linux 56873f43abdcd574b25105867a990f067747b2f4
and linux f074a8f49eb87cde95ac9d040ad5e7ea4f029738
---
 man5/proc.5 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/man5/proc.5 b/man5/proc.5
index 73b51eaca..f0b84d503 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -2965,6 +2965,9 @@ The bits are as follows:
     20 - KPF_NOPAGE         (since Linux 2.6.31)
     21 - KPF_KSM            (since Linux 2.6.32)
     22 - KPF_THP            (since Linux 3.4)
+    23 - KPF_BALLOON        (since Linux 4.0)
+    24 - KPF_ZERO_PAGE      (since Linux 4.0)
+    25 - KPF_IDLE           (since Linux 4.3)
 .IP
 For further details on the meanings of these bits,
 see the kernel source file
-- 
2.13.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
