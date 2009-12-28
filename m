From: Fang Wenqi <anton.fang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] proc.5: Fix typo for CONFIG_MAGIC_SYSRQ.
Date: Mon, 28 Dec 2009 14:08:32 +0800
Message-ID: <1261980512-5073-1-git-send-email-antonf@turbolinux.com.cn>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nicolas.francois-Fa7rcPG4DJn7nK0/Xc0eeg@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Fang Wenqi <antonf-Qbad7dcHD6Y0jvc7zYWOs/8+0UxHXcjY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Fang Wenqi <antonf-Qbad7dcHD6Y0jvc7zYWOs/8+0UxHXcjY@public.gmane.org>
---
 man5/proc.5 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 3da30af..b50fdae 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -2313,7 +2313,7 @@ Possible values in this file are:
         256 - allow nicing of all real-time tasks
 
 This file is only present if the
-.B CONFIG_MAGIG_SYSRQ
+.B CONFIG_MAGIC_SYSRQ
 kernel configuration option is enabled.
 For further details see the kernel source file
 .IR Documentation/sysrq.txt .
-- 
1.6.5.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
