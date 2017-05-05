From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] strtol.3: mention 0X prefix
Date: Fri,  5 May 2017 18:05:28 +0200
Message-ID: <20170505160528.3673-1-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The prefix 0x may be capitalized as 0X.

See ISO/IEC 9899:1999.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man3/strtol.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/strtol.3 b/man3/strtol.3
index 3b2a10126..a236e7671 100644
--- a/man3/strtol.3
+++ b/man3/strtol.3
@@ -70,7 +70,7 @@ followed by a single optional \(aq+\(aq or \(aq\-\(aq sign.
 If
 .I base
 is zero or 16, the string may then include a
-"0x" prefix, and the number will be read in base 16; otherwise, a
+"0x" or "0X" prefix, and the number will be read in base 16; otherwise, a
 zero
 .I base
 is taken as 10 (decimal) unless the next character
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
