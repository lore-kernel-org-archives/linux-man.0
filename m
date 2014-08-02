From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] vdso(7): add new i386 vdso symbols in linux-3.15
Date: Sat,  2 Aug 2014 12:46:23 -0400
Message-ID: <1406997983-23266-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man7/vdso.7 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man7/vdso.7 b/man7/vdso.7
index 157bd17..6341183 100644
--- a/man7/vdso.7
+++ b/man7/vdso.7
@@ -439,6 +439,11 @@ _
 __kernel_sigreturn	LINUX_2.5
 __kernel_rt_sigreturn	LINUX_2.5
 __kernel_vsyscall	LINUX_2.5
+.\" Added in 7a59ed415f5b57469e22e41fc4188d5399e0b194 and updated
+.\" in 37c975545ec63320789962bf307f000f08fabd48.
+__vdso_clock_gettime	LINUX_2.6
+__vdso_gettimeofday	LINUX_2.6
+__vdso_time	LINUX_2.6
 .TE
 .if t \{\
 .in
-- 
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
