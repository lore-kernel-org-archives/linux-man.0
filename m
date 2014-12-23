From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: Add "VmSwap" to /proc/[pid]/status
Date: Tue, 23 Dec 2014 16:06:33 +0100
Message-ID: <549984F9.9090501@gmail.com>
References: <E1Y0APl-0002WV-Ai@garkbit.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1Y0APl-0002WV-Ai-mFPisyE7dAXhXIiyNabO3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sven Hoexter <sven-jJOYKVDXsn5H4x6Dk/4f9A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Sven,

On 12/14/2014 03:20 PM, Sven Hoexter wrote:
> Documented as is in Documentation/filesystems/proc.txt of Linux 3.18.
> 
> Signed-off-by: Sven Hoexter <sven-jJOYKVDXsn5H4x6Dk/4f9A@public.gmane.org>
> ---
>  man5/proc.5 | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/man5/proc.5 b/man5/proc.5
> index 96077d0..b16f2a7 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -1587,6 +1587,7 @@ VmStk:        88 kB
>  VmExe:       572 kB
>  VmLib:      1708 kB
>  VmPTE:        20 kB
> +VmSwap:        0 kB
>  Threads:        1
>  SigQ:   0/3067
>  SigPnd: 0000000000000000
> @@ -1672,6 +1673,9 @@ Shared library code size.
>  .IR VmPTE :
>  Page table entries size (since Linux 2.6.10).
>  .IP *
> +.IR VmSwap :
> +Size of swap usage (the number of referred swapents).
> +.IP *
>  .IR Threads :
>  Number of threads in process containing this thread.
>  .IP *

Thanks for this patch. I've applied, and added text that the field 
appeared in Linux 2.6.34. However, I have a question: what does the
text "(the number of referred swapents)" mean? Is this field
not just reporting a value in kB (i.e., the number of kB across all 
swap entries)?

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
