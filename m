From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH draft_keys 3/7] keyrings.7: spacing fix
Date: Fri, 25 Nov 2016 09:39:15 +0100
Message-ID: <d998434e-351a-bd6a-91b8-a3ff1b38e559@gmail.com>
References: <51643019-bb42-4066-c824-c55b9e668ac6@man7.org>
 <20161125010104.GA453@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161125010104.GA453@obsidian>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/25/2016 02:01 AM, Eugene Syromyatnikov wrote:
> ---
>  man7/keyrings.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thanks, Eugene.

Cheers,

Michael


> diff --git a/man7/keyrings.7 b/man7/keyrings.7
> index ed3bbee..c15a273 100644
> --- a/man7/keyrings.7
> +++ b/man7/keyrings.7
> @@ -145,7 +145,7 @@ that should not be readable from user space.
>  .\" commit ab3c3587f8cda9083209a61dbe3a4407d3cada10
>  This key type is similar to the
>  .I """user"""
> -key type, but it may hold a payload of up to 1MiB in size.
> +key type, but it may hold a payload of up to 1 MiB in size.
>  The data may be stored in the swap space rather than in kernel memory
>  if the data size exceeds the overhead of storing the data in swap space
>  (a tmpfs file is used, which requires filesystem structures
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
