From: Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] makedev.3: glibc has deprecated exposing the definitions via <sys/types.h>
Date: Sat, 25 Nov 2017 12:12:07 +0200
Message-ID: <20171125101207.27932-1-bunk@kernel.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Compile warning with glibc 2.25:

warning: In the GNU C Library, "makedev" is defined
 by <sys/sysmacros.h>. For historical compatibility, it is
 currently defined by <sys/types.h> as well, but we plan to
 remove this soon. To use "makedev", include <sys/sysmacros.h>
 directly. If you did not intend to use a system-defined macro
 "makedev", you should undefine it after including <sys/types.h>.

Background:
https://sourceware.org/git/?p=glibc.git;a=commit;h=dbab6577c6684c62bd2521c1c29dc25c3cac966f
---
 man3/makedev.3 | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/man3/makedev.3 b/man3/makedev.3
index 3398bbb0b..75c191be7 100644
--- a/man3/makedev.3
+++ b/man3/makedev.3
@@ -94,9 +94,10 @@ and
 The latter names are exported, but the traditional names are more portable.
 .PP
 The BSDs expose the definitions for these macros via
-.IR <sys/types.h> ,
-and glibc also exposes definitions for these macros from that
-header file if suitable feature test macros are defined.
+.IR <sys/types.h> .
+glibc also exposes definitions for these macros from that
+header file if suitable feature test macros are defined,
+but this is deprecated and will be removed in the future.
 .SH SEE ALSO
 .BR mknod (2),
 .BR stat (2)
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
