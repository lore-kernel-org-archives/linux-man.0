From: Wainer dos Santos Moschetta <wainersm-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 1/2] __ppc_set_ppr_med.3: Add AVAILABILITY
Date: Tue, 27 Dec 2016 18:06:53 -0200
Message-ID: <20161227200654.23405-1-wainersm@linux.vnet.ibm.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The _ARCH_PWR8 macro must be defined to get the
 __ppc_set_ppr_very_low() and __ppc_set_ppr_med_high()
functions definition.

Signed-off-by: Wainer dos Santos Moschetta <wainersm-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
 man3/__ppc_set_ppr_med.3 | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/man3/__ppc_set_ppr_med.3 b/man3/__ppc_set_ppr_med.3
index a98107b..312aa39 100644
--- a/man3/__ppc_set_ppr_med.3
+++ b/man3/__ppc_set_ppr_med.3
@@ -115,6 +115,18 @@ T}	Thread safety	MT-Safe
 .ad
 .SH CONFORMING TO
 These functions are nonstandard GNU extensions.
+.SH AVAILABILITY
+The functions
+.BR __ppc_set_ppr_very_low ()
+and
+.BR __ppc_set_ppr_med_high ()
+will be defined by
+.I <sys/platform/ppc.h>
+if
+.B _ARCH_PWR8
+is defined.
+Availability of these functions can be tested using
+.BR "#ifdef _ARCH_PWR8" .
 .SH SEE ALSO
 .BR __ppc_yield (3)
 
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
