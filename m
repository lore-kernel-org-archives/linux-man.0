From: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
Subject: [PATCH] psiginfo.3, psignal.3: Document psiginfo()
Date: Wed, 6 Oct 2010 08:51:42 +0200
Message-ID: <20101006065142.GA26673@gaara.hadrons.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
---
 man3/psiginfo.3 |    1 +
 man3/psignal.3  |   28 ++++++++++++++++++++--------
 2 files changed, 21 insertions(+), 8 deletions(-)
 create mode 100644 man3/psiginfo.3

diff --git a/man3/psiginfo.3 b/man3/psiginfo.3
new file mode 100644
index 0000000..cd748fa
--- /dev/null
+++ b/man3/psiginfo.3
@@ -0,0 +1 @@
+.so man3/psignal.3
diff --git a/man3/psignal.3 b/man3/psignal.3
index 128fe8f..729acc9 100644
--- a/man3/psignal.3
+++ b/man3/psignal.3
@@ -25,16 +25,15 @@
 .\"     Lewine's _POSIX Programmer's Guide_ (O'Reilly & Associates, 1991)
 .\"     386BSD man pages
 .\" Modified Sat Jul 24 18:45:17 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
-.\" FIXME glibc 2.10 adds psiginfo(), specified in SUSv4.  This function
-.\" should be documented, probably on this page.
-.TH PSIGNAL 3  2008-08-21 "GNU" "Linux Programmer's Manual"
+.TH PSIGNAL 3  2010-10-06 "GNU" "Linux Programmer's Manual"
 .SH NAME
-psignal \- print signal message
+psignal, psiginfo \- print signal message
 .SH SYNOPSIS
 .nf
 .B #include <signal.h>
 .sp
 .BI "void psignal(int " sig ", const char *" s );
+.BI "void psiginfo(const siginfo_t *" pinfo ", const char *" s );
 .sp
 .BI "extern const char *const " sys_siglist [];
 .fi
@@ -47,23 +46,36 @@ Feature Test Macro Requirements for glibc (see
 .BR psignal ():
 _SVID_SOURCE || _BSD_SOURCE
 .br
+.BR psiginfo ():
+_XOPEN_SOURCE\ >=\ 700 || _POSIX_C_SOURCE\ >=\ 200809L
+.br
 .IR sys_siglist :
 _BSD_SOURCE
 .SH DESCRIPTION
 The
 .BR psignal ()
-function displays a message on \fIstderr\fP
+and
+.BR psiginfo ()
+functions display a message on \fIstderr\fP
 consisting of the string \fIs\fP, a colon, a space, and a string
-describing the signal number \fIsig\fP.
-If \fIsig\fP is invalid,
+describing the signal number \fIsig\fP or signal information \fIpinfo\fP.
+If the string \fIs\fP is NULL or empty, the colon and space are omitted.
+For
+.BR psignal ()
+if \fIsig\fP is invalid,
 the message displayed will indicate an unknown signal.
+For
+.BR psiginfo (),
+\fIpinfo\fP should point to a valid \fIsiginfo_t\fP structure.
 .PP
 The array \fIsys_siglist\fP holds the signal description strings
 indexed by signal number.
 .SH "RETURN VALUE"
 The
 .BR psignal ()
-function returns no value.
+and
+.BR psiginfo ()
+functions return no value.
 .SH "CONFORMING TO"
 POSIX.1-2008, 4.3BSD.
 .SH "SEE ALSO"
-- 
1.7.2.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
