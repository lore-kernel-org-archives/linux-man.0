From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] chown.2: tfix
Date: Thu, 7 Feb 2013 23:11:58 +0100
Message-ID: <CAKgNAkjesFTK+aDx9S9t5b0c41zoNgtc=my=+VU1-jtFc-XmBQ@mail.gmail.com>
References: <1360264917-19511-1-git-send-email-spaillard@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360264917-19511-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks Simon. Applied.

On Thu, Feb 7, 2013 at 8:21 PM, Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrote:
> ---
>  man2/chown.2 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man2/chown.2 b/man2/chown.2
> index deb87c7..05e362d 100644
> --- a/man2/chown.2
> +++ b/man2/chown.2
> @@ -66,7 +66,7 @@ _XOPEN_SOURCE\ &&\ _XOPEN_SOURCE_EXTENDED
>  .PD
>  .SH DESCRIPTION
>  These system calls change the owner and group of a file.
> -The differ only in how the file is specified:
> +They differ only in how the file is specified:
>  .IP * 2
>  .BR chown ()
>  changes the ownership of the file specified by
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
