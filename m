From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: details for threads-max
Date: Fri, 11 Sep 2015 13:30:20 +0200
Message-ID: <55F2BB4C.9040908@gmail.com>
References: <1440538574-14549-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440538574-14549-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Heinrich,

On 08/25/2015 11:36 PM, Heinrich Schuchardt wrote:
> Add detail information for threads-max.
> The checks for minimum and maximum values exist since kernel 4.1.
> https://lkml.org/lkml/2015/3/15/96
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man5/proc.5 | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/man5/proc.5 b/man5/proc.5
> index bb648d4..83f30af 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -4265,8 +4265,22 @@ this is the fifth kernel built from this source base and the
>  date following it indicates the time the kernel was built.
>  .TP
>  .IR /proc/sys/kernel/threads-max " (since Linux 2.3.11)"
> +.\" The following is based on Documentation/sysctl/kernel.txt
>  This file specifies the system-wide limit on the number of
>  threads (tasks) that can be created on the system.
> +
> +The minimum value that can be written to threads-max is 20.
> +The maximum value that can be written to threads-max is given by the
> +constant
> +.B FUTEX_TID_MASK
> +(0x3fffffff).
> +If a value outside of this range is written to threads-max an error
> +.B EINVAL
> +occurs.
> +
> +The value written is checked against the available RAM pages.
> +If the thread structures would occupy too much (more than 1/8th)
> +of the available RAM pages, threads-max is reduced accordingly.
>  .TP
>  .IR /proc/sys/kernel/zero-paged " (PowerPC only) "
>  This file

Thanks. Applied. 

It's also important to not the kernel version that added these
range checks, I think. So I've added that info also.

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
