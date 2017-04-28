From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] userfaultfd.2: tfix
Date: Fri, 28 Apr 2017 10:04:27 +0200
Message-ID: <9e7c0169-de12-34fa-fb0b-3b8cf2bdfa93@gmail.com>
References: <20170427184932.9877-1-jwilk@jwilk.net>
 <20170427184932.9877-2-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170427184932.9877-2-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/27/2017 08:49 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Applied. Thanks, Jakub.

Cheers,

Michael

> ---
>  man2/userfaultfd.2 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/userfaultfd.2 b/man2/userfaultfd.2
> index e6fcd3f3b..8b89162b2 100644
> --- a/man2/userfaultfd.2
> +++ b/man2/userfaultfd.2
> @@ -253,7 +253,7 @@ Generated when the faulting process invokes
>  The event details are available in the
>  .I fork
>  field.
> -.\" FIXME descirbe duplication of userfault file descriptor during fork
> +.\" FIXME describe duplication of userfault file descriptor during fork
>  .TP
>  .BR UFFD_EVENT_REMAP " (since Linux 4.11)"
>  Generated when the faulting process invokes
> @@ -321,7 +321,7 @@ The new address of the memory range that was remapped using
>  .BR mremap (2).
>  .TP
>  .I remap.len
> -The original length of the the memory range that was remapped using
> +The original length of the memory range that was remapped using
>  .BR mremap (2).
>  .TP
>  .I remove.start
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
