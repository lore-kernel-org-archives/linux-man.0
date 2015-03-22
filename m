From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/6] inotify.7: tfix
Date: Sun, 22 Mar 2015 16:41:54 +0100
Message-ID: <550EE2C2.1080406@gmail.com>
References: <1426381982-10434-1-git-send-email-saulery@free.fr> <1426381982-10434-4-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426381982-10434-4-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/15/2015 02:13 AM, St=C3=A9phane Aulery wrote:
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

Thanks, St=C3=A9phane. Applied.

Cheers,

Michael

> ---
>  man7/inotify.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man7/inotify.7 b/man7/inotify.7
> index 1f433b6..3742bb8 100644
> --- a/man7/inotify.7
> +++ b/man7/inotify.7
> @@ -84,7 +84,7 @@ the state of a set of filesystem objects.
>  However, robust applications should allow for the fact that bugs
>  in the monitoring logic or races of the kind described below
>  may leave the cache inconsistent with the filesystem state.
> -It is probably wise to to do some consistency checking,
> +It is probably wise to do some consistency checking,
>  and rebuild the cache when inconsistencies are detected.
>  .SS Reading events from an inotify file descriptor
>  To determine what events have occurred, an application
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
