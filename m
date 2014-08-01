From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] open.2: wfix
Date: Fri, 01 Aug 2014 21:58:55 +0200
Message-ID: <53DBF17F.1080505@gmail.com>
References: <1406915246-8773-1-git-send-email-rahulbedarkar89@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406915246-8773-1-git-send-email-rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rahul Bedarkar <rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/01/2014 07:47 PM, Rahul Bedarkar wrote:
> Signed-off-by: Rahul Bedarkar <rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man2/open.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/open.2 b/man2/open.2
> index c413d96..84cbf0c 100644
> --- a/man2/open.2
> +++ b/man2/open.2
> @@ -1176,7 +1176,7 @@ Data integrity completion can reduce the number of disk operations
>  that are required for applications that don't need the guarantees
>  of file integrity completion.
>  
> -To understand the difference between the the two types of completion,
> +To understand the difference between two types of completion,
>  consider two pieces of file metadata:
>  the file last modification timestamp
>  .RI ( st_mtime )

Removing one "the" is good. Removing two is too many. I removed one.

Thanks,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
