From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] core: Add info about DAX coredump filtering flags
Date: Wed, 02 Dec 2015 21:22:03 +0100
Message-ID: <565F52EB.5060002@gmail.com>
References: <1447264982-20535-1-git-send-email-ross.zwisler@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447264982-20535-1-git-send-email-ross.zwisler-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ross Zwisler <ross.zwisler-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Ross,

On 11/11/2015 07:03 PM, Ross Zwisler wrote:
> Kernel 4.4 added two new core dump filtering flags, MMF_DUMP_DAX_PRIVATE
> and MMF_DUMP_DAX_SHARED.
> 
> These flags allow us to explicitly filter DAX mappings.  This is desirable
> because DAX mappings, like hugetlb mappings, have the potential to be very
> large.
> 
> Signed-off-by: Ross Zwisler <ross.zwisler-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
> 
> The patches adding these flags have been merged for v4.4, but we're
> currently still very early in the v4.4 release cycle.  I'm not sure if it's
> correct to apply this documentation patch now, or if you'd rather wait
> until v4.4 is actually released.

Well, we're at -rc3 now, so I feel reasonably okay with this. I've applied.
Thanks for the patch.

Cheers,

Michael

> ---
>  man5/core.5 | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/man5/core.5 b/man5/core.5
> index fc7f927..b8a8182 100644
> --- a/man5/core.5
> +++ b/man5/core.5
> @@ -288,6 +288,12 @@ Dump private huge pages.
>  .TP
>  bit 6 (since Linux 2.6.28)
>  Dump shared huge pages.
> +.TP
> +bit 7 (since Linux 4.4)
> +Dump private DAX pages.
> +.TP
> +bit 8 (since Linux 4.4)
> +Dump shared DAX pages.
>  .RE
>  .PD
>  .PP
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
