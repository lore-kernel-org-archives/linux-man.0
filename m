From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/6] vfork.2: tfix
Date: Sun, 22 Mar 2015 16:42:40 +0100
Message-ID: <550EE2F0.6050908@gmail.com>
References: <1426381982-10434-1-git-send-email-saulery@free.fr> <1426381982-10434-5-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426381982-10434-5-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/15/2015 02:13 AM, St=C3=A9phane Aulery wrote:
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man2/vfork.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man2/vfork.2 b/man2/vfork.2
> index 0354456..0f90b2a 100644
> --- a/man2/vfork.2
> +++ b/man2/vfork.2
> @@ -203,7 +203,7 @@ can't be implemented on such systems.
>  .BR vfork ()
>  from the standard; the POSIX rationale for the
>  .BR posix_spawn (3)
> -function notes that that function,
> +function notes that function,

Actually, this is correct English. The "that"s are different.

Cheers,

Michael


>  which provides functionality equivalent to
>  .BR fork (2)+ exec (3),
>  is designed to be implementable on systems that lack an MMU.)
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
