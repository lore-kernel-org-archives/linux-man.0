From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ipv6.7: tfix
Date: Sun, 23 Dec 2012 18:55:15 +0100
Message-ID: <CAKgNAkg_QGc_T_Kjw34ExgHnDnZ0Df4nkFR6zisvT0=ZTQBYsg@mail.gmail.com>
References: <1356269632-19913-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1356269632-19913-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi David,

I applied the first change, but the second is unneeded.

Thanks,

Michael

On Sun, Dec 23, 2012 at 2:33 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> ---
>  man7/ipv6.7 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man7/ipv6.7 b/man7/ipv6.7
> index 506218a..bf0e991 100644
> --- a/man7/ipv6.7
> +++ b/man7/ipv6.7
> @@ -4,7 +4,6 @@
>  .\" and in case of nontrivial modification author and date
>  .\" of the modification is added to the header.
>  .\" $Id: ipv6.7,v 1.3 2000/12/20 18:10:31 ak Exp $
> -structure.
>  .\"
>  .\" The following socket options are undocumented
>  .\"    All of the folloing are from:
> @@ -213,6 +212,7 @@ programs that don't know how to deal with the IPv=
6 API.
>  Control membership in multicast groups.
>  Argument is a pointer to a
>  .I struct ipv6_mreq
> +structure.
>  .TP
>  .B IPV6_MTU
>  .BR getsockopt ():
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
