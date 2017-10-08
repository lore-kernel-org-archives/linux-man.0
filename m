From: "Michael Kerrisk (man-opages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] pow10.3: tfix
Date: Sun, 8 Oct 2017 10:53:18 +0200
Message-ID: <5fcf2ab5-7fce-8a06-e547-8c8888407062@gmail.com>
References: <59d9c1f2.97f5620a.1ea0a.78a7@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <59d9c1f2.97f5620a.1ea0a.78a7-ATjtLOhZ0NVl57MIdRCFDg@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fangrui Song <i@maskray.me>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 10/08/2017 08:03 AM, Fangrui Song wrote:
> Signed-off-by: Fangrui Song <i@maskray.me>

Thank you, Fangrui Song! Applied.

Cheers,

Michael

> ---
>   man3/pow10.3 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/pow10.3 b/man3/pow10.3
> index bd2a5601c..58feb5b43 100644
> --- a/man3/pow10.3
> +++ b/man3/pow10.3
> @@ -44,7 +44,7 @@ These functions return the value of 10 raised to the power
>   These functions perform exactly the same task as the functions described in
>   .BR exp10 (3),
>   with the difference that the latter functions are now standardized
> -in TS\ 1866104.
> +in TS\ 18661-4:2015.
>   Those latter functions should be used in preference
>   to the functions described in this page.
>   .SH VERSIONS
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
