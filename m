From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH draft_keys 7/7] keyrings.7: information regarding pre-3.17
 limits on root_maxbytes/root_maxkeys
Date: Fri, 25 Nov 2016 09:54:03 +0100
Message-ID: <44e0050d-a84b-410f-063c-d174ce5e53fa@gmail.com>
References: <51643019-bb42-4066-c824-c55b9e668ac6@man7.org>
 <20161125010133.GA892@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161125010133.GA892@obsidian>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/25/2016 02:01 AM, Eugene Syromyatnikov wrote:
> ---
>  man7/keyrings.7 | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)


Applied. Thanks, Eugene.

Cheers,

Michael


> diff --git a/man7/keyrings.7 b/man7/keyrings.7
> index 9dac4db..12853e8 100644
> --- a/man7/keyrings.7
> +++ b/man7/keyrings.7
> @@ -734,7 +734,8 @@ This is the maximum number of bytes of data that the root user
>  (UID 0 in the root user namespace)
>  can hold in the payloads of the keys owned by root.
>  
> -The default value in this file is 25,000,000.
> +.\"738c5d190f6540539a04baf36ce21d46b5da04bd
> +The default value in this file is 25,000,000 (was 20,000 before Linux 3.17).
>  .\" commit 0b77f5bfb45c13e1e5142374f9d6ca75292252a4
>  .TP
>  .IR /proc/sys/kernel/keys/root_maxkeys " (since Linux 2.6.26)"
> @@ -743,7 +744,8 @@ This is the maximum number of keys that the root user
>  (UID 0 in the root user namespace)
>  may own.
>  
> -The default value in this file is 1,000,000.
> +.\"738c5d190f6540539a04baf36ce21d46b5da04bd
> +The default value in this file is 1,000,000 (was 200 before Linux 3.17).
>  .PP
>  With respect to keyrings,
>  note that each link in a keyring consumes 4 bytes of the keyring payload.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
