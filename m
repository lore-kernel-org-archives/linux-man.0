From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] locale.5: tfix / minor clarification
Date: Fri, 12 Jun 2015 20:18:16 +0200
Message-ID: <557B2268.9080902@gmail.com>
References: <5576F61A.9090707@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5576F61A.9090707-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 06/09/2015 04:20 PM, Marko Myllynen wrote:
> Hi Michael,
> 
> the subject says it all, for reference see e.g. ja_JP.


Thanks, Marko. Applied.

Cheers,

Michael



> ---
>  man5/locale.5 |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/man5/locale.5 b/man5/locale.5
> index ee7c4f6..2f16677 100644
> --- a/man5/locale.5
> +++ b/man5/locale.5
> @@ -449,7 +449,7 @@ starting with the class name followed by the characters
>  belonging to the class.
>  .TP
>  .I charconv
> -followed by a list of locale-specific character map names
> +followed by a list of locale-specific character mapping names
>  which are then to be defined in the locale.
>  .TP
>  .I outdigit
> 
> Thanks,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
