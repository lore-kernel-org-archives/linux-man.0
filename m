From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] capabilities.7: ffix
Date: Sat, 16 Mar 2013 17:37:44 -0400
Message-ID: <1363469864-1679-2-git-send-email-taffit@debian.org>
References: <1363469864-1679-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363469864-1679-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/capabilities.7 |    1 +
 1 file changed, 1 insertion(+)

diff --git a/man7/capabilities.7 b/man7/capabilities.7
index 61a340e..768c026 100644
--- a/man7/capabilities.7
+++ b/man7/capabilities.7
@@ -565,6 +565,7 @@ employ
 .BR prctl (2)
 .B PR_SET_MM
 operation;
+.IP *
 set
 .IR /proc/PID/oom_score_adj
 to a value lower than the value last set by a process with
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
