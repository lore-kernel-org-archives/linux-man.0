From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] __ppc_set_ppr_med.3: Document PPC functions providing
 access to PPR
Date: Thu, 08 Oct 2015 23:09:49 +0200
Message-ID: <5616DB9D.80304@gmail.com>
References: <1443010136-21033-1-git-send-email-gftg@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443010136-21033-1-git-send-email-gftg-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Gabriel F. T. Gomes" <gftg-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tuliom-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Gabriel,

On 09/23/2015 01:08 PM, Gabriel F. T. Gomes wrote:
> Hi.
> 
> The commit ID referred to below is already integrated into glibc's master
> branch, however glibc 2.23 (mentioned in the text) has not yet been released.
> 
> Ok to already commit?

Sorry for the delay. I've applied this patch.

Cheers,

Michael


> -- 8< --
> GNU C Library commit 1747fcda4902a3b46183d93fb16ed9b436b2608b extends the
> priorities that can be set to the Program Priority Register (PPR), with the
> functions: __ppc_set_ppr_very_low(3) and __ppc_set_ppr_med_high(3).
> 
> Signed-off-by: Gabriel F. T. Gomes <gftg-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> ---
>  man3/__ppc_set_ppr_med.3      | 41 +++++++++++++++++++++++++++++++++++++----
>  man3/__ppc_set_ppr_med_high.3 |  1 +
>  man3/__ppc_set_ppr_very_low.3 |  1 +
>  3 files changed, 39 insertions(+), 4 deletions(-)
>  create mode 100644 man3/__ppc_set_ppr_med_high.3
>  create mode 100644 man3/__ppc_set_ppr_very_low.3
> 
> diff --git a/man3/__ppc_set_ppr_med.3 b/man3/__ppc_set_ppr_med.3
> index b106647..2fd5d6f 100644
> --- a/man3/__ppc_set_ppr_med.3
> +++ b/man3/__ppc_set_ppr_med.3
> @@ -25,16 +25,20 @@
>  .TH __PPC_SET_PPR_MED 3 2015-08-05 "GNU C Library" "Linux\
>  Programmer's Manual"
>  .SH NAME
> -__ppc_set_ppr_med, __ppc_set_ppr_low, __ppc_set_ppr_med_low \-
> +__ppc_set_ppr_med, __ppc_set_ppr_very_low, __ppc_set_ppr_low, __ppc_set_ppr_med_low, __ppc_set_ppr_med_high \-
>  Set the Program Priority Register
>  .SH SYNOPSIS
>  .B #include <sys/platform/ppc.h>
>  .sp
>  .B void __ppc_set_ppr_med(void);
>  .br
> +.B void __ppc_set_ppr_very_low(void);
> +.br
>  .B void __ppc_set_ppr_low(void);
>  .br
>  .B void __ppc_set_ppr_med_low(void);
> +.br
> +.B void __ppc_set_ppr_med_high(void);
>  .SH DESCRIPTION
>  These functions provide access to the
>  .I Program Priority Register
> @@ -44,13 +48,17 @@ The PPR is a 64-bit register that controls the program's priority.
>  By adjusting the PPR value the programmer may improve system
>  throughput by causing system resources to be used more
>  efficiently, especially in contention situations.
> -The three unprivileged states available are covered by the following functions:
> +The four unprivileged states available are covered by the following functions:
>  .IP * 3
>  .BR __ppc_set_ppr_med ()
>  sets the Program Priority Register value to
>  .IR medium
>  (default).
>  .IP *
> +.BR __ppc_set_ppr_very_low ()
> +sets the Program Priority Register value to
> +.IR "very low" .
> +.IP *
>  .BR __ppc_set_ppr_low ()
>  sets the Program Priority Register value to
>  .IR low .
> @@ -58,8 +66,31 @@ sets the Program Priority Register value to
>  .BR __ppc_set_ppr_med_low ()
>  sets the Program Priority Register value to
>  .IR "medium low" .
> +.P
> +The privileged state
> +.IR "medium high"
> +may also be set during certain time intervals by problem-state (unprivileged)
> +programs, with the following function:
> +.IP * 3
> +.BR __ppc_set_ppr_med_high ()
> +sets the Program Priority to
> +.IR "medium high" .
> +.P
> +If the program priority is medium high when the time interval expires or if an
> +attempt is made to set the priority to medium high when it is not allowed, the
> +priority is set to medium.
>  .SH VERSIONS
> -These functions first appeared in glibc in version 2.18.
> +The functions
> +.BR __ppc_set_ppr_med (),
> +.BR __ppc_set_ppr_low ()
> +and
> +.BR __ppc_set_ppr_med_low ()
> +are provided by glibc since version 2.18.
> +The functions
> +.BR __ppc_set_ppr_very_low ()
> +and
> +.BR __ppc_set_ppr_med_high ()
> +first appeared in glibc in version 2.23.
>  .SH ATTRIBUTES
>  For an explanation of the terms used in this section, see
>  .BR attributes (7).
> @@ -71,8 +102,10 @@ l l l.
>  Interface	Attribute	Value
>  T{
>  .BR __ppc_set_ppr_med (),
> +.BR __ppc_set_ppr_very_low (),
>  .BR __ppc_set_ppr_low (),
> -.BR __ppc_set_ppr_med_low ()
> +.BR __ppc_set_ppr_med_low (),
> +.BR __ppc_set_ppr_med_high ()
>  T}	Thread safety	MT-Safe
>  .TE
>  .ad
> diff --git a/man3/__ppc_set_ppr_med_high.3 b/man3/__ppc_set_ppr_med_high.3
> new file mode 100644
> index 0000000..a6d6cf3
> --- /dev/null
> +++ b/man3/__ppc_set_ppr_med_high.3
> @@ -0,0 +1 @@
> +.so man3/__ppc_set_ppr_med.3
> diff --git a/man3/__ppc_set_ppr_very_low.3 b/man3/__ppc_set_ppr_very_low.3
> new file mode 100644
> index 0000000..a6d6cf3
> --- /dev/null
> +++ b/man3/__ppc_set_ppr_very_low.3
> @@ -0,0 +1 @@
> +.so man3/__ppc_set_ppr_med.3
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
