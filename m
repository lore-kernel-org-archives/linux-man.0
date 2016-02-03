From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/5] perf_event_open.2: tfix
Date: Wed, 3 Feb 2016 08:26:49 +0100
Message-ID: <56B1ABB9.7050907@gmail.com>
References: <1454446248-448-1-git-send-email-jwilk@jwilk.net>
 <1454446248-448-3-git-send-email-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454446248-448-3-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/02/2016 09:50 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Thanks, Jakub. Applied.

Cheers,

Michael

> ---
>  man2/perf_event_open.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 152bc5c..317ecbe 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -362,7 +362,7 @@ in Linux 3.19.
>  .\" commit 60e2364e60e86e81bc6377f49779779e6120977f
>  .B PERF_ATTR_SIZE_VER5
>  is 112 corresponding to the addition of
> -.I aux_watermak
> +.I aux_watermark
>  in Linux 4.1.
>  .\" commit 1a5941312414c71dece6717da9a0fa1303127afa
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
