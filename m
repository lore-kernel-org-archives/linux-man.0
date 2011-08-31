From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] err.3: clean up description of error message source
Date: Wed, 31 Aug 2011 23:33:24 +0900
Message-ID: <4E5E4634.80609@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

man-pages version: latest git repository
why:
In the second paragraph of DESCRIPTION section, one of the
sources of error messages is incorrect: the four functions obtain
error message only from errno, and "a code" is just relavant
with errc() and warnc(), which are not present on Linux.
see http://www.unix.com/man-page/freebsd/3/ERR/ .

Then, the third paragraph becomes a duplicate.


diff --git a/man3/err.3 b/man3/err.3
--- a/man3/err.3
+++ b/man3/err.3
@@ -83,7 +83,7 @@ and
.BR vwarn ()
functions append an error message obtained from
.BR strerror (3)
-based on a code or the global variable
+based on the global variable
.IR errno ,
preceded by another colon and space unless the
.I fmt
@@ -91,16 +91,6 @@ argument is
NULL.
.PP
The
-.BR err (),
-.BR verr (),
-.BR warn (),
-and
-.BR vwarn ()
-functions use the global variable
-.I errno
-to look up the error message.
-.PP
-The
.BR errx ()
and
.BR warnx ()

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
