From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] ldconfig.8: ffix
Date: Fri, 28 Apr 2017 10:03:27 +0200
Message-ID: <c3024244-0d73-40fe-6f04-296408f3e53b@gmail.com>
References: <20170324200024.1239-1-jwilk@jwilk.net>
 <20170324200024.1239-2-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170324200024.1239-2-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/24/2017 09:00 PM, Jakub Wilk wrote:
> Use italics for metavariables.
> 
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Really applied this time :-}. (Sorry, must have got confused 
while processing the last stream of patches, and *thought*
I'd applied this one.)

Cheers,

Michael

> ---
>  man8/ldconfig.8 | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/man8/ldconfig.8 b/man8/ldconfig.8
> index c06212ebc..822a885cc 100644
> --- a/man8/ldconfig.8
> +++ b/man8/ldconfig.8
> @@ -118,15 +118,15 @@ or
>  .IR compat
>  (default).
>  .TP
> -.B \-C cache
> +.BI "\-C " cache
>  Use
> -.B cache
> +.I cache
>  instead of
>  .IR /etc/ld.so.cache .
>  .TP
> -.B \-f conf
> +.BI "\-f " conf
>  Use
> -.B conf
> +.I conf
>  instead of
>  .IR /etc/ld.so.conf .
>  .\" FIXME glibc 2.7 added -i
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
