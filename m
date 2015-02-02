From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] tzset.3: ffix
Date: Mon, 2 Feb 2015 07:39:27 +0100
Message-ID: <CAKgNAkjSUeKOXUHG5AU8ipVVxiATaJAb2WFnqgz-Y0KVNgL5pw@mail.gmail.com>
References: <54CE8BB2.5070100@gmx.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54CE8BB2.5070100-KK0ffGbhmjU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi William,

On 1 February 2015 at 21:25, J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org> wrote:
>
> Fix tzset.3 regression, dst is optional.
>
> $ date
> Sun Feb  1 15:14:33 EST 2015
> $ TZ=NZST-12 date
> Mon Feb  2 08:14:38 NZST 2015
> $ TZ=EST5 date
> Sun Feb  1 15:15:02 EST 2015
>
> Signed-off-by: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
> ---
>  man3/tzset.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man3/tzset.3 b/man3/tzset.3
> index 1253241..7a4dd6a 100644
> --- a/man3/tzset.3
> +++ b/man3/tzset.3
> @@ -95,7 +95,7 @@ The first format is a string of characters that directly represent the
>  timezone to be used:
>  .sp
>  .RS
> -.RI "std offset " dst [ offset ][, start [ /time ], end [ /time ]]
> +.RI "std offset[" dst [ offset ][, start [ /time ], end [ /time ]]]
>  .RE
>  .sp
>  There are no spaces in the specification.

Thanks, I've applied this, and then also made some more changes to
bring make that line a bit more consistent with formatting norm in man
pages.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
