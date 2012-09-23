From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] regex.3: ffix
Date: Sun, 23 Sep 2012 16:39:50 +0200
Message-ID: <CAKgNAkhRGbWFzLwAf6aZfBpxAR8gnLD7nwNM8Bd7HmYVL2eE+w@mail.gmail.com>
References: <1345086590-11949-1-git-send-email-taffit@debian.org> <1345086590-11949-4-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1345086590-11949-4-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks. Applied.

On Thu, Aug 16, 2012 at 5:09 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> ---
>  man3/regex.3 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man3/regex.3 b/man3/regex.3
> index b78309a..9c2bd06 100644
> --- a/man3/regex.3
> +++ b/man3/regex.3
> @@ -295,7 +295,7 @@ Invalid back reference to a subexpression.
>  POSIX.1-2001.
>  .SH "SEE ALSO"
>  .BR grep (1),
> -.BR regex (7),
> +.BR regex (7)
>  .br
>  The glibc manual section,
>  .I "Regular Expression Matching"
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
