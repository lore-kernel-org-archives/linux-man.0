From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getline.3: wfix
Date: Wed, 12 Jul 2017 19:36:59 +0200
Message-ID: <97ac1c71-ae24-666f-5ca0-a2589f008d2b@gmail.com>
References: <1499847001-83794-1-git-send-email-w@laoqinren.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1499847001-83794-1-git-send-email-w-m92B/FuLcaEcWVvVuXF20w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Long Wang <w@laoqinren.net>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/12/2017 10:10 AM, Long Wang wrote:
> Signed-off-by: Long Wang <w@laoqinren.net>

Thanks, Long. Patch applied.

Cheers,

Michael

> ---
>  man3/getline.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/getline.3 b/man3/getline.3
> index 7483afd..9bc4d8e 100644
> --- a/man3/getline.3
> +++ b/man3/getline.3
> @@ -173,7 +173,7 @@ main(int argc, char *argv[])
>      ssize_t nread;
>  
>      if (argc != 2) {
> -        fprintf(stderr, "Usage: %s <file>\en", argv[1]);
> +        fprintf(stderr, "Usage: %s <file>\en", argv[0]);
>          exit(EXIT_FAILURE);
>      }
>  
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
