From: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Subject: [PATCH 3/5] timerfd_create: add timerfd(2) alias
Date: Fri, 20 Dec 2013 16:37:41 -0800
Message-ID: <1387586263-9002-3-git-send-email-shawn@churchofgit.com>
References: <1387586263-9002-1-git-send-email-shawn@churchofgit.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387586263-9002-1-git-send-email-shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
---
 man2/timerfd.2 | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 man2/timerfd.2

diff --git a/man2/timerfd.2 b/man2/timerfd.2
new file mode 100644
index 0000000..de0bf03
--- /dev/null
+++ b/man2/timerfd.2
@@ -0,0 +1,2 @@
+.so man2/timerfd_create.2
+
-- 
1.8.5.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
