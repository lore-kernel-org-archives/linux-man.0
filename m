From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] vdso.7: __kernel_clock_gettime *_COARSE clock support in
 PPC64
Date: Fri, 22 Dec 2017 10:36:53 +0100
Message-ID: <31d5abc7-d314-d4da-175f-b402e14678f0@gmail.com>
References: <20171222002659.1930-1-santosh@fossix.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171222002659.1930-1-santosh-b8Fn+pY0OfAdnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Sivaraj <santosh-b8Fn+pY0OfAdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Santosh

On 12/22/2017 01:26 AM, Santosh Sivaraj wrote:
> *_COARSE clocks are now supported in the __kernel_clock_gettime interface in
> PPC64. No longer falls back to the real system call.

Can you tell me the kernel version where this change was 
made? It would be useful to include that in the text, I think.
In fact, if you knew the kernel commit that made the change,
that would also be of interest.

Also, your patch changes just the entry for ppc/64. Does
the same statement hold true for ppc/32?

Thanks,

Michael


> CC: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> CC: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
> Signed-off-by: Santosh Sivaraj <santosh-b8Fn+pY0OfAdnm+yROfE0A@public.gmane.org>
> ---
>  man7/vdso.7 | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/man7/vdso.7 b/man7/vdso.7
> index 9af02a8aa..c7399939c 100644
> --- a/man7/vdso.7
> +++ b/man7/vdso.7
> @@ -438,9 +438,7 @@ clocks are
>  .I not
>  supported by the
>  .I __kernel_clock_getres
> -and
> -.I __kernel_clock_gettime
> -interfaces;
> +interface;
>  the kernel falls back to the real system call.
>  .SS s390 functions
>  .\" See linux/arch/s390/kernel/vdso32/vdso32.lds.S
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
