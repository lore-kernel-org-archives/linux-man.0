From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ipv6.7: ffix
Date: Fri, 2 Nov 2012 06:57:55 +0100
Message-ID: <CAKgNAkjY=EC-SvNt9ce-G7BTSegDxResKWmrUMJHkH61ToeLbg@mail.gmail.com>
References: <1351819149-17794-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1351819149-17794-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks David. Applied.

On Fri, Nov 2, 2012 at 2:19 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrot=
e:
> ---
>  man7/ipv6.7 |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/man7/ipv6.7 b/man7/ipv6.7
> index 5caa3ce..f558505 100644
> --- a/man7/ipv6.7
> +++ b/man7/ipv6.7
> @@ -187,7 +187,9 @@ Argument is a pointer to boolean.
>  Set delivery of the
>  .B IPV6_PKTINFO
>  control message on incoming datagrams.
> -Such control messages contain a struct in6_pktinfo, as per RFC 3542.
> +Such control messages contain a
> +.IR "struct in6_pktinfo" ,
> +as per RFC 3542.
>  Only allowed for
>  .B SOCK_DGRAM
>  or
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
