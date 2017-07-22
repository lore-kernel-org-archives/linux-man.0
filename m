From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] exp2.3: Remove C89 designation
Date: Sat, 22 Jul 2017 09:23:59 +0200
Message-ID: <755f1dd6-cc5a-c4cc-e43d-e5c955087a1f@gmail.com>
References: <20170720032532.1451-1-alexhenrie24@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170720032532.1451-1-alexhenrie24-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alex Henrie <alexhenrie24-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/20/2017 05:25 AM, Alex Henrie wrote:
> Signed-off-by: Alex Henrie <alexhenrie24-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Thanks, Alex. Applied.

Cheers,

Michael

> ---
>  man3/exp2.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/exp2.3 b/man3/exp2.3
> index a09915f34..e942a2281 100644
> --- a/man3/exp2.3
> +++ b/man3/exp2.3
> @@ -102,7 +102,7 @@ C99, POSIX.1-2001, POSIX.1-2008.
>  The variant returning
>  .I double
>  also conforms to
> -SVr4, 4.3BSD, C89.
> +SVr4, 4.3BSD.
>  .SH SEE ALSO
>  .BR cbrt (3),
>  .BR cexp2 (3),
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
