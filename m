From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getdents.2: tfix
Date: Mon, 1 Apr 2013 08:25:22 +0200
Message-ID: <CAKgNAkj9rRuiEFdKOoh+s-_HNrYjyUCFW2ZuNLf4P19qnU1g+A@mail.gmail.com>
References: <1364523698-15564-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364523698-15564-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Thanks David. Applied.

On Fri, Mar 29, 2013 at 3:21 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> ---
>  man2/getdents.2 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man2/getdents.2 b/man2/getdents.2
> index b0fc971..91d0a31 100644
> --- a/man2/getdents.2
> +++ b/man2/getdents.2
> @@ -73,7 +73,7 @@ struct linux_dirent {
>                             offsetof(struct linux_dirent, d_name)) */
>      /*
>      char           pad;       // Zero padding byte
> -    char           d_type;    // File type (only since Linux 2.6.4;
> +    char           d_type;    // File type (only since Linux 2.6.4);
>                                // offset is (d_reclen \- 1)
>      */
>
> --
> 1.7.10.4
>



--
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
