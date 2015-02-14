From: JWP <elseifthen-KK0ffGbhmjU@public.gmane.org>
Subject: [PATCH] tzset.3: add offset format
Date: Fri, 13 Feb 2015 21:08:52 -0500
Message-ID: <54DEAE34.5090002@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

tzset.3 does not illustrate the POSIX offset format.
Specifically, there is no indication in the manual
what the optional components of it are.

Signed-off-by: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
---
 man3/tzset.3 | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/man3/tzset.3 b/man3/tzset.3
index 2bc246c..cfb2d4c 100644
--- a/man3/tzset.3
+++ b/man3/tzset.3
@@ -107,8 +107,12 @@ time to get Coordinated Universal Time (UTC).
 The \fIoffset\fP is positive
 if the local timezone is west of the Prime Meridian and negative if it is
 east.
-The hour must be between 0 and 24, and the minutes and seconds
-0 and 59.
+The hour must be between 0 and 24, and the minutes and seconds 00 and 59:
+.sp
+.RS
+.RI [ + | - ] hh [ :mm [ :ss ]]
+.RE
+.sp
 .PP
 The \fIdst\fP string and \fIoffset\fP specify the name and offset for the
 corresponding daylight saving timezone.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
