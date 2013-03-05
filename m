From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nss.5: tfix
Date: Tue, 5 Mar 2013 17:38:54 +0100
Message-ID: <CAKgNAkhBY13JUD3BXmo62x=4GCp78Q_p475sQ-OHLdFTKptEZQ@mail.gmail.com>
References: <1362355950-12047-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1362355950-12047-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks David. Applied.

On Mon, Mar 4, 2013 at 1:12 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrot=
e:
> ---
>  man5/nss.5 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man5/nss.5 b/man5/nss.5
> index 9486a7e..45c91e1 100644
> --- a/man5/nss.5
> +++ b/man5/nss.5
> @@ -71,7 +71,7 @@ If set to TRUE, the NIS backend for the
>  .BR getservbyname (3)
>  and
>  .BR getservbyname_r (3)
> -function will assume that the
> +functions will assume that the
>  .I services.byservicename
>  NIS map exists and is authoritative, particularly
>  that it contains both keys with /proto and without /proto for both
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
