From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] perf_event_open.2: document new perf_event_paranoid
 default
Date: Thu, 7 Jul 2016 12:09:56 +0200
Message-ID: <1a8f05c8-cb70-9d65-a4f3-c8cfd9775561@gmail.com>
References: <1467798233-7838-1-git-send-email-jann@thejh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467798233-7838-1-git-send-email-jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/06/2016 11:43 AM, Jann Horn wrote:
> Signed-off-by: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>

Thanks, Jann. Applied!

Cheers,

Michael


> ---
>  man2/perf_event_open.2 | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 0e42c50..3cbf080 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -2747,14 +2747,15 @@ Files in
>  .TP
>  .I /proc/sys/kernel/perf_event_paranoid
>
> +.\" default changed in commit 0161028b7c8aebef64194d3d73e43bc3b53b5c66
>  The
>  .I perf_event_paranoid
>  file can be set to restrict access to the performance counters.
>  .RS
>  .IP 2 4
> -allow only user-space measurements.
> +allow only user-space measurements (default since Linux 4.6).
>  .IP 1
> -allow both kernel and user measurements (default).
> +allow both kernel and user measurements (default before Linux 4.6).
>  .IP 0
>  allow access to CPU-specific data but not raw tracepoint samples.
>  .IP \-1
>


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
