From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] proc.5: tfix
Date: Thu, 26 Jan 2017 07:24:40 +1300
Message-ID: <bdcd0064-81ed-1fd3-27b3-64f13e77cc84@gmail.com>
References: <20170125153733.3588-1-jwilk@jwilk.net>
 <20170125153733.3588-3-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170125153733.3588-3-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/26/2017 04:37 AM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
> ---
>  man5/proc.5 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied! Thanks, Jakub.

Cheers,

Michael



> diff --git a/man5/proc.5 b/man5/proc.5
> index 8a7b6bee7..c1d1a51eb 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -4024,7 +4024,7 @@ A nonzero value enables leases.
>  .\" commit d29216842a85c7970c536108e093963f02714498
>  The value in this file specifies the maximum number of mounts that may exist
>  in a mount namespace.
> -The default vslue in this file is 100,000.
> +The default value in this file is 100,000.
>  .TP
>  .IR /proc/sys/fs/mqueue " (since Linux 2.6.6)"
>  This directory contains files
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
