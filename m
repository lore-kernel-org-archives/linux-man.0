From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] tcp.7: tfix
Date: Tue, 04 Feb 2014 10:05:07 +0100
Message-ID: <52F0AD43.3040001@gmail.com>
References: <1391294257-25320-1-git-send-email-taffit@debian.org> <1391294257-25320-2-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391294257-25320-2-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks, David.

Cheers,

Michael


On 02/01/2014 11:37 PM, David Pr=E9vot wrote:
> ---
>  man7/tcp.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man7/tcp.7 b/man7/tcp.7
> index 9cd7206..4ec3894 100644
> --- a/man7/tcp.7
> +++ b/man7/tcp.7
> @@ -1060,7 +1060,7 @@ This option, like many others, will be inherite=
d by the socket returned by
>  .BR accept (2),
>  if it was set on the listening socket.
> =20
> -Further details on the user timeout" feature can be found in
> +Further details on the user timeout feature can be found in
>  RFC\ 793 and RFC\ 5482 ("TCP User Timeout Option").
>  .TP
>  .BR TCP_WINDOW_CLAMP " (since Linux 2.4)"
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
