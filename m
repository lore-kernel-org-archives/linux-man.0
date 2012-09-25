From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/5] random.4: ffix
Date: Tue, 25 Sep 2012 05:54:56 +0200
Message-ID: <CAKgNAkh=nCP6atbcGvjFz2kGhA2dOE=g8=TyxQ9SAgXDMHWcuQ@mail.gmail.com>
References: <CAKgNAkgKVXfzKqe8qy+ZWSy-ZvhPrM0_sooKM4HG+UTfhbX6BQ@mail.gmail.com>
 <1348432502-26050-1-git-send-email-taffit@debian.org> <1348432502-26050-5-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1348432502-26050-5-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied!

On Sun, Sep 23, 2012 at 10:35 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wr=
ote:
> ---
>  man4/random.4 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man4/random.4 b/man4/random.4
> index 1d50aa7..ed35fd9 100644
> --- a/man4/random.4
> +++ b/man4/random.4
> @@ -214,6 +214,6 @@ generated once.
>  .\" The kernel's random number generator was written by
>  .\" Theodore Ts'o (tytso-f/2Lh7Kzk888qNwGfFDJ/Q@public.gmane.org).
>  .SH "SEE ALSO"
> -mknod (1)
> +.BR mknod (1)
>  .br
>  RFC\ 1750, "Randomness Recommendations for Security"
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
