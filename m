From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] getauxval.3: wfix
Date: Fri, 31 Jan 2014 22:50:52 -0400
Message-ID: <1391223052-20777-2-git-send-email-taffit@debian.org>
References: <1391223052-20777-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391223052-20777-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/getauxval.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/getauxval.3 b/man3/getauxval.3
index 38eafe0..efcb28f 100755
--- a/man3/getauxval.3
+++ b/man3/getauxval.3
@@ -157,11 +157,11 @@ and glibc changes other aspects of its behavior.
 .BR secure_getenv (3).)
 .TP
 .BR AT_SYSINFO
-The entry point to the system call function in the VDSO.
+The entry point to the system call function in the vDSO.
 Not present/needed on all architectures (e.g., absent on x86-64).
 .TP
 .BR AT_SYSINFO_EHDR
-The address of a page containing the Virtual Dynamic Shared Object (VDSO)
+The address of a page containing the virtual Dynamic Shared Object (vDSO)
 that the kernel creates in order to provide fast implementations of
 certain system calls.
 .TP
-- 
1.9.rc1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
