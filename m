From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch], tty_ioctl(4): One warning from "groff", orthography
Date: Mon, 7 May 2012 09:46:13 +1200
Message-ID: <CAKgNAkgADR3R-ajeS8db2eVFdWru-7FEu-epZP4L7L=8nZfYWA@mail.gmail.com>
References: <20120506205744.GA1681@rhi.hi.is>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120506205744.GA1681-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Bjarni,

On Mon, May 7, 2012 at 8:57 AM, Bjarni Ingi Gislason <bjarniig-2945IVfuVpc@public.gmane.org=
s> wrote:
> Package: man-pages
> Version: 3.40
> Severity: minor
> Tags: patch
>
> =A0Warning from "groff -ww ..." (or "man --warnings=3Dw ..."):
>
> <standard input>:252: warning: tab character in unquoted macro argume=
nt
>
> =A0One misspelling corrected, period (full stop) in an ellipis
> "protected" with "\&".
>
> =A0Patch:
>
> --- tty_ioctl.4 2012-04-26 22:58:39.000000000 +0000
> +++ tty_ioctl.4.new =A0 =A0 2012-05-06 20:29:46.307796209 +0000
> @@ -8,7 +8,7 @@
> =A0.SH SYNOPSIS
> =A0.B "#include <termios.h>"
> =A0.sp
> -.BI "int ioctl(int " fd ", int " cmd ", ...);"
> +.BI "int ioctl(int " fd ", int " cmd ", \&...);"

I left this.

> =A0.SH DESCRIPTION
> =A0The
> =A0.BR ioctl (2)
> @@ -246,7 +246,7 @@
> =A0equals 1, in which case the terminal is stolen, and all processes =
that had
> =A0it as controlling terminal lose it.
> =A0.TP
> -.B TIOCNOTTY =A0 void
> +.B "TIOCNOTTY =A0void"

Applied.

> =A0If the given terminal was the controlling terminal of the calling =
process,
> =A0give up this controlling terminal.
> =A0If the process was session leader,
> @@ -299,7 +299,7 @@
> =A0.TP
> =A0.BI "TIOCSETD =A0const int *" argp
> =A0Set the line discipline of the terminal.
> -.SS "Psuedoterminal ioctls"
> +.SS "Pseudoterminal ioctls"

Applied.

thanks,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
