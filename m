From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getpwent_r.3: ATTRIBUTES: Note functions that are/aren't thread-safe
Date: Thu, 18 Jun 2015 13:36:50 +0800
Message-ID: <1434605811-18306-3-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1434605811-18306-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434605811-18306-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The markings match glibc markings.
markings of functions in glibc are:
- getpwent_r:  MT-Unsafe race:pwent locale
- fgetpwent_r: MT-Safe

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getpwent_r.3 | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/man3/getpwent_r.3 b/man3/getpwent_r.3
index e3c14de..4733987 100644
--- a/man3/getpwent_r.3
+++ b/man3/getpwent_r.3
@@ -115,6 +115,34 @@ No more entries.
 .B ERANGE
 Insufficient buffer space supplied.
 Try again with larger buffer.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lbw27
+l l l.
+Interface	Attribute	Value
+T{
+.BR getpwent_r ()
+T}	Thread safety	MT-Unsafe race:pwent locale
+T{
+.BR fgetpwent_r ()
+T}	Thread safety	MT-Safe
+.TE
+
+In the above table,
+.I pwent
+in
+.I race:pwent
+signifies that if any of the functions
+.BR setpwent (),
+.BR getpwent (),
+.BR endpwent (),
+or
+.BR getpwent_r ()
+are used in parallel in different threads of a program,
+then data races could occur.
 .SH CONFORMING TO
 These functions are GNU extensions, done in a style resembling
 the POSIX version of functions like
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
