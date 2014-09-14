From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] inotify.7: tfix
Date: Sat, 13 Sep 2014 19:16:37 -0700
Message-ID: <5414FA85.6070504@gmail.com>
References: <1410359126-3700-1-git-send-email-yuray@komyakino.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410359126-3700-1-git-send-email-yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks, Yuri.

Cheers,

Michel


On 09/10/2014 07:25 AM, Yuri Kozlov wrote:
> ---
>  man7/inotify.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man7/inotify.7 b/man7/inotify.7
> index 725ae8e..aecdacf 100644
> --- a/man7/inotify.7
> +++ b/man7/inotify.7
> @@ -801,7 +801,7 @@ since it requires that an application cycle through
>  .B INT_MAX
>  watch descriptors,
>  release a watch descriptor while leaving unread events for that
> -watch descriptor in the queue in the queue,
> +watch descriptor in the queue,
>  and then recycle that watch descriptor.
>  For this reason, and because there have been no reports
>  of the bug occurring in real-world applications,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
