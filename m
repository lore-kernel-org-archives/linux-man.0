From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 04/20] swapon.2: remove header from synopsis
Date: Tue, 20 May 2014 01:02:10 +0200
Message-ID: <1400540546-25578-5-git-send-email-rv@rasmusvillemoes.dk>
References: <1400540546-25578-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400540546-25578-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The <asm/page.h> header is not readily available, and the comment
seems to indicate that it is for getting PAGE_SIZE. But it is never
mentioned why one would need to know that, and it is in any case
better obtained using sysconf(), provided by <unistd.h>.
---
 man2/swapon.2 | 2 --
 1 file changed, 2 deletions(-)

diff --git a/man2/swapon.2 b/man2/swapon.2
index 9ab380c..18f8655 100644
--- a/man2/swapon.2
+++ b/man2/swapon.2
@@ -40,8 +40,6 @@ swapon, swapoff \- start/stop swapping to file/device
 .SH SYNOPSIS
 .B #include <unistd.h>
 .br
-.B #include <asm/page.h>     /* to find PAGE_SIZE */
-.br
 .B #include <sys/swap.h>
 .sp
 .BI "int swapon(const char *" path ", int " swapflags );
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
