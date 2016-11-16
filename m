From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/5] add_key.2: tfix
Date: Wed, 16 Nov 2016 18:56:42 +0100
Message-ID: <5e8517bd-0435-76e7-23e9-b3aa0455227a@gmail.com>
References: <9a5cc2a7-a505-9d0d-5b78-4bc5ab100ff1@gmail.com>
 <20161115084335.GA19948@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161115084335.GA19948@obsidian>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/15/2016 09:43 AM, Eugene Syromyatnikov wrote:
> ---
>  man2/add_key.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hi Eugene,

As it happens, I'd found and fixed this already.

Cheers,

Michael

> diff --git a/man2/add_key.2 b/man2/add_key.2
> index 0f4d109..1dfbd7d 100644
> --- a/man2/add_key.2
> +++ b/man2/add_key.2
> @@ -35,7 +35,7 @@ of length
>  .IR plen ,
>  attaches it to the nominated
>  .IR keyring ,
> -and return the key's serial number.
> +and returns the key's serial number.
>  .P
>  The key type may reject the data if it is in the wrong format or
>  is in some other way invalid.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
