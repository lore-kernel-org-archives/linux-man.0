From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] gettimeofday.2: Expand on the historic historical meaning
 of tz_dsttime.
Date: Wed, 16 Dec 2015 15:13:47 +0100
Message-ID: <5671719B.60907@gmail.com>
References: <5669DA15.2050606@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5669DA15.2050606-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/10/2015 09:01 PM, Carlos O'Donell wrote:
> Given that the NOTES in question are willing to discuss
> hitory, I have clarified the use of tz_dsttime for non-Linux
> and Linux to allow the reader to contrast that with the older
> system usage.
> 
> On a non-Linux glibc the meaning of tz_dsttime is exactly
> that of daylight for the current zone. It has been this way
> since the beginning of glibc:
> 
> ^28f540f (Roland McGrath 1995-02-18 01:27:10 +0000 52)
>        tz->tz_dsttime = __daylight;
> 
> On a Linux glibc the field has never been used.
> 
> Clarify the meaning of tz_dsttime for gettimeofday,
> and for settimeofday distinctly for non-Linux and Linux
> glibc cases (for historical completeness).
> 
> Signed-off-by: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Thanks, Carlos. Applied.

Cheers,

Michael


> ---
> Cheers,
> Carlos.
> 
> diff --git a/man2/gettimeofday.2 b/man2/gettimeofday.2
> index 8006797..5df82e6 100644
> --- a/man2/gettimeofday.2
> +++ b/man2/gettimeofday.2
> @@ -190,15 +190,30 @@ Traditionally, the fields of
>  were of type
>  .IR long .
>  
> -The
> +On a non-Linux kernel, with glibc, the
> +.I tz_dsttime
> +field of
> +.I struct timezone
> +will be set to a non-zero value by
> +.BR gettimeofday ()
> +if the current timezone has ever had or will have a daylight saving
> +rule applied. In this sense it exactly mirrors the meaning of
> +.BR daylight (3)
> +for the current zone.
> +On Linux, with glibc, the setting of the
>  .I tz_dsttime
> -field has never been used under Linux.
> +field of
> +.I struct timezone
> +has never been used by
> +.BR settimeofday ()
> +or
> +.BR gettimeofday ().
>  .\" it has not
>  .\" been and will not be supported by libc or glibc.
>  .\" Each and every occurrence of this field in the kernel source
>  .\" (other than the declaration) is a bug.
>  Thus, the following
> -is purely of historic interest.
> +is purely of historical interest.
>  
>  On old systems, the field
>  .I tz_dsttime
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
