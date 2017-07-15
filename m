From: Alex Henrie <alexhenrie24-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] log1p.3: Document fixes to give EDOM or ERANGE on error
Date: Fri, 14 Jul 2017 23:23:48 -0600
Message-ID: <20170715052348.801-1-alexhenrie24@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alex Henrie <alexhenrie24-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The bug https://www.sourceware.org/bugzilla/show_bug.cgi?id=6792
was fixed in glibc 2.22.

Signed-off-by: Alex Henrie <alexhenrie24-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man3/log1p.3 | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/man3/log1p.3 b/man3/log1p.3
index ae647a0d2..a303007be 100644
--- a/man3/log1p.3
+++ b/man3/log1p.3
@@ -115,26 +115,22 @@ when calling these functions.
 The following errors can occur:
 .TP
 Domain error: \fIx\fP is less than \-1
-.\" .I errno
-.\" is set to
-.\" .BR EDOM .
+.I errno
+is set to
+.BR EDOM
+(but see BUGS).
 An invalid floating-point exception
 .RB ( FE_INVALID )
 is raised.
 .TP
 Pole error: \fIx\fP is \-1
-.\" .I errno
-.\" is set to
-.\" .BR ERANGE .
+.I errno
+is set to
+.BR ERANGE
+(but see BUGS).
 A divide-by-zero floating-point exception
 .RB ( FE_DIVBYZERO )
 is raised.
-.PP
-These functions do not set
-.IR errno .
-.\" FIXME . Is it intentional that these functions do not set errno?
-.\" log(), log2(), log10() do set errno
-.\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6792
 .SH ATTRIBUTES
 For an explanation of the terms used in this section, see
 .BR attributes (7).
@@ -152,6 +148,20 @@ T}	Thread safety	MT-Safe
 .SH CONFORMING TO
 C99, POSIX.1-2001, POSIX.1-2008.
 .\" BSD
+.SH BUGS
+Before version 2.22, the glibc implementation did not set
+.\" https://www.sourceware.org/bugzilla/show_bug.cgi?id=6792
+.I errno
+to
+.B EDOM
+when a domain error occurred.
+
+Before version 2.22, the glibc implementation did not set
+.\" https://www.sourceware.org/bugzilla/show_bug.cgi?id=6792
+.I errno
+to
+.B ERANGE
+when a range error occurred.
 .SH SEE ALSO
 .BR exp (3),
 .BR expm1 (3),
-- 
2.13.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
