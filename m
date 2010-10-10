From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] psiginfo.3, psignal.3: Document psiginfo()
Date: Sun, 10 Oct 2010 17:22:57 +0200
Message-ID: <AANLkTi=WhRscu96fioF0jvfp2a874gtA=niw-DDx8NC-@mail.gmail.com>
References: <20101006065142.GA26673@gaara.hadrons.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20101006065142.GA26673-v62vTE6/wQGgM1MOaoewpti2O/JbrIOy@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Oct 6, 2010 at 8:51 AM, Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org> wro=
te:
> Signed-off-by: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
> ---
> =A0man3/psiginfo.3 | =A0 =A01 +
> =A0man3/psignal.3 =A0| =A0 28 ++++++++++++++++++++--------
> =A02 files changed, 21 insertions(+), 8 deletions(-)
> =A0create mode 100644 man3/psiginfo.3
>
> diff --git a/man3/psiginfo.3 b/man3/psiginfo.3
> new file mode 100644
> index 0000000..cd748fa
> --- /dev/null
> +++ b/man3/psiginfo.3
> @@ -0,0 +1 @@
> +.so man3/psignal.3
> diff --git a/man3/psignal.3 b/man3/psignal.3
> index 128fe8f..729acc9 100644
> --- a/man3/psignal.3
> +++ b/man3/psignal.3
> @@ -25,16 +25,15 @@
> =A0.\" =A0 =A0 Lewine's _POSIX Programmer's Guide_ (O'Reilly & Associ=
ates, 1991)
> =A0.\" =A0 =A0 386BSD man pages
> =A0.\" Modified Sat Jul 24 18:45:17 1993 by Rik Faith (faith-+5Oa3zvhR2o@public.gmane.org=
du)
> -.\" FIXME glibc 2.10 adds psiginfo(), specified in SUSv4. =A0This fu=
nction
> -.\" should be documented, probably on this page.
> -.TH PSIGNAL 3 =A02008-08-21 "GNU" "Linux Programmer's Manual"
> +.TH PSIGNAL 3 =A02010-10-06 "GNU" "Linux Programmer's Manual"
> =A0.SH NAME
> -psignal \- print signal message
> +psignal, psiginfo \- print signal message
> =A0.SH SYNOPSIS
> =A0.nf
> =A0.B #include <signal.h>
> =A0.sp
> =A0.BI "void psignal(int " sig ", const char *" s );
> +.BI "void psiginfo(const siginfo_t *" pinfo ", const char *" s );
> =A0.sp
> =A0.BI "extern const char *const " sys_siglist [];
> =A0.fi
> @@ -47,23 +46,36 @@ Feature Test Macro Requirements for glibc (see
> =A0.BR psignal ():
> =A0_SVID_SOURCE || _BSD_SOURCE
> =A0.br
> +.BR psiginfo ():
> +_XOPEN_SOURCE\ >=3D\ 700 || _POSIX_C_SOURCE\ >=3D\ 200809L
> +.br
> =A0.IR sys_siglist :
> =A0_BSD_SOURCE
> =A0.SH DESCRIPTION
> =A0The
> =A0.BR psignal ()
> -function displays a message on \fIstderr\fP
> +and
> +.BR psiginfo ()
> +functions display a message on \fIstderr\fP
> =A0consisting of the string \fIs\fP, a colon, a space, and a string
> -describing the signal number \fIsig\fP.
> -If \fIsig\fP is invalid,
> +describing the signal number \fIsig\fP or signal information \fIpinf=
o\fP.
> +If the string \fIs\fP is NULL or empty, the colon and space are omit=
ted.
> +For
> +.BR psignal ()
> +if \fIsig\fP is invalid,
> =A0the message displayed will indicate an unknown signal.
> +For
> +.BR psiginfo (),
> +\fIpinfo\fP should point to a valid \fIsiginfo_t\fP structure.
> =A0.PP
> =A0The array \fIsys_siglist\fP holds the signal description strings
> =A0indexed by signal number.
> =A0.SH "RETURN VALUE"
> =A0The
> =A0.BR psignal ()
> -function returns no value.
> +and
> +.BR psiginfo ()
> +functions return no value.
> =A0.SH "CONFORMING TO"
> =A0POSIX.1-2008, 4.3BSD.
> =A0.SH "SEE ALSO"
> --
> 1.7.2.3

Guillem,

Thanks for this patch. I'd like to have more detail about what
psiginfo() displays, though I appreciate that it is difficult to
describe this compactly. Also there seem to be bugs in the interface.
I filed the following:
http://sourceware.org/bugzilla/show_bug.cgi?id=3D12107
http://sourceware.org/bugzilla/show_bug.cgi?id=3D12108
Do these also look like problems to you?

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
