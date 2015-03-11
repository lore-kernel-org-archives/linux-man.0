From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] intro.1: Fix errors introduced by the commit 6732bb8b0d550262dbd73de4d0789dd9f9ad294b
Date: Wed, 11 Mar 2015 06:51:59 +0100
Message-ID: <54FFD7FF.20706@gmail.com>
References: <54FEB103.6070200@gmail.com> <1426021565-2106-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426021565-2106-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/10/2015 10:06 PM, St=C3=A9phane Aulery wrote:
> - Restoration of the explanation session end.
> - Delete two supernumerary references.


Thanks, St=C3=A9phane. Applied.

Cheers,

Michael



> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man1/intro.1 | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/man1/intro.1 b/man1/intro.1
> index 9e3fa15..e509d03 100644
> --- a/man1/intro.1
> +++ b/man1/intro.1
> @@ -135,6 +135,8 @@ $
>  .fi
>  .RE
>  .LP
> +Here typing Control-D ended the session.
> +.LP
>  The
>  .B $
>  here was the command prompt\(emit is the shell's way of indicating
> @@ -331,11 +333,9 @@ and use a browser if you find HTML files there.
>  .BR locate (1),
>  .BR login (1),
>  .BR man (1),
> -.BR su (1),
>  .BR xterm (1),
> -.BR zsh(1),
> +.BR zsh (1),
>  .BR wait (2),
>  .BR stdout (3),
>  .BR man-pages (7),
> -.BR standards (7),
> -.BR shutdown (8)
> +.BR standards (7)
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
