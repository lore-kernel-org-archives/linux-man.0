From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/3] prctl(2): PR_SET_MM: refine CONFIG_CHECKPOINT_RESTORE requirement
Date: Wed, 15 Feb 2017 15:14:43 -0500
Message-ID: <20170215201443.448-3-vapier@gentoo.org>
References: <20170215201443.448-1-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170215201443.448-1-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The Linux 3.10 release dropped the c/r requirement and opened it up
to all users.

Signed-off-by: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 man2/prctl.2 | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/man2/prctl.2 b/man2/prctl.2
index dba32ebee1b5..42827aa2def4 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -504,9 +504,7 @@ Usually these fields are set by the kernel and dynamic loader (see
 for more information) and a regular application should not use this feature.
 However, there are cases, such as self-modifying programs,
 where a program might find it useful to change its own memory map.
-This feature is available only if the kernel is built with the
-.BR CONFIG_CHECKPOINT_RESTORE
-option enabled.
+
 The calling process must have the
 .BR CAP_SYS_RESOURCE
 capability.
@@ -520,6 +518,14 @@ The
 and
 .I arg5
 arguments must be zero if unused.
+
+.\" commit 52b3694157e3aa6df871e283115652ec6f2d31e0
+Since Linux 3.10,
+this feature is available all the time.
+Before Linux 3.10,
+this feature is available only if the kernel is built with the
+.BR CONFIG_CHECKPOINT_RESTORE
+option enabled.
 .RS
 .TP
 .BR PR_SET_MM_START_CODE
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
