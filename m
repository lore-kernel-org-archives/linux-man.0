From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] statfs.2: tfix
Date: Thu, 5 Oct 2017 20:36:59 +0200
Message-ID: <a610c470-df4b-4268-058a-fed1a9013bab@gmail.com>
References: <20171003154512.9245-1-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171003154512.9245-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 10/03/2017 05:45 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Applied. Thanks, Jakub.

Cheers,

Michael


> ---
>  man2/statfs.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/statfs.2 b/man2/statfs.2
> index f3f01f0cd..276ce2061 100644
> --- a/man2/statfs.2
> +++ b/man2/statfs.2
> @@ -118,7 +118,7 @@ MINIX_SUPER_MAGIC2    0x138f     /* 30 char minix FS */
>  MINIX2_SUPER_MAGIC    0x2468     /* minix V2 FS */
>  MINIX2_SUPER_MAGIC2   0x2478     /* minix V2 FS, 30 char names */
>  MINIX3_SUPER_MAGIC    0x4d5a     /* minix V3 FS, 60 char names */
> -MQUEUE_MAGIC          0x19800202 /* POSIX messge queue FS */
> +MQUEUE_MAGIC          0x19800202 /* POSIX message queue FS */
>  MSDOS_SUPER_MAGIC     0x4d44
>  MTD_INODE_FS_MAGIC    0x11307854
>  NCP_SUPER_MAGIC       0x564c
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
