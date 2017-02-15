From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/3] prctl(2): PR_SET_MM: document new PR_SET_MM_MAP{,_SIZE} helpers
Date: Wed, 15 Feb 2017 15:14:42 -0500
Message-ID: <20170215201443.448-2-vapier@gentoo.org>
References: <20170215201443.448-1-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170215201443.448-1-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 man2/prctl.2 | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/man2/prctl.2 b/man2/prctl.2
index c91d328e5aa1..dba32ebee1b5 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -633,6 +633,34 @@ in a process life time.
 Any further attempts will be rejected.
 This should help system administrators monitor unusual
 symbolic-link transitions over all processes running on a system.
+.P
+The following options are available since Linux 3.18.
+.\" commit f606b77f1a9e362451aca8f81d8f36a3a112139e
+.TP
+.BR PR_SET_MM_MAP
+Provides one-shot access to all the addresses by passing in a
+.I struct prctl_mm_map
+(as defined in \fI<linux/prctl.h>\fP).
+The
+.I arg4
+argument should provide the size of the struct.
+
+This feature is available only if the kernel is built with the
+.BR CONFIG_CHECKPOINT_RESTORE
+option enabled.
+.TP
+.BR PR_SET_MM_MAP_SIZE
+Returns the size of the
+.I struct prctl_mm_map
+the kernel expects.
+This allows user space to find a compatible struct.
+The
+.I arg4
+argument should be a pointer to an unsigned int.
+
+This feature is available only if the kernel is built with the
+.BR CONFIG_CHECKPOINT_RESTORE
+option enabled.
 .RE
 .TP
 .BR PR_MPX_ENABLE_MANAGEMENT ", " PR_MPX_DISABLE_MANAGEMENT " (since Linux 3.19) "
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
