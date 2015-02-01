From: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
Subject: [PATCH] tzset.3: ffix
Date: Sun, 01 Feb 2015 15:25:22 -0500
Message-ID: <54CE8BB2.5070100@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Fix tzset.3 regression, dst is optional.

$ date
Sun Feb  1 15:14:33 EST 2015
$ TZ=NZST-12 date
Mon Feb  2 08:14:38 NZST 2015
$ TZ=EST5 date
Sun Feb  1 15:15:02 EST 2015

Signed-off-by: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
---
 man3/tzset.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/tzset.3 b/man3/tzset.3
index 1253241..7a4dd6a 100644
--- a/man3/tzset.3
+++ b/man3/tzset.3
@@ -95,7 +95,7 @@ The first format is a string of characters that directly represent the
 timezone to be used:
 .sp
 .RS
-.RI "std offset " dst [ offset ][, start [ /time ], end [ /time ]]
+.RI "std offset[" dst [ offset ][, start [ /time ], end [ /time ]]]
 .RE
 .sp
 There are no spaces in the specification.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
