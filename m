From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: locale.5: update LC_ADDRESS after glibc change
Date: Mon, 18 Apr 2016 10:06:59 +0300
Message-ID: <57148793.5090400@redhat.com>
Reply-To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

This patch updates locale.5 to match the recent glibc change:

https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=a837257199ffab76237385b830cc7b6179fc2f18

---
 man5/locale.5 | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/man5/locale.5 b/man5/locale.5
index 6aa8b9f..da46ef7 100644
--- a/man5/locale.5
+++ b/man5/locale.5
@@ -127,18 +127,13 @@ The following keywords are allowed:
 followed by a string containing field descriptors that define
 the format used for postal addresses in the locale.
 The following field descriptors are recognized:
-.\" From localedata/locales/uk_UA:
 .RS
-.\" .TP
-.\" %n
-.\" 	BUG: %l escape sequence from ISO/IEC 14652:2002 is not supported
-.\"	by glibc
-.\" Person's name, possibly constructed with the
-.\" .B LC_NAME
-.\" .I name_fmt
-.\" keyword.
-.\"
-.\" https://sourceware.org/bugzilla/show_bug.cgi?id=16983
+.TP
+%n
+Person's name, possibly constructed with the
+.B LC_NAME
+.I name_fmt
+keyword (since glibc 2.24).
 .TP 4
 %a
 Care of person, or organization.
@@ -174,13 +169,9 @@ Floor number.
 .TP
 %C
 Country designation, from the <country_post> keyword.
-.\" .TP
-.\" %l
-.\"	 BUG: %l escape sequence from ISO/IEC 14652:2002 is not
-.\"	supported by glibc
-.\" Local township within town or city.
-.\"
-.\" https://sourceware.org/bugzilla/show_bug.cgi?id=16983
+.TP
+%l
+Local township within town or city (since glibc 2.24).
 .TP
 %z
 Zip number, postal code.

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
