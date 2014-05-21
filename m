From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 03/24] makedev.3: Fix prototype
Date: Wed, 21 May 2014 16:57:34 +0200
Message-ID: <1400684275-20972-4-git-send-email-rv@rasmusvillemoes.dk>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

gnu_dev_makedev, and hence its trivial macro wrapper makedev, takes
two unsigned int parameters; this is consistent with it being the
inverse of (gnu_dev_)major/minor, which return unsigned int.

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man3/makedev.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/makedev.3 b/man3/makedev.3
index e2038fb..bb63a4d 100644
--- a/man3/makedev.3
+++ b/man3/makedev.3
@@ -31,7 +31,7 @@ makedev, major, minor \- manage a device number
 .BR "#define _BSD_SOURCE" "             /* See feature_test_macros(7) */"
 .B #include <sys/types.h>
 
-.BI "dev_t makedev(int " maj ", int " min );
+.BI "dev_t makedev(unsigned int " maj ", unsigned int " min );
 
 .BI "unsigned int major(dev_t " dev );
 .BI "unsigned int minor(dev_t " dev );
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
