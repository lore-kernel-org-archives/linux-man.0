From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] strtol.3: mention 0X prefix
Date: Mon, 8 May 2017 11:00:51 +0200
Message-ID: <2ecc493d-638d-57b7-cdb5-f77a61218d42@gmail.com>
References: <20170505160528.3673-1-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170505160528.3673-1-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Heinrich.

On 05/05/2017 06:05 PM, Heinrich Schuchardt wrote:
> The prefix 0x may be capitalized as 0X.
> 
> See ISO/IEC 9899:1999.

Thanks. Applied!

Cheers,

Michael


> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man3/strtol.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/strtol.3 b/man3/strtol.3
> index 3b2a10126..a236e7671 100644
> --- a/man3/strtol.3
> +++ b/man3/strtol.3
> @@ -70,7 +70,7 @@ followed by a single optional \(aq+\(aq or \(aq\-\(aq sign.
>  If
>  .I base
>  is zero or 16, the string may then include a
> -"0x" prefix, and the number will be read in base 16; otherwise, a
> +"0x" or "0X" prefix, and the number will be read in base 16; otherwise, a
>  zero
>  .I base
>  is taken as 10 (decimal) unless the next character
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
