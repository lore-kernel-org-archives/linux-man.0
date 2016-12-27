From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: typo in sched(7), vers. 4.09
Date: Tue, 27 Dec 2016 17:44:02 +0100
Message-ID: <71ab8546-3dd1-a251-c31f-11ce6470e11a@gmail.com>
References: <CAPioPU_bj4zyciuKtuWmmyPV79KEq2kEpKT30Wj-G6xgDmd_ag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPioPU_bj4zyciuKtuWmmyPV79KEq2kEpKT30Wj-G6xgDmd_ag-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas B <nicolas.biscos+man7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/27/2016 04:18 PM, Nicolas B wrote:
> In version 4.09, a small typo in man7/sched.7

Thanks, Nicolas!! Applied.

Cheers,

Michael

> diff --git a/man7/sched.7 b/man7/sched.7
> index d8bc552..b918cb6 100644
> --- a/man7/sched.7
> +++ b/man7/sched.7
> @@ -703,7 +703,7 @@ The default value in this file is 1, unless the
> kernel was booted with the
>  .IR noautogroup
>  parameter.
> 
> -A new autogroup is created created when a new session is created via
> +A new autogroup is created when a new session is created via
>  .BR setsid (2);
>  this happens, for example, when a new terminal window is started.
>  A new process created by
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
