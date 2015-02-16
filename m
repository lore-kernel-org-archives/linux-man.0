From: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
Subject: [PATCH] tzset.3: ffix
Date: Mon, 16 Feb 2015 12:12:37 -0500
Message-ID: <54E22505.1040604@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
---
 man3/tzset.3 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man3/tzset.3 b/man3/tzset.3
index cfb2d4c..a1e11ce 100644
--- a/man3/tzset.3
+++ b/man3/tzset.3
@@ -188,13 +188,13 @@ If this variable is set its value takes precedence over the system
 configured timezone database directory path.
 .SH FILES
 .TP
-.B /etc/localtime
+.I /etc/localtime
 The system timezone file.
 .TP
-.B /usr/share/zoneinfo/
+.I /usr/share/zoneinfo/
 The system timezone database directory.
 .TP
-.B /usr/share/zoneinfo/posixrules
+.I /usr/share/zoneinfo/posixrules
 When a TZ string includes a dst timezone without anything following it,
 then this file is used for the start/end rules.
 It is in the
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
