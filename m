From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] prctl.2: typo
Date: Thu, 7 Feb 2013 00:57:40 +0100
Message-ID: <CAKgNAkiFD_noYKvPrzUoVn8Cn57ghTvqf262f7zJnj2LySLVYw@mail.gmail.com>
References: <1360175663-3742-1-git-send-email-shawnlandden@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360175663-3742-1-git-send-email-shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Feb 6, 2013 at 7:34 PM, Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> ---
>  man2/prctl.2 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man2/prctl.2 b/man2/prctl.2
> index 36fdc14..e4a1030 100644
> --- a/man2/prctl.2
> +++ b/man2/prctl.2
> @@ -357,7 +357,7 @@ if
>  is permitted, then the seccomp mode is preserved across
>  .BR execve (2).
>  If the filters permit
> -.BR prctl (0
> +.BR prctl (2)

Fixed, but should be

.BR prctl()

Thanks!

Michael


>  calls, then additional filters can be added;
>  they are run in order until the first non-allow result is seen.
>
> --
> 1.7.9.5
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
