From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: [PATCH] Link to some less-known string functions
Date: Wed, 15 Apr 2009 13:13:00 +0200
Message-ID: <20090415111300.GM8940@machine.or.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Some string functions are almost unknown, yet might be useful.
This adds ffs(3) to SEE ALSO section of memchr(3) and strverscmp(3)
to SEE ALSO section of strcmp(3).

Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>

diff --git a/man3/ffs.3 b/man3/ffs.3
index 95c8924..dae8e03 100644
--- a/man3/ffs.3
+++ b/man3/ffs.3
@@ -68,4 +68,5 @@ or 0 if no bits are set in
 BSD systems have a prototype in
 .IR <string.h> .
 .SH "SEE ALSO"
-.BR feature_test_macros (7)
+.BR feature_test_macros (7),
+.BR memchr (3)
diff --git a/man3/memchr.3 b/man3/memchr.3
index f98eaf7..b9bb8ae 100644
--- a/man3/memchr.3
+++ b/man3/memchr.3
@@ -135,4 +135,5 @@ function is a GNU extension, available since glibc 2.1.
 .BR strsep (3),
 .BR strspn (3),
 .BR strstr (3),
-.BR wmemchr (3)
+.BR wmemchr (3),
+.BR ffs (3)
diff --git a/man3/strcmp.3 b/man3/strcmp.3
index 0304a85..8814fdd 100644
--- a/man3/strcmp.3
+++ b/man3/strcmp.3
@@ -69,4 +69,5 @@ SVr4, 4.3BSD, C89, C99.
 .BR strcoll (3),
 .BR strncasecmp (3),
 .BR wcscmp (3),
-.BR wcsncmp (3)
+.BR wcsncmp (3),
+.BR strverscmp (3)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
