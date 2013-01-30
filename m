From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] init_module.2: ffix
Date: Thu, 31 Jan 2013 00:55:49 +0100
Message-ID: <CAKgNAkjkBoUdxwyWWqL1mBP92tgNswwQ1eEP276urhUFnAqT4w@mail.gmail.com>
References: <1359581485-3062-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1359581485-3062-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks David. Applied.

On Wed, Jan 30, 2013 at 10:31 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wr=
ote:
> ---
>  man2/init_module.2 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man2/init_module.2 b/man2/init_module.2
> index 5b884b3..2215aac 100644
> --- a/man2/init_module.2
> +++ b/man2/init_module.2
> @@ -31,7 +31,7 @@ init_module, finit_module \- load a kernel module
>  .BI "                const char *" param_values );
>
>  .BI "int finit_module(int " fd ", const char *" param_values ,
> -.BI "                 int flags );
> +.BI "                 int " flags );
>  .fi
>
>  .IR Note :
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
