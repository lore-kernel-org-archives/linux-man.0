From: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
Subject: [PATCH 3/3] tzset.3: typos and version bump
Date: Sun, 01 Feb 2015 08:18:02 -0500
Message-ID: <54CE278A.9000604@gmx.com>
References: <54CE2689.7000704@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54CE2689.7000704-KK0ffGbhmjU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Signed-off-by: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
---
 man3/tzset.3 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/man3/tzset.3 b/man3/tzset.3
index 8002ee5..0347ae8 100644
--- a/man3/tzset.3
+++ b/man3/tzset.3
@@ -30,7 +30,7 @@
 .\" Modified 2001-11-13, aeb
 .\" Modified 2004-12-01 mtk and Martin Schulze <joey-1lCxjdRlhQ9g9hUCZPvPmw@public.gmane.org>
 .\"
-.TH TZSET 3  2014-08-19 "" "Linux Programmer's Manual"
+.TH TZSET 3  2015-01-30 "" "Linux Programmer's Manual"
 .SH NAME
 tzset, tzname, timezone, daylight \- initialize time conversion information
 .SH SYNOPSIS
@@ -84,9 +84,9 @@ timezone directory (see the \fBFILES\fP section below).
 .PP
 If the
 .B TZ
-variable does appear in the environment but its value is empty
+variable does appear in the environment, but its value is empty,
 or its value cannot be interpreted using any of the formats specified
-below, Coordinated Universal Time (UTC) is used.
+below, then Coordinated Universal Time (UTC) is used.
 .PP
 The value of
 .B TZ
@@ -113,7 +113,7 @@ The hour must be between 0 and 24, and the minutes and seconds
 The \fIdst\fP string and \fIoffset\fP specify the name and offset for the
 corresponding daylight saving timezone.
 If the offset is omitted,
-it default to one hour ahead of standard time.
+it defaults to one hour ahead of standard time.
 .PP
 The \fIstart\fP field specifies when daylight saving time goes into
 effect and the \fIend\fP field specifies when the change is made back to
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
