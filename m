From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fcntl.2: pfix
Date: Mon, 15 Sep 2014 11:10:48 +0200
Message-ID: <5416AD18.30003@gmail.com>
References: <1410747921-16888-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410747921-16888-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?windows-1252?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, David. Applied.

Cheers,

Michael


On 09/15/2014 04:25 AM, David Pr=E9vot wrote:
> ---
>  man2/fcntl.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man2/fcntl.2 b/man2/fcntl.2
> index 77892a2..59f22ce 100644
> --- a/man2/fcntl.2
> +++ b/man2/fcntl.2
> @@ -475,7 +475,7 @@ in most respects identical to the traditional rec=
ord locks described above.
>  This lock type is Linux-specific,
>  and available since Linux 3.15.
>  For an explanation of open file descriptions, see
> -.BR open (2)
> +.BR open (2).
> =20
>  The principal difference between the two lock types
>  is that whereas traditional record locks
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
