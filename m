From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH draft_keys 4/7] keyrings.7: minor clarification regarding
 decision whether to store big_key in tmpfs or not
Date: Fri, 25 Nov 2016 09:40:36 +0100
Message-ID: <b21e8716-b6f7-f405-3d5d-b01087ab4b09@gmail.com>
References: <51643019-bb42-4066-c824-c55b9e668ac6@man7.org>
 <20161125010111.GA557@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161125010111.GA557@obsidian>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/25/2016 02:01 AM, Eugene Syromyatnikov wrote:
> ---
>  man7/keyrings.7 | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied. Thanks, Eugene.

Cheers,

Michael


> diff --git a/man7/keyrings.7 b/man7/keyrings.7
> index c15a273..2f452c6 100644
> --- a/man7/keyrings.7
> +++ b/man7/keyrings.7
> @@ -149,7 +149,8 @@ key type, but it may hold a payload of up to 1 MiB in size.
>  The data may be stored in the swap space rather than in kernel memory
>  if the data size exceeds the overhead of storing the data in swap space
>  (a tmpfs file is used, which requires filesystem structures
> -to be allocated in the kernel).
> +to be allocated in the kernel; the size of these determines size threshold
> +above which tmpfs storage method is used).
>  This key type is useful for tasks such as holding Kerberos ticket caches.
>  .PP
>  There are more specialized key types available also,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
