From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] proc.5: ffix
Date: Sun, 3 Sep 2017 02:07:43 +0200
Message-ID: <8d6fd4dc-f6b3-d824-298c-8fad9d1f5e06@gmail.com>
References: <20170902135847.GA27734@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170902135847.GA27734-ZbobWygYI+YXGNroddHbYwC/G2K4zDHf@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/02/2017 03:58 PM, Eugene Syromyatnikov wrote:
> ---
>  man5/proc.5 | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Thanks, Eugene. Applied.

Cheers,

Michael


> diff --git a/man5/proc.5 b/man5/proc.5
> index cc1c470..a669406 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -1311,8 +1311,7 @@ information via this field.
>  .IP
>  This file is readable only by the owner of the process.
>  .TP
> -.IR
> -/proc/[pid]/net " (since Linux 2.6.25)"
> +.IR /proc/[pid]/net " (since Linux 2.6.25)"
>  See the description of
>  .IR /proc/net .
>  .TP
> @@ -1669,7 +1668,7 @@ ProtectionKey:         0
>  VmFlags: rd ex mr mw me dw
>  .EE
>  .in
> -.PP
> +.IP
>  The first of these lines shows the same information as is displayed
>  for the mapping in
>  .IR /proc/[pid]/maps .
> @@ -3752,6 +3751,7 @@ so the iowait of each CPU is difficult to calculate.
>  The value in this field may
>  .I decrease
>  in certain conditions.
> +.RE
>  .TP
>  .IR irq " (since Linux 2.6.0-test4)"
>  (6) Time servicing interrupts.
> @@ -4890,7 +4890,7 @@ Explanations for some of the files under this directory can be found in
>  and
>  .BR ip (7).
>  .TP
> -.B /proc/sys/net/core/bpf_jit_enable
> +.I /proc/sys/net/core/bpf_jit_enable
>  See
>  .BR bpf (2).
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
