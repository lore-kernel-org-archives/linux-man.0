From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clone.2, fork.2: Document ERESTARTNOINTR error code
Date: Mon, 9 May 2016 22:32:15 +0200
Message-ID: <bfbed141-6fb7-b008-7ac4-e24db340f68f@gmail.com>
References: <1462352156.3183.1.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462352156.3183.1.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/04/2016 10:55 AM, Nikola Forr=C3=B3 wrote:
> Since Linux 2.6.17, clone and fork syscalls return ERESTARTNOINTR
> when interrupted by a signal before newly created process is added
> to its process group.
> This error code can only be seen by ptrace at syscall exit tracing.
>=20
> The information was obtained from kernel source code:
> http://bit.ly/24xdofn

Thanks Nikola. I see this relates to kernel commit 4a2c7a7837da.=20
Patch applied.

Cheers,

Michael


> Signed-off-by: Nikola Forr=C3=B3 <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  man2/clone.2 | 4 ++++
>  man2/fork.2  | 4 ++++
>  2 files changed, 8 insertions(+)
>=20
> diff --git a/man2/clone.2 b/man2/clone.2
> index 8373700..ab1e58d 100644
> --- a/man2/clone.2
> +++ b/man2/clone.2
> @@ -1013,6 +1013,10 @@ and the call would cause the limit on the numb=
er of
>  nested user namespaces to be exceeded.
>  See
>  .BR user_namespaces (7).
> +.TP
> +.BR ERESTARTNOINTR " (since Linux 2.6.17)"
> +System call was interrupted by a signal and will be restarted.
> +(This can be seen only during a trace.)
>  .SH VERSIONS
>  There is no entry for
>  .BR clone ()
> diff --git a/man2/fork.2 b/man2/fork.2
> index 559a47f..3accc8c 100644
> --- a/man2/fork.2
> +++ b/man2/fork.2
> @@ -242,6 +242,10 @@ failed to allocate the necessary kernel structur=
es because memory is tight.
>  is not supported on this platform (for example,
>  .\" e.g., arm (optionally), blackfin, c6x, frv, h8300, microblaze, x=
tensa
>  hardware without a Memory-Management Unit).
> +.TP
> +.BR ERESTARTNOINTR " (since Linux 2.6.17)"
> +System call was interrupted by a signal and will be restarted.
> +(This can be seen only during a trace.)
>  .SH CONFORMING TO
>  POSIX.1-2001, POSIX.1-2008, SVr4, 4.3BSD.
>  .SH NOTES
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
