From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sysctl.2: tfix
Date: Sun, 23 Dec 2012 18:57:24 +0100
Message-ID: <CAKgNAkihwTKNegpFjK+CRC3enbCR8eGyhvqmP9+hNqDE+yM99g@mail.gmail.com>
References: <1356269879-21110-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1356269879-21110-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, David. Applied.

On Sun, Dec 23, 2012 at 2:37 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> ---
>  man2/sysctl.2 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man2/sysctl.2 b/man2/sysctl.2
> index bb2d9a5..3486e86 100644
> --- a/man2/sysctl.2
> +++ b/man2/sysctl.2
> @@ -119,7 +119,7 @@ use of this system call has long been discouraged=
,
>  and it is so unloved that
>  \fBit is likely to disappear in a future kernel version\fP.
>  .\" See http://lwn.net/Articles/247243/
> -Since Linix 2.6.24,
> +Since Linux 2.6.24,
>  uses of this system call result in warnings in the kernel log.
>  .\" Though comments in suggest that it is needed by old glibc binari=
es,
>  .\" so maybe it's not going away.
> --
> 1.7.10.4
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
