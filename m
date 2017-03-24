From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] man-pages.7: wfix
Date: Fri, 24 Mar 2017 15:40:13 +0100
Message-ID: <7460dcc0-f1e3-12a5-c467-520998c09b76@gmail.com>
References: <20170321010906.2d7185bc.alex.miller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170321010906.2d7185bc.alex.miller-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/21/2017 01:09 AM, Alexander Miller wrote:
> Signed-off-by: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>

Thanks, Alex. Applied.

Cheers,

Michael


> ---
>  man7/man-pages.7 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man7/man-pages.7 b/man7/man-pages.7
> index 1fbc375..5d43ed7 100644
> --- a/man7/man-pages.7
> +++ b/man7/man-pages.7
> @@ -484,9 +484,9 @@ pages.
>  Use of "they" ("them", "themself", "their") as a gender-neutral singular
>  pronoun is acceptable.
>  .\"
> -.SS Formatting conventions for manual pages describing functions
> +.SS Formatting conventions for manual pages describing commands
>  .PP
> -For manual pages that describe command (typically in Sections 1 and 8),
> +For manual pages that describe a command (typically in Sections 1 and 8),
>  the arguments are always specified using italics,
>  .IR "even in the SYNOPSIS section" .
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
