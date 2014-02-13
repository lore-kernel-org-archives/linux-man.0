From: Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/4] prctl.2: fix wording in PR_SET_MM_EXE_FILE description
Date: Wed, 12 Feb 2014 16:49:15 -0800
Message-ID: <1392252556-23254-3-git-send-email-kir@openvz.org>
References: <1392252556-23254-1-git-send-email-kir@openvz.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392252556-23254-1-git-send-email-kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, criu-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org, Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
---
 man2/prctl.2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/prctl.2 b/man2/prctl.2
index 55aef52..a2d06d1 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -769,8 +769,8 @@ section).
 The second limitation is that such transitions can be done only once
 in a process life time.
 Any further attempts will be rejected.
-This should help system administrators to monitor unusual
-symbolic-link transitions over all process running in a system.
+This should help system administrators monitor unusual
+symbolic-link transitions over all processes running on a system.
 .RE
 .\"
 .SH RETURN VALUE
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
