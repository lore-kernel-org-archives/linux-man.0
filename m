From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] ptrace.2: more ffix and tfix
Date: Sat, 24 Mar 2012 12:27:59 +1300
Message-ID: <CAKgNAkiTRDV_8uSjZeaSzODwqOYiD2EQjJ3WSfvcJvh=t9eOjQ@mail.gmail.com>
References: <1332444186-16345-1-git-send-email-taffit@debian.org> <1332472329-31499-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1332472329-31499-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

HI David,

On Fri, Mar 23, 2012 at 4:12 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> The previous ones were spotted during the translations, while those w=
ere
> spotted during its review.
>
> Regards
>
> David
> ---
> =A0man2/ptrace.2 | =A0 14 ++++++++------
> =A01 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/man2/ptrace.2 b/man2/ptrace.2
> index 457c6ac..62f4458 100644
> --- a/man2/ptrace.2
> +++ b/man2/ptrace.2
> @@ -180,7 +180,8 @@ The word is returned as the result of the
> =A0call.
> =A0Typically, the offset must be word-aligned, though this might vary=
 by
> =A0architecture.
> -See NOTES.
> +See
> +.BR NOTES .

Not applied (See previous mail)

> =A0.RI ( data
> =A0is ignored.)
> =A0.TP
> @@ -264,7 +265,7 @@ itself.
> =A0.RI ( addr
> =A0is ignored.)
> =A0.TP
> -.BR PTRACE_SETOPTIONS " (since Linux 2.4.6; see BUGS for caveats)"
> +.BR PTRACE_SETOPTIONS " (since Linux 2.4.6; see " BUGS " for caveats=
)"

Not applied (See previous mail)

> =A0Set ptrace options from
> =A0.IR data .
> =A0.RI ( addr
> @@ -718,7 +719,7 @@ Example:
> =A0.\" =A0 =A0 describe how wait notifications queue (or not queue)
> =A0.LP
> =A0The following kinds of ptrace-stops exist: signal-delivery-stops,
> -group-stop,
> +group-stops,

I actually spotted this one myself while going though your previous
patch, and fixed it.

> =A0.B PTRACE_EVENT
> =A0stops, syscall-stops.
> =A0They all are reported by
> @@ -802,12 +803,12 @@ Note that a suppressed signal still causes syst=
em calls to return
> =A0prematurely.
> =A0In this case system calls will be restarted: the tracer will
> =A0observe the tracee to reexecute the interrupted system call (or
> -.BR restart_syscall(2)
> +.BR restart_syscall (2)

Applied.

> =A0system call for a few syscalls which use a different mechanism
> =A0for restarting) if the tracer uses
> =A0.BR PTRACE_SYSCALL .
> =A0Even system calls (such as
> -.BR poll(2) )
> +.BR poll (2))

Applied.

> =A0which are not restartable after signal are restarted after
> =A0signal is suppressed;
> =A0however, kernel bugs exist which cause some syscalls to fail with
> @@ -1454,7 +1455,8 @@ The
> =A0.B PTRACE_O_TRACEEXEC
> =A0option is the recommended tool for dealing with this situation.
> =A0First, it enables
> -.BR PTRACE_EVENT_EXEC -stop,
> +.B PTRACE_EVENT_EXEC
> +stop,

Applied.

> =A0which occurs before
> =A0.BR execve(2)
> =A0returns.
> --
> 1.7.9.1
>

Thanks, David!

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
