From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 2/3] sched_setaffinity.2: tfix
Date: Sat, 13 May 2017 12:37:46 +0200
Message-ID: <20170513103747.1341-2-jwilk@jwilk.net>
References: <20170513103747.1341-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170513103747.1341-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Remove duplicated word.

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/sched_setaffinity.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/sched_setaffinity.2 b/man2/sched_setaffinity.2
index 93b6090b9..71d9512dc 100644
--- a/man2/sched_setaffinity.2
+++ b/man2/sched_setaffinity.2
@@ -125,7 +125,7 @@ contains no processors that are currently physically on the system
 and permitted to the thread according to any restrictions that
 may be imposed by
 .I cpuset
-cgroups or the the "cpuset" mechanism described in
+cgroups or the "cpuset" mechanism described in
 .BR cpuset (7).
 .TP
 .B EINVAL
-- 
2.13.0.rc2.291.g57267f2277

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
