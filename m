From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/3] prctl(2): PR_SET_MM: document arg4/arg5 zero behavior
Date: Wed, 15 Feb 2017 15:14:41 -0500
Message-ID: <20170215201443.448-1-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The kernel will immediately reject calls where arg4/arg5 are not zero.
See kernel/sys.c:prctl_set_mm().

Signed-off-by: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 man2/prctl.2 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man2/prctl.2 b/man2/prctl.2
index 97cf21a4c558..c91d328e5aa1 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -515,6 +515,11 @@ The value in
 is one of the options below, while
 .I arg3
 provides a new value for the option.
+The
+.I arg4
+and
+.I arg5
+arguments must be zero if unused.
 .RS
 .TP
 .BR PR_SET_MM_START_CODE
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
