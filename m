From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] proc.5: add description for cpuN lines in /pro/stat
Date: Sun, 3 Sep 2017 02:10:36 +0200
Message-ID: <459b70a2-a731-1933-264e-df64b100e586@gmail.com>
References: <20170902135851.GA27821@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170902135851.GA27821-ZbobWygYI+YXGNroddHbYwC/G2K4zDHf@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/02/2017 03:58 PM, Eugene Syromyatnikov wrote:
> ---
>  man5/proc.5 | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Thanks, Eugene! Applied

Cheers,

Michael


> diff --git a/man5/proc.5 b/man5/proc.5
> index a669406..077bde2 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -3705,13 +3705,16 @@ Common
>  entries include:
>  .RS
>  .TP
> -\fIcpu  3357 0 4313 1362393\fP
> +.I cpu  10132153 290696 3084719 46828483 16683 0 25195 0 175628 0
> +.TQ
> +.I cpu0 1393280 32966 572056 13343292 6130 0 17875 0 23933 0
>  The amount of time, measured in units of
>  USER_HZ (1/100ths of a second on most architectures, use
>  .IR sysconf(_SC_CLK_TCK)
>  to obtain the right value),
>  .\" 1024 on Alpha and ia64
> -that the system spent in various states:
> +that the system ("cpu" line) or the specific CPU ("cpu\fIN\fR" line)
> +spent in various states:
>  .RS
>  .TP
>  .I user
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
