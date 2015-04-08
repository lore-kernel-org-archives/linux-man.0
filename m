From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] unlocked_stdio.3: ATTRIBUTES: Note functions that aren't thread-safe
Date: Wed, 8 Apr 2015 10:56:24 +0800
Message-ID: <1428461788-7518-14-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1428461788-7518-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428461788-7518-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The markings match glibc markings.

getc_unlocked:     MT-Safe race:stream
putc_unlocked:     MT-Safe race:stream
clearerr_unlocked: MT-Safe race:stream
fflush_unlocked:   MT-Safe race:stream
fgetc_unlocked:    MT-Safe race:stream
fputc_unlocked:    MT-Safe race:stream
fread_unlocked:    MT-Safe race:stream
fwrite_unlocked:   MT-Safe race:stream
fgets_unlocked:    MT-Safe race:stream
fputs_unlocked:    MT-Safe race:stream
getwc_unlocked:    MT-Safe race:stream
fgetwc_unlocked:   MT-Safe race:stream
fputwc_unlocked:   MT-Safe race:stream
putwc_unlocked:    MT-Safe race:stream
fgetws_unlocked:   MT-Safe race:stream
fputws_unlocked:   MT-Safe race:stream

getchar_unlocked:  MT-Unsafe race:stdin
getwchar_unlocked: MT-Unsafe race:stdin

putchar_unlocked:  MT-Unsafe race:stdout
putwchar_unlocked: MT-Unsafe race:stdout

feof_unlocked:     MT-Safe
ferror_unlocked:   MT-Safe
fileno_unlocked:   MT-Safe

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/unlocked_stdio.3 | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/man3/unlocked_stdio.3 b/man3/unlocked_stdio.3
index d5aada7..24bd179 100644
--- a/man3/unlocked_stdio.3
+++ b/man3/unlocked_stdio.3
@@ -110,6 +110,47 @@ without the "_unlocked" suffix, except that they do not use locking
 of locks set by others) and hence are thread-unsafe.
 See
 .BR flockfile (3).
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw20 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR getc_unlocked (),
+.BR putc_unlocked (),
+.BR clearerr_unlocked (),
+.BR fflush_unlocked (),
+.BR fgetc_unlocked (),
+.BR fputc_unlocked (),
+.BR fread_unlocked (),
+.BR fwrite_unlocked (),
+.BR fgets_unlocked (),
+.BR fputs_unlocked (),
+.BR getwc_unlocked (),
+.BR fgetwc_unlocked (),
+.BR fputwc_unlocked (),
+.BR putwc_unlocked (),
+.BR fgetws_unlocked (),
+.BR fputws_unlocked ()
+T}	Thread safety	MT-Safe race:stream
+T{
+.BR getchar_unlocked (),
+.BR getwchar_unlocked ()
+T}	Thread safety	MT-Unsafe race:stdin
+T{
+.BR putchar_unlocked (),
+.BR putwchar_unlocked ()
+T}	Thread safety	MT-Unsafe race:stdout
+T{
+.BR feof_unlocked (),
+.BR ferror_unlocked (),
+.BR fileno_unlocked ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 The four functions
 .BR getc_unlocked (),
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
