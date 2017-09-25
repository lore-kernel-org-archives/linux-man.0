From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] proc.5: Add KPF_BALLOON, KPF_ZERO_PAGE and KPF_IDLE
 for /proc/kpageflags
Date: Mon, 25 Sep 2017 08:42:44 +0200
Message-ID: <30b05b9e-1b37-20f3-fdcf-601043f564b8@gmail.com>
References: <20170924214138.4852-1-oe@outputenable.net>
 <20170924214138.4852-3-oe@outputenable.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170924214138.4852-3-oe-h0GdYU6q0jndfRFfCFeH3g@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oliver Ebert <oe-h0GdYU6q0jndfRFfCFeH3g@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Oliver,

On 09/24/2017 11:41 PM, Oliver Ebert wrote:
> see linux 56873f43abdcd574b25105867a990f067747b2f4
> and linux f074a8f49eb87cde95ac9d040ad5e7ea4f029738

Thanks! Applied with the correction noted below.

> ---
>  man5/proc.5 | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/man5/proc.5 b/man5/proc.5
> index 73b51eaca..f0b84d503 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -2965,6 +2965,9 @@ The bits are as follows:
>      20 - KPF_NOPAGE         (since Linux 2.6.31)
>      21 - KPF_KSM            (since Linux 2.6.32)
>      22 - KPF_THP            (since Linux 3.4)
> +    23 - KPF_BALLOON        (since Linux 4.0)

As far as I can see, KPF_BALLOON was added in 
3.18, so I amended the text to say that.

> +    24 - KPF_ZERO_PAGE      (since Linux 4.0)
> +    25 - KPF_IDLE           (since Linux 4.3)
>  .IP
>  For further details on the meanings of these bits,
>  see the kernel source file

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
