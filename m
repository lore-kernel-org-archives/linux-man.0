From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/5] add_key.2: change wording regarding storing of
 big_key payload
Date: Wed, 16 Nov 2016 18:56:56 +0100
Message-ID: <254d4bef-4d18-1106-e054-163c8d96e3e4@gmail.com>
References: <9a5cc2a7-a505-9d0d-5b78-4bc5ab100ff1@gmail.com>
 <20161115084414.GA20638@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161115084414.GA20638@obsidian>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/15/2016 09:44 AM, Eugene Syromyatnikov wrote:
> ---
>  man2/add_key.2 | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Hi Eugene,

Thanks. That's a rather better way of describing things. Patch applied.

Cheers,

Michael


> diff --git a/man2/add_key.2 b/man2/add_key.2
> index b693927..78b1b99 100644
> --- a/man2/add_key.2
> +++ b/man2/add_key.2
> @@ -126,8 +126,9 @@ contains a ':' that is preceded by other characters.
>  This key type is similar to
>  .IR """user""" ,
>  but may hold a payload of up to 1 MiB.
> -If the key payload is large,
> -then it may be stored in swap space rather than kernel memory.
> +If the key payload is large enough,
> +then it may be stored in tmpfs (which can be swapped out) rather than kernel
> +memory.
>  .PP
>  For further details on these key types, see
>  .BR keyrings (7).
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
