From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] locale.5:tfix
Date: Sat, 12 Apr 2014 15:54:21 +0400
Message-ID: <1397303661-17620-1-git-send-email-yuray@komyakino.ru>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man5/locale.5 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man5/locale.5 b/man5/locale.5
index e699088..1a79b17 100644
--- a/man5/locale.5
+++ b/man5/locale.5
@@ -405,7 +405,7 @@ toupper list is used.
 The
 .B LC_CTYPE
 definition ends with the string
-.IR "END LC_CYTPE" .
+.IR "END LC_CTYPE" .
 .SS LC_COLLATE
 .\" FIXME: the decsription of LC_COLLATE lacks a lot of details
 The
@@ -450,7 +450,7 @@ notably the examples
 .BR POSIX ,
 .B Example
 and
-.B Example2
+.B Example2 .
 .PP
 The
 .B LC_COLLATE
@@ -685,7 +685,7 @@ otherwise a space separates the sign string and the value.
 .I n_sep_by_space
 followed by an integer that indicates the separation of
 .IR currency_symbol ,
-the sign string, and the value for a nonnegative formatted monetary quantity.
+the sign string, and the value for a negative formatted monetary quantity.
 The same values are recognized as for
 .IR p_sep_by_space .
 .TP
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
