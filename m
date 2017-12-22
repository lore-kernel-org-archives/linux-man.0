From: Santosh Sivaraj <santosh-b8Fn+pY0OfAdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] vdso.7: __kernel_clock_gettime *_COARSE clock support in PPC64
Date: Fri, 22 Dec 2017 05:56:59 +0530
Message-ID: <20171222002659.1930-1-santosh@fossix.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

*_COARSE clocks are now supported in the __kernel_clock_gettime interface in
PPC64. No longer falls back to the real system call.

CC: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
CC: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Signed-off-by: Santosh Sivaraj <santosh-b8Fn+pY0OfAdnm+yROfE0A@public.gmane.org>
---
 man7/vdso.7 | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/man7/vdso.7 b/man7/vdso.7
index 9af02a8aa..c7399939c 100644
--- a/man7/vdso.7
+++ b/man7/vdso.7
@@ -438,9 +438,7 @@ clocks are
 .I not
 supported by the
 .I __kernel_clock_getres
-and
-.I __kernel_clock_gettime
-interfaces;
+interface;
 the kernel falls back to the real system call.
 .SS s390 functions
 .\" See linux/arch/s390/kernel/vdso32/vdso32.lds.S
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
