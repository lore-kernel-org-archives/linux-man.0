From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch], ptrace(2): Unnecessary escape before ">"
Date: Mon, 7 May 2012 08:51:41 +1200
Message-ID: <CAKgNAki_0bW43ffUsYLtRG06_h_iaGbBg-tzxjczPnqS660sdg@mail.gmail.com>
References: <20120506200217.GA1004@rhi.hi.is>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120506200217.GA1004-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Bjarni,

On Mon, May 7, 2012 at 8:02 AM, Bjarni Ingi Gislason <bjarniig-2945IVfuVpc@public.gmane.org=
s> wrote:
> Package: man-pages
> Version: 3.40
> Severity: minor
> Tags: patch
>
> =A0From "groff -ww ..." (or "man --warnings=3Dw ...":
>
> <standard input>:758: warning: escape character ignored before `>'
>
> =A0Also periods (full stop) in ellipises "protected" with "\&".

My knowledge here is a bit thin. Can you expand on the previous sentenc=
e please.

Thanks,

Michael


>
> =A0Patch:
>
> --- ptrace.2 =A0 =A02012-04-26 22:58:36.000000000 +0000
> +++ ptrace.2.new =A0 =A0 =A0 =A02012-05-06 01:13:38.000000000 +0000
> @@ -76,7 +76,7 @@
> =A0Ptrace commands are always sent to
> =A0a specific tracee using a call of the form
>
> - =A0 =A0ptrace(PTRACE_foo, pid, ...)
> + =A0 =A0ptrace(PTRACE_foo, pid, \&...\&)
>
> =A0where
> =A0.I pid
> @@ -752,7 +752,7 @@
> =A0.I WSTOPSIG(status)
> =A0macro can't be used to perform this examination,
> =A0because it returns the value
> -.IR "(status\>>8)\ &\ 0xff" .)
> +.IR "(status>>8)\ &\ 0xff" .)
> =A0.SS Signal-delivery-stop
> =A0When a (possibly multithreaded) process receives any signal except
> =A0.BR SIGKILL ,
> @@ -1507,14 +1507,14 @@
> =A0.LP
> =A0.nf
> =A0*** we get syscall-enter-stop in thread 1: **
> -PID1 execve("/bin/foo", "foo" <unfinished ...>
> +PID1 execve("/bin/foo", "foo" <unfinished \&...\&>
> =A0*** we issue PTRACE_SYSCALL for thread 1 **
> =A0*** we get syscall-enter-stop in thread 2: **
> -PID2 execve("/bin/bar", "bar" <unfinished ...>
> +PID2 execve("/bin/bar", "bar" <unfinished \&...\&>
> =A0*** we issue PTRACE_SYSCALL for thread 2 **
> =A0*** we get PTRACE_EVENT_EXEC for PID0, we issue PTRACE_SYSCALL **
> =A0*** we get syscall-exit-stop for PID0: **
> -PID0 <... execve resumed> ) =A0 =A0 =A0 =A0 =A0 =A0 =3D 0
> +PID0 <...\& execve resumed> ) =A0 =A0 =A0 =A0 =A0 =A0 =3D 0
> =A0.fi
> =A0.LP
> =A0If the
>
> --
> Bjarni I. Gislason



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
