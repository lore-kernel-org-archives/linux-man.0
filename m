From: "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] personality.2: Note kernel and glibc versions that introduced this syscall
Date: Fri, 25 Dec 2015 01:47:06 +0300
Message-ID: <20151224224705.GA21155@altlinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
---
 man2/personality.2 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man2/personality.2 b/man2/personality.2
index d5e3364..f41a339 100644
--- a/man2/personality.2
+++ b/man2/personality.2
@@ -70,6 +70,11 @@ is set appropriately.
 .TP
 .B EINVAL
 The kernel was unable to change the personality.
+.SH VERSIONS
+This system call first appeared in Linux 1.1.20;
+library support was added in glibc 2.3.
+.\" personality wrapper first appeared in glibc 1.90,
+.\" <sys/personality.h> was added later in 2.2.91.
 .SH CONFORMING TO
 .BR personality ()
 is Linux-specific and should not be used in programs intended to

-- 
ldv
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
