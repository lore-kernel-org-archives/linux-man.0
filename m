From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/5] strcat.3: ffix
Date: Mon, 13 Aug 2012 09:24:37 +0200
Message-ID: <CAKgNAkhvs6LjiPq633PiLG9P1Ocies=r8Bh=k_mAZVtY_DPrLQ@mail.gmail.com>
References: <1344821668-11324-1-git-send-email-taffit@debian.org> <1344821668-11324-4-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1344821668-11324-4-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied!

On Mon, Aug 13, 2012 at 3:34 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> ---
>  man3/strcat.3 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man3/strcat.3 b/man3/strcat.3
> index ef53641..a245283 100644
> --- a/man3/strcat.3
> +++ b/man3/strcat.3
> @@ -108,7 +108,7 @@ Some systems (the BSDs, Solaris, and others) prov=
ide the following function:
>  This function appends the null-terminated string
>  .I src
>  to the string
> -.I dest,
> +.IR dest ,
>  copying at most
>  .IR "size\-strlen(dest)\-1"
>  from
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
