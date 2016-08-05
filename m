From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Changes.old: tfix
Date: Sat, 6 Aug 2016 09:52:26 +1000
Message-ID: <9fb292e5-17cc-991c-be81-14cf6d4abcb4@gmail.com>
References: <1470392187-7286-1-git-send-email-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470392187-7286-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/05/2016 08:16 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Thanks, Jakub! Applied.

Cheers,

Michael


> ---
>  Changes.old | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Changes.old b/Changes.old
> index 1035ec3..c9e737a 100644
> --- a/Changes.old
> +++ b/Changes.old
> @@ -42217,7 +42217,7 @@ charsets.7
>          Remove console(4) references
>              0f9e647 removed the obsolete console(4) page but we still have few
>              references to it. The patch below removes them or converts to refs
> -            to concole_ioctl(4) where appropriate.
> +            to console_ioctl(4) where appropriate.
>
>  console_ioctl.4
>      Michael Kerrisk  [Chris Gassib]
> @@ -42386,7 +42386,7 @@ unix.7
>      Michael Kerrisk
>          Expand discussion of socket permissions
>      Michael Kerrisk
> -        Fix statement about permissions needed to connect to a UNIX doain socket
> +        Fix statement about permissions needed to connect to a UNIX domain socket
>              Read permission is not required (verified by experiment).
>      Michael Kerrisk
>          Clarify ownership and permissions assigned during socket creation
>


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
