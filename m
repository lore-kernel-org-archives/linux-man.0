From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] idle.2: wfix
Date: Tue, 29 Jan 2013 01:38:27 +0100
Message-ID: <CAKgNAkgch9EwvCtwLG=o57T345x+y9Y29KSzAOSBw1PEeBycOQ@mail.gmail.com>
References: <1359329473-686-1-git-send-email-spaillard@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1359329473-686-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Jan 28, 2013 at 12:31 AM, Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrote:
> Typo introduced by 1330fa295944be7f86f41c5af9cdbb1173418a16
>     idle.2: Minor wording fixes

Thanks Simon. Applied.

Cheers,

Michael


> ---
>  man2/idle.2 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man2/idle.2 b/man2/idle.2
> index e12a1a5..00c9599 100644
> --- a/man2/idle.2
> +++ b/man2/idle.2
> @@ -57,7 +57,7 @@ never returns for process 0, and always returns \-1 for a user process.
>  .B EPERM
>  Always, for a user process.
>  .SH VERSIONS
> -linux Since 2.3.13, this system call does not exist anymore.
> +Since Linux 2.3.13, this system call does not exist anymore.
>  .SH "CONFORMING TO"
>  This function is Linux-specific, and should not be used in programs
>  intended to be portable.
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
