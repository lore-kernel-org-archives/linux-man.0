From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] shutdown.2: POSIX compliant since version 3.7-rc1
Date: Thu, 26 Feb 2015 13:28:48 +0100
Message-ID: <CAKgNAkhO47NwYqECEiw2zap5LSzi1z-HiSja6GjSCseaP_jb2A@mail.gmail.com>
References: <1424947131-4034-1-git-send-email-saulery@free.fr>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424947131-4034-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: saulery <saulery-GANU6spQydw@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi St=C3=A9phane

These patches of yours are good, but lack info in commit messages
explaining why the change is being made, pointers bugzilla entries,
etc. Could you amend this patch and resend?

Thanks,

Michael
to

On 26 February 2015 at 11:38,  <saulery-GANU6spQydw@public.gmane.org> wrote:
> From: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
>
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man2/shutdown.2 | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/man2/shutdown.2 b/man2/shutdown.2
> index ab39cfd..2174de3 100644
> --- a/man2/shutdown.2
> +++ b/man2/shutdown.2
> @@ -102,14 +102,11 @@ respectively, and are defined in
>  .I <sys/socket.h>
>  since glibc-2.1.91.
>  .SH BUGS
> -As currently implemented,
> -checks for the validity of
> -.I how
> -are done in domain-specific code, and not all domains perform these =
checks.
> -.\" FIXME .
> -.\" https://bugzilla.kernel.org/show_bug.cgi?id=3D47111
> -Most notably, UNIX domain sockets simply ignore invalid values;
> -this may change in the future.
> +This implementation is POSIX compliant since version 3.7-rc1. Previo=
usly, UNIX
> +domain and DECnet sockets simply ignored invalid values of
> +.IR how ,
> +due to a domain-specific code. Applications that used invalid values=
 to
> +circumvent this lack should be corrected.
>  .SH SEE ALSO
>  .BR connect (2),
>  .BR socket (2),
> --
> 2.1.4
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
