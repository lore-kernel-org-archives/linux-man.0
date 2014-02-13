From: Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 4/4] prctl.2: cite PR_SET_MM kernel commits
Date: Wed, 12 Feb 2014 16:49:16 -0800
Message-ID: <1392252556-23254-4-git-send-email-kir@openvz.org>
References: <1392252556-23254-1-git-send-email-kir@openvz.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392252556-23254-1-git-send-email-kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, criu-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org, Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
---
 man2/prctl.2 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/man2/prctl.2 b/man2/prctl.2
index a2d06d1..4c7e9a7 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -642,6 +642,7 @@ All unused
 arguments must be zero.
 .TP
 .BR PR_SET_MM " (since Linux 3.3)"
+.\" commit 028ee4be34a09a6d48bdf30ab991ae933a7bc036
 Modify certain kernel memory map descriptor fields
 of the calling process.
 Usually these fields are set by the kernel and dynamic loader (see
@@ -713,6 +714,7 @@ The requirements for the address are the same as for the
 option.
 .P
 The following options are available since Linux 3.5.
+.\" commit fe8c7f5cbf91124987106faa3bdf0c8b955c4cf7
 .TP
 .BR PR_SET_MM_ARG_START
 Set the address above which the program command line is placed.
@@ -749,6 +751,7 @@ The
 is the size of the vector.
 .TP
 .BR PR_SET_MM_EXE_FILE
+.\" commit b32dfe377102ce668775f8b6b1461f7ad428f8b6
 Supersede the
 .IR /proc/pid/exe
 symbolic link with a new one pointing to a new executable file
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
