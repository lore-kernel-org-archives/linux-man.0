From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: Adding /proc/buddyinfo
Date: Tue, 30 Sep 2014 09:12:22 +0200
Message-ID: <542A57D6.1000908@gmail.com>
References: <1411839348-24345-1-git-send-email-eliedebrauwer@gmail.com> <1411839348-24345-2-git-send-email-eliedebrauwer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411839348-24345-2-git-send-email-eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/27/2014 07:35 PM, Elie De Brauwer wrote:
> This patch adds a short description about the contents of
> /proc/buddyinfo and how this file can be used to assist
> in checking for memory fragmentation issues.

Elie,

Thanks for the background note (your previous mail). I've applied
this patch; thanks for sending it.

Cheers,

Michael


> 
> Signed-off-by: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man5/proc.5 | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/man5/proc.5 b/man5/proc.5
> index 337f6b6..777611a 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -1825,6 +1825,45 @@ Advanced power management version and battery information when
>  .B CONFIG_APM
>  is defined at kernel compilation time.
>  .TP
> +.I /proc/buddyinfo
> +This file contains information which is used for diagnosing memory
> +fragmentation issues.
> +Each line starts with the identification of the node and the name
> +of the zone which together identify a memory region, this is then
> +followed by the count of available chunks of a certain order in
> +which these zones are split.
> +The size in bytes of a certain order is given by:
> +.IR "(2^order)\ *\ PAGE_SIZE" .
> +The binary buddy allocator algorithm inside the kernel will split
> +one chunk into two chunks of a smaller order (thus with half the
> +size) or combine two contiguous chunks into one larger chunk of
> +a higher order (thus with double the size) to satisfy allocation
> +requests and to counter memory fragmentation.
> +The order matches the column number, when starting to count at zero.
> +
> +For example on a x86_64 system:
> +.in +4n
> +.nf
> +Node 0, zone      DMA      1      1      1      0      2      1      1      0      1      1      3
> +Node 0, zone    DMA32     65     47      4     81     52     28     13     10      5      1    404
> +Node 0, zone   Normal    216     55    189    101     84     38     37     27      5      3    587
> +.fi
> +.in
> +
> +In this example there is one node containing three zones and there
> +are 11 different chunk sizes.
> +If the page size is 4 kilobyte, then the first zone called
> +.I DMA
> +(on x86 the first 16 megabyte of memory) has 1 chunk of 4 kilobyte
> +(order 0) available and has 3 chunks of 4 megabyte (order 10) available.
> +
> +If the memory is heavily fragmentated, the counters for higher
> +order chunks will be zero and allocation of large contiguous areas
> +will fail.
> +
> +Further information about the zones can be found in
> +.IR /proc/zoneinfo .
> +.TP
>  .I /proc/bus
>  Contains subdirectories for installed busses.
>  .TP
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
