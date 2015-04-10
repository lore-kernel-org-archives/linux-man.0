From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getcwd.3: ffix - make EINVAL and ENAMETOOLONG bold
Date: Fri, 10 Apr 2015 07:24:14 +0200
Message-ID: <55275E7E.5030508@gmail.com>
References: <55269D0E.5020202@tuffbizz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55269D0E.5020202-d4iiUcZhRQBWk0Htik3J/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: William Woodruff <william-d4iiUcZhRQBWk0Htik3J/w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/09/2015 05:38 PM, William Woodruff wrote:
> Neither EINVAL nor ENAMETOOLONG were bolded in the ERRORS section.

Thanks, William.

Applied.

Cheers,

Michael


> Signed-off-by: William Woodruff <william-d4iiUcZhRQBWk0Htik3J/w@public.gmane.org>
> ---
>  man3/getcwd.3 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man3/getcwd.3 b/man3/getcwd.3
> index 1f22f9d..b50339c 100644
> --- a/man3/getcwd.3
> +++ b/man3/getcwd.3
> @@ -199,12 +199,12 @@ argument is zero and
>  .I buf
>  is not a null pointer.
>  .TP
> -EINVAL
> +.B EINVAL
>  .BR getwd ():
>  .I buf
>  is NULL.
>  .TP
> -ENAMETOOLONG
> +.B ENAMETOOLONG
>  .BR getwd ():
>  The size of the null-terminated absolute pathname string exceeds
>  .B PATH_MAX
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
