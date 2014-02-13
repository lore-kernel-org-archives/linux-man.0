From: Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/4] prctl.2: Note PR_SET_MM opts appeared in Linux 3.5
Date: Wed, 12 Feb 2014 16:49:14 -0800
Message-ID: <1392252556-23254-2-git-send-email-kir@openvz.org>
References: <1392252556-23254-1-git-send-email-kir@openvz.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392252556-23254-1-git-send-email-kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, criu-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org, Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
---
 man2/prctl.2 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/man2/prctl.2 b/man2/prctl.2
index db8174a..55aef52 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -711,6 +711,8 @@ value.
 The requirements for the address are the same as for the
 .BR PR_SET_MM_START_BRK
 option.
+.P
+The following options are available since Linux 3.5.
 .TP
 .BR PR_SET_MM_ARG_START
 Set the address above which the program command line is placed.
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
