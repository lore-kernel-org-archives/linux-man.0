From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] resolv.conf.5: tfix
Date: Fri, 11 May 2012 06:28:10 +1200
Message-ID: <CAKgNAkg3+b_ad3o8+kSX-M1UQ-fh9ANrp9KBUhLaarS1hMvg+w@mail.gmail.com>
References: <1336670984-28095-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1336670984-28095-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks David!

On Fri, May 11, 2012 at 5:29 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> ---
> =A0man5/resolv.conf.5 | =A0 =A02 +-
> =A01 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man5/resolv.conf.5 b/man5/resolv.conf.5
> index 589c315..e82ea72 100644
> --- a/man5/resolv.conf.5
> +++ b/man5/resolv.conf.5
> @@ -35,7 +35,7 @@ The file is designed to be human readable and conta=
ins a list of
> =A0keywords with values that provide various types of resolver inform=
ation.
> =A0.LP
> =A0If this file does not exist,
> -only the name server be on the local machine will be queried;
> +only the name server on the local machine will be queried;
> =A0the domain name is determined from the hostname
> =A0and the domain search path is constructed from the domain name.
> =A0.LP
> --
> 1.7.10
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
