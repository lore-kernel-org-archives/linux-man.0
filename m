From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pkey_alloc.2: Fix argument order
Date: Mon, 20 Nov 2017 11:09:25 +0100
Message-ID: <b5638116-b520-c666-3b5c-941b5d47c59d@gmail.com>
References: <1510057395-2297-1-git-send-email-leitao@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1510057395-2297-1-git-send-email-leitao-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Breno Leitao <leitao-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/07/2017 01:23 PM, Breno Leitao wrote:
> Currently pkey_alloc() syscall has two arguments, and the very first
> argument is still not supported as in kernel 4.14-rc8 and should be set
> to zero, as showed in the following syscall implementation:
> 
> 	SYSCALL_DEFINE2(pkey_alloc, unsigned long, flags, ...)
> 	{
> 		int pkey;
> 		int ret;
> 
> 		/* No flags supported yet. */
> 		if (flags)
> 			return -EINVAL;
> 
> This behaviour is also documented correctly in the kernel documentation
> as Documentation/x86/protection-keys.txt
> 
> The second argument is the one that should specify the page access
> rights.
> 
> This patch fixes the manpage to describe how the code behaves.

Thanks, Breno. Patch applied.

Cheers,

Michael


> Signed-off-by: Breno Leitao <leitao-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> ---
>  man2/pkey_alloc.2 | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/man2/pkey_alloc.2 b/man2/pkey_alloc.2
> index 8e701961c..858f64ce6 100644
> --- a/man2/pkey_alloc.2
> +++ b/man2/pkey_alloc.2
> @@ -40,6 +40,12 @@ allocates a protection key (pkey) and allows it to be passed to
>  The
>  .BR pkey_alloc ()
>  .I flags
> +argument is still not supported and should be set to "0".
> +.PP
> +The
> +.BR pkey_alloc ()
> +.I access_rights
> +.BR
>  argument may contain zero or more disable operations:
>  .TP
>  .B PKEY_DISABLE_ACCESS
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
