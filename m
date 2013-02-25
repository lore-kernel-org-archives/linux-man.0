From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] zdump.8: ffix
Date: Mon, 25 Feb 2013 00:29:21 -0400
Message-ID: <1361766561-3679-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man8/zdump.8 |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/man8/zdump.8 b/man8/zdump.8
index 3bd32af..fb1e7c3 100644
--- a/man8/zdump.8
+++ b/man8/zdump.8
@@ -13,7 +13,9 @@ zdump \- timezone dumper
 .B \-v
 ] [
 .B \-c
-[loyear,]hiyear ] [ zonename ... ]
+.RI [ loyear \fB,\fR] hiyear
+] [
+.IR zonename " ... ]"
 .SH DESCRIPTION
 .I Zdump
 prints the current time in each
@@ -44,7 +46,7 @@ if the given time is Daylight Saving Time or
 .B isdst=0
 otherwise.
 .TP
-.BI "\-c " [loyear,]hiyear
+.BI "\-c " \fR[\fIloyear , \fR]\fIhiyear
 Cut off the verbose output near the start of the given year(s).
 The output still includes the lowest possible time value
 and one day after it, and the highest possible time value
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
