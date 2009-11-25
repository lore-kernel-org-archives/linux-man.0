From: Markus Peuhkuri <puhuri-X3B1VOXEql0@public.gmane.org>
Subject: memrchr(3): depends on _GNU_SOURCE
Date: Wed, 25 Nov 2009 15:34:13 +0200
Message-ID: <4B0D3255.9080305@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

At manual page (memchr, memrchr and rawmemchr) it is listed that only
rawmemchr needs _GNU_SOURCE feature test macro. However, at least in
/usr/include/string.h shipped with Debian Lenny and Ubuntu 9.04 both
have also memrchr in same #ifdef __USE_GNU block.

Correction:

--- memchr.old	2008-07-26 15:31:57.431082210 +0200
+++ memchr.3	2009-11-25 15:31:39.000000000 +0200
@@ -46,6 +46,8 @@
 .BR feature_test_macros (7)):
 .in
 .sp
+.BR memrchr ():
+_GNU_SOURCE
 .BR rawmemchr ():
 _GNU_SOURCE
 .SH DESCRIPTION


(or should them be at same line.)

t. Markus
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
