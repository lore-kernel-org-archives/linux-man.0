From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] perf_event_open.2: wsfix
Date: Sun, 22 Jan 2017 09:03:16 +1300
Message-ID: <da67cfd7-5a52-592d-968f-4574b990efa8@gmail.com>
References: <b26e7385-907c-0398-b9a8-9059917cfd9b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b26e7385-907c-0398-b9a8-9059917cfd9b-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hugo Guiroux <hugo.guiroux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/20/2017 11:33 PM, Hugo Guiroux wrote:
>  From 49f3860d9ff27113e64f7af3ebd38cb6853008c6 Mon Sep 17 00:00:00 2001
> From: Hugo Guiroux <hugo.guiroux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Date: Fri, 20 Jan 2017 11:16:22 +0100
> Subject: [PATCH] perf_event_open.2: wsfix

Hello Hugo,

There seems to be a white-space problem with your patch,
so I made the change manually. Thanks for the report!

Cheers,

Michael

> ---
>   man2/perf_event_open.2 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 65239e610..daaf087d8 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -2038,7 +2038,7 @@ struct {
>       u64    nr;         /* if PERF_SAMPLE_CALLCHAIN */
>       u64    ips[nr];    /* if PERF_SAMPLE_CALLCHAIN */
>       u32    size;       /* if PERF_SAMPLE_RAW */
> -    cha r  data[size]; /* if PERF_SAMPLE_RAW */
> +    char   data[size]; /* if PERF_SAMPLE_RAW */
>       u64    bnr;        /* if PERF_SAMPLE_BRANCH_STACK */
>       struct perf_branch_entry lbr[bnr];
>                          /* if PERF_SAMPLE_BRANCH_STACK */
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
