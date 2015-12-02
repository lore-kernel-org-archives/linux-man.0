From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] bpf.2: tfix
Date: Wed, 02 Dec 2015 17:11:24 +0100
Message-ID: <565F182C.2070602@gmail.com>
References: <1445525054-2880-1-git-send-email-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445525054-2880-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Jakub. Applied.

Cheers,

Michael

On 10/22/2015 04:44 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
> ---
>  man2/bpf.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/bpf.2 b/man2/bpf.2
> index 385d44a..5d583c7 100644
> --- a/man2/bpf.2
> +++ b/man2/bpf.2
> @@ -85,7 +85,7 @@ unloaded when the process exits.
>  In some cases, for example,
>  .BR tc-bpf (8),
>  the program will continue to stay alive inside the kernel even after the
> -the process that loaded the program exits.
> +process that loaded the program exits.
>  In that case,
>  the tc subsystem holds a reference to the eBPF program after the
>  file descriptor has been closed by the user-space program.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
