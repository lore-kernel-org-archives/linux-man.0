From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] inotify.7: tfix
Date: Sat, 13 Sep 2014 19:16:08 -0700
Message-ID: <5414FA68.7070409@gmail.com>
References: <1410357654-3611-1-git-send-email-yuray@komyakino.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410357654-3611-1-git-send-email-yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. thanks, Yuri.

Cheers,

Michel

On 09/10/2014 07:00 AM, Yuri Kozlov wrote:
> ---
>  man7/inotify.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man7/inotify.7 b/man7/inotify.7
> index 5c2597b..725ae8e 100644
> --- a/man7/inotify.7
> +++ b/man7/inotify.7
> @@ -345,7 +345,7 @@ Only watch
>  .I pathname
>  if it is a directory.
>  Using this flag provides an application with a race-free way of
> -ensuring that the monitored objeect is a directory.
> +ensuring that the monitored object is a directory.
>  .RE
>  .PP
>  The following bits may be set in the
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
