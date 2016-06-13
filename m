From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: locale.5: adjust conformance
Date: Mon, 13 Jun 2016 10:20:23 +0300
Message-ID: <575E5EB7.7060802@redhat.com>
Reply-To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

Since we now know that glibc does not support all the keywords
mentioned in ISO/IEC TR 14652 [1] and in general glibc aims to
be conforming to POSIX first and foremost, I think it's best
just to drop the reference to ISO/IEC TR 14652 from the man page.

1) http://www.open-std.org/jtc1/SC22/WG20/docs/n972-14652ft.pdf

After this I think the locale related man pages are finally as
complete as they need to be.

---
 man5/locale.5 | 5 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man5/locale.5 b/man5/locale.5
index db20368..ab7b6f7 100644
--- a/man5/locale.5
+++ b/man5/locale.5
@@ -1298,7 +1297,7 @@ Usual default locale archive location.
 .I /usr/share/i18n/locales
 Usual default path for locale definition files.
 .SH CONFORMING TO
-POSIX.2, ISO/IEC TR 14652.
+POSIX.2.
 .SH NOTES
 The collective GNU C library community wisdom regarding
 .IR abday ,

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
