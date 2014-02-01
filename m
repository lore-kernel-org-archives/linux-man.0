From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] vdso.7: repetition fix
Date: Fri, 31 Jan 2014 22:50:51 -0400
Message-ID: <1391223052-20777-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/vdso.7 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man7/vdso.7 b/man7/vdso.7
index 7251561..986cb2c 100644
--- a/man7/vdso.7
+++ b/man7/vdso.7
@@ -32,7 +32,7 @@ There are some system calls the kernel provides that
 user-space code ends up using frequently,
 to the point that such calls can dominate overall performance.
 This is due both to the frequency of the call as well as the
-context-switch overhead that results from
+context-switch overhead that results
 from exiting user space and entering the kernel.
 
 The rest of this documentation is geared toward the curious and/or
@@ -135,7 +135,7 @@ You will frequently find it under the architecture-specific directory:
     find arch/$ARCH/ -name '*vdso*.so*' -o -name '*gate*.so*'
 
 .SS vDSO names
-The name of vDSO shared object varies across architectures.
+The name of vDSO varies across architectures.
 It will often show up in things like glibc's
 .BR ldd (1)
 output.
-- 
1.9.rc1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
