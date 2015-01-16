From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch] getpw.3: Function could return -1 and set errno to zero.
Date: Thu, 15 Jan 2015 22:29:03 -0500
Message-ID: <54B8857F.2060307@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

All of the BSD interfaces, including glibc's own implementation
of getpw return -1 and set errno to 0 to indicate that there
was no user corresponding to that uid.

I have never under any condition seen an NSS backend return
ENOENT via the set of APIs that getpw uses internally in
glibc.

Therefore I would suggest the manual page be expanded to include
0 in the list of valid errno values that indicate no corresponding
user. I reorganize the list of errors to have the non-error
at the top, as is done with getgrnam.3 and getpwnam.3 which have
similar behaviour in the non-error case.

Patch against master.

diff --git a/man3/getpw.3 b/man3/getpw.3
index 4054823..3eed9a7 100644
--- a/man3/getpw.3
+++ b/man3/getpw.3
@@ -77,14 +77,14 @@ function returns 0 on success; on error, it returns \-1, and
 is set to indicate the error.
 .SH ERRORS
 .TP
+.BR 0 " or " ENOENT
+No user corresponding to
+.IR uid .
+.TP
 .B EINVAL
 .I buf
 is NULL.
 .TP
-.B 0 or ENOENT
-No user corresponding to
-.IR uid .
-.TP
 .B ENOMEM
 Insufficient memory to allocate
 .I passwd
---

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
