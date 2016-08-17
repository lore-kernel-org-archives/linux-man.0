From: David Turner <novalis-qEvXGNtQsBNAfugRpC6u6w@public.gmane.org>
Subject: [PATCH] cpuset.7: tfix
Date: Tue, 16 Aug 2016 22:55:25 -0400
Message-ID: <1471402525-21666-1-git-send-email-novalis@novalis.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: David Turner <novalis-qEvXGNtQsBNAfugRpC6u6w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man7/cpuset.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/cpuset.7 b/man7/cpuset.7
index c5cbf1d..6669816 100644
--- a/man7/cpuset.7
+++ b/man7/cpuset.7
@@ -48,7 +48,7 @@ on that system.
 By default, if the cpuset configuration
 on a system is not modified or if the cpuset filesystem
 is not even mounted, then the cpuset mechanism,
-though present, has no affect on the system's behavior.
+though present, has no effect on the system's behavior.
 .PP
 A cpuset defines a list of CPUs and memory nodes.
 .PP
-- 
2.8.0.rc4.22.g8ae061a

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
