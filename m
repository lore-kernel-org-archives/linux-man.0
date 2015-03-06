From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/6] intro.1: Add cross references cited
Date: Fri, 06 Mar 2015 14:46:42 +0100
Message-ID: <54F9AFC2.3070607@gmail.com>
References: <1425646053-7294-1-git-send-email-saulery@free.fr> <1425646053-7294-2-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425646053-7294-2-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: saulery-GANU6spQydw@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/06/2015 01:47 PM, saulery-GANU6spQydw@public.gmane.org wrote:
> From: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>


Thanks, St=C3=A9phane. Applied.

Cheers,

Michael


> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man1/intro.1 | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/man1/intro.1 b/man1/intro.1
> index c554884..0caa0c4 100644
> --- a/man1/intro.1
> +++ b/man1/intro.1
> @@ -300,4 +300,15 @@ and use a browser if you find HTML files there.
>  .\" Actual examples? Separate section for each of cat, cp, ...?
>  .\" gzip, bzip2, tar, rpm
>  .SH SEE ALSO
> +.BR ash (1),
> +.BR bash (1),
> +.BR chsh (1),
> +.BR csh (1),
> +.BR locate (1),
> +.BR login (1),
> +.BR man (1),
> +.BR xterm (1),
> +.BR zsh(1),
> +.BR wait (2),
> +.BR man-pages (7),
>  .BR standards (7)
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
