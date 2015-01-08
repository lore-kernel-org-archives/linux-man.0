From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] perf_event_open.2 typo with PERF_ATTR_SIZE_VER3
Date: Thu, 08 Jan 2015 06:28:53 +0100
Message-ID: <54AE1595.7070706@gmail.com>
References: <alpine.DEB.2.11.1501071235140.11398@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1501071235140.11398-6xBS8L8d439fDsnSvq7Uqyn2WXadKZNJe7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/07/2015 06:37 PM, Vince Weaver wrote:
> 
> There was a typo with the name of PERF_ATTR_SIZE_VER3

Thanks, Vince. Applied.

Cheers,

Michael


> Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 8bde791..34b939d 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -330,7 +330,7 @@ is set to 64; this was the size of the first published struct.
>  is 72, corresponding to the addition of breakpoints in Linux 2.6.33.
>  .B PERF_ATTR_SIZE_VER2
>  is 80 corresponding to the addition of branch sampling in Linux 3.4.
> -.B PERF_ATR_SIZE_VER3
> +.B PERF_ATTR_SIZE_VER3
>  is 96 corresponding to the addition
>  of
>  .I sample_regs_user
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
