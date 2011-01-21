From: Ivana Hutarova Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: strtol.3 man-page bug
Date: Fri, 21 Jan 2011 13:10:23 +0100
Message-ID: <4D3977AF.9060601@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020709090004080006020609"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------020709090004080006020609
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,
there is wrong statement regarding the characters which are parsed in 
the input string:

"In locales other than the "C" locale, other strings may also be 
accepted.  (For example, the thousands separator of the current locale 
may be supported.)"

It is not possible to use other strings - see stdlib/strtol_l.c in 
glibc. The patch is attached.
Ivana Hutarova Varekova



--------------020709090004080006020609
Content-Type: text/x-patch;
 name="man-pages-3.32-strtol.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="man-pages-3.32-strtol.patch"

diff -up man-pages-3.32/man3/strtol.3.pom man-pages-3.32/man3/strtol.3
--- man-pages-3.32/man3/strtol.3.pom	2010-12-03 08:02:02.000000000 +0100
+++ man-pages-3.32/man3/strtol.3	2011-01-21 12:55:58.000000000 +0100
@@ -158,9 +158,6 @@ and then determine if an error occurred 
 .I errno
 has a nonzero value after the call.
 
-In locales other than the "C" locale, other strings may also be accepted.
-(For example, the thousands separator of the current locale may be
-supported.)
 .LP
 BSD also has
 .sp

--------------020709090004080006020609--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
