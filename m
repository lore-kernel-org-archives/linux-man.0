From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] random.7: tfix
Date: Sun, 27 Nov 2016 18:59:34 +0100
Message-ID: <47a0ed61-d12b-dc36-c212-78119abdac6a@gmail.com>
References: <20161127133403.9319-1-jwilk@jwilk.net>
 <20161127133403.9319-2-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161127133403.9319-2-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/27/2016 02:34 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Thanks, Jakub. Applied.

Cheers,

Michael


> ---
>  man7/random.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man7/random.7 b/man7/random.7
> index 8421c49..18c442f 100644
> --- a/man7/random.7
> +++ b/man7/random.7
> @@ -105,7 +105,7 @@ or when reading from
>  .I /dev/random
>  increases code complexity.
>  .\"
> -.SS Monte Carlo and other probabalistic sampling applications
> +.SS Monte Carlo and other probabilistic sampling applications
>  Using these interfaces to provide large quantities of data for
>  Monte Carlo simulations or other programs/algorithms which are
>  doing probabilistic sampling will be slow.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
