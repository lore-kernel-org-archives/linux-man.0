From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] elf.5: wfix
Date: Mon, 18 Apr 2016 14:04:52 +0100
Message-ID: <5714DB74.1040902@gmail.com>
References: <20160409031417.398e3a85.alex.miller@gmx.de>
 <20160409031745.11d94c02.alex.miller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160409031745.11d94c02.alex.miller-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/09/2016 02:17 AM, Alexander Miller wrote:
> Signed-off-by: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>

Thanks, Alex. Applied.

Cheers,

Michael


> ---
>  man5/elf.5 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man5/elf.5 b/man5/elf.5
> index 3a02757..6cc4898 100644
> --- a/man5/elf.5
> +++ b/man5/elf.5
> @@ -1450,7 +1450,7 @@ which holds character representations of the symbol names.
>  If the value
>  is nonzero, it represents a string table index that gives the symbol
>  name.
> -Otherwise, the symbol table has no name.
> +Otherwise, the symbol has no name.
>  .TP
>  .IR st_value
>  This member gives the value of the associated symbol.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
