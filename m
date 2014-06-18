From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] cpuset.7: tfix
Date: Wed, 18 Jun 2014 21:15:02 +0200
Message-ID: <53A1E536.4020208@gmail.com>
References: <1403110903-4197-1-git-send-email-yuray@komyakino.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403110903-4197-1-git-send-email-yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Yuri.Applied.

Cheers,

Michael


On 06/18/2014 07:01 PM, Yuri Kozlov wrote:
> ---
>  man7/cpuset.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man7/cpuset.7 b/man7/cpuset.7
> index 503c04c..3c74dac 100644
> --- a/man7/cpuset.7
> +++ b/man7/cpuset.7
> @@ -174,7 +174,7 @@ A process may be added to a cpuset (automatically removing
>  it from the cpuset that previously contained it) by writing its
>  PID to that cpuset's
>  .I tasks
> -file (with or without a trailing newline.)
> +file (with or without a trailing newline).
>  
>  .B Warning:
>  only one PID may be written to the
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
