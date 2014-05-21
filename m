From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 21/24] tsearch.3: Fix prototype
Date: Wed, 21 May 2014 20:48:45 +0200
Message-ID: <537CF50D.2080400@gmail.com>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk> <1400684275-20972-22-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-22-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Rasmus,

On 05/21/2014 04:57 PM, Rasmus Villemoes wrote:
> The rootp argument to tfind is void *const void*, not const void **.

Applied, but in the changelog, I guess you meant to write

    The rootp argument to tfind is void *const *, not const void **

Right? (I amended the commit message.)

Cheers,

Michael


> Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
> ---
>  man3/tsearch.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/tsearch.3 b/man3/tsearch.3
> index 83eceae..618fb54 100644
> --- a/man3/tsearch.3
> +++ b/man3/tsearch.3
> @@ -32,7 +32,7 @@ tsearch, tfind, tdelete, twalk, tdestroy \- manage a binary tree
>  .BI "void *tsearch(const void *" key ", void **" rootp ,
>  .BI "                int (*" compar ")(const void *, const void *));"
>  .sp
> -.BI "void *tfind(const void *" key ", const void **" rootp ,
> +.BI "void *tfind(const void *" key ", void *const *" rootp ,
>  .BI "                int (*" compar ")(const void *, const void *));"
>  .sp
>  .BI "void *tdelete(const void *" key ", void **" rootp ,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
