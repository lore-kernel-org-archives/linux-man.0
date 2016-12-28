From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] __ppc_set_ppr_med.3: Add AVAILABILITY
Date: Wed, 28 Dec 2016 11:45:10 +0100
Message-ID: <e183099c-7d6e-9183-29a5-5dd486f989cb@gmail.com>
References: <20161227200654.23405-1-wainersm@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161227200654.23405-1-wainersm-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wainer dos Santos Moschetta <wainersm-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/27/2016 09:06 PM, Wainer dos Santos Moschetta wrote:
> The _ARCH_PWR8 macro must be defined to get the
>  __ppc_set_ppr_very_low() and __ppc_set_ppr_med_high()
> functions definition.

Hello Wainer,

Thanks for the patch. Applied!

Cheers,

Michael


> Signed-off-by: Wainer dos Santos Moschetta <wainersm-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> ---
>  man3/__ppc_set_ppr_med.3 | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/man3/__ppc_set_ppr_med.3 b/man3/__ppc_set_ppr_med.3
> index a98107b..312aa39 100644
> --- a/man3/__ppc_set_ppr_med.3
> +++ b/man3/__ppc_set_ppr_med.3
> @@ -115,6 +115,18 @@ T}	Thread safety	MT-Safe
>  .ad
>  .SH CONFORMING TO
>  These functions are nonstandard GNU extensions.
> +.SH AVAILABILITY
> +The functions
> +.BR __ppc_set_ppr_very_low ()
> +and
> +.BR __ppc_set_ppr_med_high ()
> +will be defined by
> +.I <sys/platform/ppc.h>
> +if
> +.B _ARCH_PWR8
> +is defined.
> +Availability of these functions can be tested using
> +.BR "#ifdef _ARCH_PWR8" .
>  .SH SEE ALSO
>  .BR __ppc_yield (3)
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
