From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] perf_event_open.2: ffix
Date: Fri, 27 Dec 2013 07:43:30 +1300
Message-ID: <52BC78D2.4020808@gmail.com>
References: <1387145797-3597-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387145797-3597-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Thanks, David. Applied.

Cheers,

Michael



On 12/16/13 11:16, David Pr=E9vot wrote:
> ---
>  man2/perf_event_open.2 |   12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 6d42c41..260e772 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -797,11 +797,11 @@ If set, don't count when the CPU is idle.
>  The
>  .I mmap
>  bit enables generation of
> -.I PERF_RECORD_MMAP
> +.B PERF_RECORD_MMAP
>  samples for every
>  .BR mmap (2)
>  call that has
> -.I PROT_EXEC
> +.B PROT_EXEC
>  set.
>  This allows tools to notice new executable code being mapped into
>  a program (dynamic shared libraries for example)
> @@ -811,9 +811,9 @@ so that addresses can be mapped back to the origi=
nal code.
>  The
>  .I comm
>  bit enables tracking of process command name as modified by the
> -.IR exec (2)
> +.BR exec (2)
>  and
> -.IR prctl (PR_SET_NAME)
> +.BR prctl (PR_SET_NAME)
>  system calls.
>  Unfortunately for tools,
>  there is no way to distinguish one system call versus the other.
> @@ -886,11 +886,11 @@ The counterpart of the
>  .I mmap
>  field.
>  This enables generation of
> -.I PERF_RECORD_MMAP
> +.B PERF_RECORD_MMAP
>  samples for
>  .BR mmap (2)
>  calls that do not have
> -.I PROT_EXEC
> +.B PROT_EXEC
>  set (for example data and SysV shared memory).
>  .TP
>  .IR "sample_id_all" " (Since Linux 2.6.38)"
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
