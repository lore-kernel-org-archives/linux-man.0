From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/5] mcheck.3: Remove already fixed FIXMEs
Date: Tue, 25 Sep 2012 05:56:00 +0200
Message-ID: <CAKgNAkizqJdOyTHGv_QLcobEqh_E50xnnvwQ+nN2UndgZaxY-w@mail.gmail.com>
References: <CAKgNAkgKVXfzKqe8qy+ZWSy-ZvhPrM0_sooKM4HG+UTfhbX6BQ@mail.gmail.com>
 <1348432502-26050-1-git-send-email-taffit@debian.org> <1348432502-26050-3-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1348432502-26050-3-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied, thanks!

On Sun, Sep 23, 2012 at 10:35 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wr=
ote:
> ---
>  man3/mcheck.3 |    3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/man3/mcheck.3 b/man3/mcheck.3
> index d54990b..14e9fc2 100644
> --- a/man3/mcheck.3
> +++ b/man3/mcheck.3
> @@ -203,8 +203,5 @@ main(int argc, char *argv[])
>  .fi
>  .SH SEE ALSO
>  .BR malloc (3),
> -.\" FIXME add SEE ALSO pointer from malloc(3) to here
> -.\" FIXME add SEE ALSO pointer from mallopt(3) to here
> -.\" FIXME add SEE ALSO pointer from mtrace(3) to here
>  .BR mallopt (3),
>  .BR mtrace (3)
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
