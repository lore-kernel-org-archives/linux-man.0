From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] ip.7: Tiny style fix
Date: Thu, 4 Nov 2010 07:32:51 +0100
Message-ID: <AANLkTi=HN_iEx5O3siSVynG1ozdzwLTDtUyD8uSQL4LS@mail.gmail.com>
References: <iao03c$77p$1@dough.gmane.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <iao03c$77p$1@dough.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello David,

On Tue, Nov 2, 2010 at 4:21 AM, David Pr=E9vot <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org> wrot=
e:
> Hi,
>
> Here is a trivial patch to fix a bold dot that shouldn't be bold (sor=
ry
> that I didn't check this one better).

Thanks. Applied for 3.31.

Cheers,

Michael


> diff --git a/man7/ip.7 b/man7/ip.7
> index 821fa11..4561b2f 100644
> --- a/man7/ip.7
> +++ b/man7/ip.7
> @@ -41,7 +41,7 @@ For more information on sockets, see
> =A0An IP socket is created by calling the
> =A0.BR socket (2)
> =A0function as
> -.BI "socket(AF_INET, " socket_type ", " protocol ) \fP.
> +.BI "socket(AF_INET, " socket_type ", " protocol ) \fR.
> =A0Valid socket types are
> =A0.B SOCK_STREAM
> =A0to open a
>
>
> Regards
>
> David
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
