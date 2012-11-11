From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getauxval.3: ffix
Date: Sun, 11 Nov 2012 08:58:06 +0100
Message-ID: <CAKgNAkj3edY5aNFOHPX77+wmDw_3buHZN82W74+Ny8BQpsKq-A@mail.gmail.com>
References: <1352503078-32586-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352503078-32586-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, David. Applied


On Sat, Nov 10, 2012 at 12:17 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wr=
ote:
> ---
>  man3/getauxval.3 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man3/getauxval.3 b/man3/getauxval.3
> index 825b224..3b456ed 100755
> --- a/man3/getauxval.3
> +++ b/man3/getauxval.3
> @@ -119,7 +119,7 @@ The instruction cache block size.
>  .TP
>  .BR AT_PAGESZ
>  The system page size (the same value returned by
> -.IR sysconf(_SC_PAGESIZE) .
> +.IR sysconf(_SC_PAGESIZE) ).
>  .TP
>  .BR AT_PHDR
>  The address of the program headers of the executable.
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
