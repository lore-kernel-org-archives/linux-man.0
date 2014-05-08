From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 06/10] Add <sys/types.h> to synopsis of get_robust_list()
Date: Thu, 08 May 2014 11:44:15 +0200
Message-ID: <536B51EF.4080108@gmail.com>
References: <1398886962-10633-1-git-send-email-rv@rasmusvillemoes.dk> <1398886962-10633-7-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398886962-10633-7-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/30/2014 09:42 PM, Rasmus Villemoes wrote:
> If one were to implement wrappers for [gs]et_robust_list() using the
> given prototypes, one would also have to include sys/types.h to get
> a definition of size_t.

Applied!

Thanks,

Michael


> Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
> ---
>  man2/get_robust_list.2 | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/man2/get_robust_list.2 b/man2/get_robust_list.2
> index 76453ea..377d7e4 100644
> --- a/man2/get_robust_list.2
> +++ b/man2/get_robust_list.2
> @@ -32,6 +32,7 @@ get_robust_list, set_robust_list \- get/set list of robust futexes
>  .SH SYNOPSIS
>  .nf
>  .B #include <linux/futex.h>
> +.B #include <sys/types.h>
>  .B #include <syscall.h>
>  .sp
>  .BI "long get_robust_list(int " pid ", struct robust_list_head **" head_ptr ,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
