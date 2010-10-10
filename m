From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] psiginfo.3, psignal.3: Document psiginfo()
Date: Sun, 10 Oct 2010 18:21:25 +0200
Message-ID: <AANLkTim==RDg8a8eVYT1Dd=RRe2HKVaffW178opoycwe@mail.gmail.com>
References: <20101006065142.GA26673@gaara.hadrons.org> <AANLkTi=WhRscu96fioF0jvfp2a874gtA=niw-DDx8NC-@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=WhRscu96fioF0jvfp2a874gtA=niw-DDx8NC--JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Guillem,

I applied the slightly modified version of your patch below. Thanks!

Cheers,

Michael--- a/man3/psignal.3
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
@@ -47,23 +46,39 @@ Feature Test Macro Requirements for glibc (see
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
 function displays a message on \fIstderr\fP
-consisting of the string \fIs\fP, a colon, a space, and a string
-describing the signal number \fIsig\fP.
+consisting of the string \fIs\fP, a colon, a space, a string
+describing the signal number \fIsig\fP, and a trailing newline.
+If the string \fIs\fP is NULL or empty, the colon and space are omitted.
 If \fIsig\fP is invalid,
 the message displayed will indicate an unknown signal.
-.PP
+
+The
+.BR psiginfo ()
+function is like
+.BR psignal (),
+except that it displays information about the signal described by
+.IR pinfo ,
+which should point to a valid
+.I siginfo_t
+structure.
+
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
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
