From: Ross Zwisler <ross.zwisler-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [PATCH] core: Add info about DAX coredump filtering flags
Date: Wed, 11 Nov 2015 11:03:02 -0700
Message-ID: <1447264982-20535-1-git-send-email-ross.zwisler@linux.intel.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Ross Zwisler <ross.zwisler-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Kernel 4.4 added two new core dump filtering flags, MMF_DUMP_DAX_PRIVATE
and MMF_DUMP_DAX_SHARED.

These flags allow us to explicitly filter DAX mappings.  This is desirable
because DAX mappings, like hugetlb mappings, have the potential to be very
large.

Signed-off-by: Ross Zwisler <ross.zwisler-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---

The patches adding these flags have been merged for v4.4, but we're
currently still very early in the v4.4 release cycle.  I'm not sure if it's
correct to apply this documentation patch now, or if you'd rather wait
until v4.4 is actually released.

---
 man5/core.5 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/man5/core.5 b/man5/core.5
index fc7f927..b8a8182 100644
--- a/man5/core.5
+++ b/man5/core.5
@@ -288,6 +288,12 @@ Dump private huge pages.
 .TP
 bit 6 (since Linux 2.6.28)
 Dump shared huge pages.
+.TP
+bit 7 (since Linux 4.4)
+Dump private DAX pages.
+.TP
+bit 8 (since Linux 4.4)
+Dump shared DAX pages.
 .RE
 .PD
 .PP
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
