From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] __ppc_get_timebase_freq.3: Document a glibc extension
 for Power
Date: Wed, 27 May 2015 10:32:57 +0200
Message-ID: <55658139.5000504@gmail.com>
References: <1432580532-29036-1-git-send-email-tuliom@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432580532-29036-1-git-send-email-tuliom-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tulio Magno Quites Machado Filho <tuliom-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Tulio,


On 05/25/2015 09:02 PM, Tulio Magno Quites Machado Filho wrote:
> Glibc 2.17 provides new function to read the frequency at which the Time
> Base Register of Power processors is updated.

Thanks! Patch applied.

Cheers,

Michael


> Signed-off-by: Tulio Magno Quites Machado Filho <tuliom-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> ---
>  man3/__ppc_get_timebase.3      | 66 ++++++++++++++++++++++++++++++++++++++----
>  man3/__ppc_get_timebase_freq.3 |  1 +
>  2 files changed, 61 insertions(+), 6 deletions(-)
>  create mode 100644 man3/__ppc_get_timebase_freq.3
> 
> diff --git a/man3/__ppc_get_timebase.3 b/man3/__ppc_get_timebase.3
> index 6af2d43..e691a5c 100644
> --- a/man3/__ppc_get_timebase.3
> +++ b/man3/__ppc_get_timebase.3
> @@ -25,30 +25,84 @@
>  .TH __PPC_GET_TIMEBASE 3 2012-08-13 "GNU C Library" "Linux Programmer's\
>  Manual"
>  .SH NAME
> -__ppc_get_timebase \- get the current value of the Time Base Register on
> -Power architecture
> +__ppc_get_timebase, __ppc_get_timebase_freq \- get the current value
> + of the Time Base Register on Power architecture and its frequency.
>  .SH SYNOPSIS
>  .B #include <sys/platform/ppc.h>
>  .sp
>  .BI "uint64_t __ppc_get_timebase(void)"
> +
> +.BI "uint64_t __ppc_get_timebase_freq(void);"
>  .SH DESCRIPTION
>  .BR __ppc_get_timebase ()
> -reads the current value of the Time Base Register and returns its value.
> +reads the current value of the Time Base Register and returns its
> +value, while
> +.BR __ppc_get_timebase_freq ()
> +returns the frequency in which the Time Base Register is updated.
> +
>  The Time Base Register is a 64-bit register provided by Power Architecture
>  processors.
>  It stores a monotonically incremented value that is updated at a
>  system-dependent frequency that may be different from the processor
>  frequency.
>  .SH RETURN VALUE
> -Returns a 64-bit unsigned integer that represents the current value of the
> +.BR __ppc_get_timebase ()
> +returns a 64-bit unsigned integer that represents the current value of the
>  Time Base Register.
> +
> +.BR __ppc_get_timebase_freq ()
> +returns a 64-bit unsigned integer that represents the frequency at
> +which the Time Base Register is updated.
>  .SH VERSIONS
>  GNU C Library support for
>  .\" commit d9dc34cd569bcfe714fe8c708e58c028106e8b2e
>  .BR __ppc_get_timebase ()
> -has been provided since version 2.16.
> +has been provided since version 2.16 and
> +.\" commit 8ad11b9a9cf1de82bd7771306b42070b91417c11
> +.BR __ppc_get_timebase_freq ()
> +has been available since version 2.17.
>  .SH CONFORMING TO
> -This function is a nonstandard GNU extension.
> +Both functions are nonstandard GNU extensions.
> +.SH EXAMPLE
> +The following program will calculate the time, in microseconds, spent
> +between two calls to __ppc_get_timebase ().
> +.SS Program source
> +\&
> +.nf
> +#include <inttypes.h>
> +#include <stdint.h>
> +#include <stdio.h>
> +#include <sys/platform/ppc.h>
> +
> +/* Maximum value of the Time Base Register: 2^60 - 1.  Source: POWER ISA.  */
> +#define MAX_TB 0xFFFFFFFFFFFFFFF
> +
> +int
> +main ()
> +{
> +  uint64_t tb1, tb2, diff;
> +
> +  uint64_t freq = __ppc_get_timebase_freq ();
> +  printf ("Time Base frequency = %"PRIu64" Hz\\n", freq);
> +
> +  tb1 = __ppc_get_timebase ();
> +
> +  // Do some stuff...
> +
> +  tb2 = __ppc_get_timebase ();
> +
> +  if (tb2 > tb1) {
> +    diff = tb2 - tb1;
> +  } else {
> +    /* Treat Time Base Register overflow.  */
> +    diff = (MAX_TB - tb2) + tb1;
> +  }
> +
> +  printf ("Elapsed time  = %1.2f usecs\\n", (double) diff * 1000000 / freq );
> +
> +  return 0;
> +}
> +.fi
>  .SH SEE ALSO
>  .BR time (2),
>  .BR usleep (3)
> diff --git a/man3/__ppc_get_timebase_freq.3 b/man3/__ppc_get_timebase_freq.3
> new file mode 100644
> index 0000000..8599293
> --- /dev/null
> +++ b/man3/__ppc_get_timebase_freq.3
> @@ -0,0 +1 @@
> +.so man3/__ppc_get_timebase.3
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
