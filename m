From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] perf_event_open.2: tfix
Date: Mon, 31 Oct 2016 12:55:42 +0100
Message-ID: <3702f04b-f7a4-f8b5-8280-01c71da0c657@gmail.com>
References: <20161031101043.8201-1-jwilk@jwilk.net>
 <20161031101043.8201-2-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161031101043.8201-2-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 10/31/2016 11:10 AM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Thanks, Jakub. Patch applied.

Thanks for your continuous work on catching these many small glitches!

Cheers,

Michael

> ---
>  man2/perf_event_open.2 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 6d77d97..0c757cc 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -790,7 +790,7 @@ the register values will return kernel register
>  state if the overflow happened while kernel
>  code is running.
>  If the CPU supports hardware sampling of
> -register state (i.e.,, PEBS on Intel x86) and
> +register state (i.e., PEBS on Intel x86) and
>  .I precise_ip
>  is set higher than zero then the register
>  values returned are those captured by
> @@ -1003,7 +1003,7 @@ See also the description of
>  .TP
>  .IR "mmap_data" " (since Linux 2.6.36)"
>  .\" commit 3af9e859281bda7eb7c20b51879cf43aa788ac2e
> -Ths the counterpart of the
> +This is the counterpart of the
>  .I mmap
>  field.
>  This enables generation of
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
