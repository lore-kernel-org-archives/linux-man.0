From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] bpf.2: tfix
Date: Sat, 3 Dec 2016 13:14:13 +0100
Message-ID: <81c3e873-e4b2-2834-66a0-a3ab5632eeb8@gmail.com>
References: <20161203043729.GA118799@beast>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161203043729.GA118799@beast>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/03/2016 05:37 AM, Kees Cook wrote:
> Changed to "will" instead of "with".

Thanks, Kees. Applied.

Cheers,

Michael


> Signed-off-by: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  man2/bpf.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/bpf.2 b/man2/bpf.2
> index 645f0e4..5339495 100644
> --- a/man2/bpf.2
> +++ b/man2/bpf.2
> @@ -583,7 +583,7 @@ The kernel takes care of allocating and freeing key/value pairs.
>  .IP *
>  The
>  .BR map_update_elem ()
> -helper with fail to insert new element when the
> +helper will fail to insert new element when the
>  .I max_entries
>  limit is reached.
>  (This ensures that eBPF programs cannot exhaust memory.)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
