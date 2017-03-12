From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] open.2: tfix
Date: Sun, 12 Mar 2017 10:50:48 +0100
Message-ID: <c7aa0afc-fece-6e0f-1ca7-29e88dbafc12@gmail.com>
References: <20170311230145.7243-1-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170311230145.7243-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/12/2017 12:01 AM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
> ---
>  man2/open.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, Jakub. Patch applied.

Cheers,

Michael

> diff --git a/man2/open.2 b/man2/open.2
> index 6e6398374..750cc1ad0 100644
> --- a/man2/open.2
> +++ b/man2/open.2
> @@ -178,7 +178,7 @@ Before each
>  the file offset is positioned at the end of the file,
>  as if with
>  .BR lseek (2).
> -The modification of the fle offset and the write operation
> +The modification of the file offset and the write operation
>  are performed as a single atomic step.
>  
>  .B O_APPEND
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
