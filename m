From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] proc.5: Explain /proc/sys/vm/compact_memory
Date: Thu, 22 Jan 2015 20:52:30 +0100
Message-ID: <54C154FE.9030607@gmail.com>
References: <1421954463-2853-1-git-send-email-eliedebrauwer@gmail.com> <1421954463-2853-2-git-send-email-eliedebrauwer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421954463-2853-2-git-send-email-eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/22/2015 08:21 PM, Elie De Brauwer wrote:
> Since 2.6.36 [1] CONFIG_COMPACTION is supported in Linux (for a
> detailed explanation see [2]). But in essence the contents of /proc/buddyinfo
> shows how much contiguous areas of a certain size are available. These
> numbers are not actually up to date as the Linux kernel will implicitely
> trigger compaction (+- defragmentation) when an allocation is done.
> This makes it difficult since you can't predict upfront whether or not a
> large allocation will succeed or not.
> By using /proc/sys/vm/compact_memory you can explicitely trigger compaction
> to occur and /proc/buddyinfo will give a more realistic view on the
> available memory in contiguous areas.
> 
> This patch updates proc.5 to explain the usage of this file and is
> inspired upon Documentation/systcl/vm.txt [3]
> 
> [1] http://kernelnewbies.org/Linux_2_6_35#head-9cb0a1275559d40296da42efb7977896ac9edab7
> [2] http://lwn.net/Articles/368869/
> [3] http://lxr.free-electrons.com/source/Documentation/sysctl/vm.txt#L100

Thanks, Elie. Applied.

Cheers,

Michael


> Signed-off-by: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man5/proc.5 | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/man5/proc.5 b/man5/proc.5
> index 860eb66..5bff2a0 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -3943,6 +3943,15 @@ On some systems, it is not present.
>  This directory contains files for memory management tuning, buffer and
>  cache management.
>  .TP
> +.IR /proc/sys/vm/compact_memory " (since Linux 2.6.35)"
> +When 1 is written to this file, all zones are compacted such that free
> +memory is available in contiguous blocks where possible.
> +The effect of this action can be seen by examining
> +.IR /proc/buddyinfo .
> +.IP
> +Only present if the kernel was configured with
> +.BR CONFIG_COMPACTION .
> +.TP
>  .IR /proc/sys/vm/drop_caches " (since Linux 2.6.16)"
>  Writing to this file causes the kernel to drop clean caches, dentries, and
>  inodes from memory, causing that memory to become free.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
