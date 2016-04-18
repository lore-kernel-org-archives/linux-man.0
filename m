From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] elf.5: wfix
Date: Mon, 18 Apr 2016 14:04:43 +0100
Message-ID: <5714DB6B.7090103@gmail.com>
References: <20160409031417.398e3a85.alex.miller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160409031417.398e3a85.alex.miller-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/09/2016 02:14 AM, Alexander Miller wrote:
> Restore "before" deleted in 9c08fc7d47913501acfc18e0035e08b31e0a7cd9
> 
> Signed-off-by: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>

Thanks, Alex. Applied.

Cheers,

Michael


> ---
>  man5/elf.5 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man5/elf.5 b/man5/elf.5
> index af9af8a..3a02757 100644
> --- a/man5/elf.5
> +++ b/man5/elf.5
> @@ -1767,7 +1767,7 @@ apply to a nonwritable segment
>  Address of relocation entries associated solely with the PLT
>  .TP
>  .BR DT_BIND_NOW
> -Instruct dynamic linker to process all relocations
> +Instruct dynamic linker to process all relocations before
>  transferring control to the executable
>  .TP
>  .BR DT_RUNPATH
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
