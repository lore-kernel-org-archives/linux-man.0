From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] getaddrinfo.3: tfix
Date: Sun, 28 Feb 2016 14:39:55 +0100
Message-ID: <56D2F8AB.4090906@gmail.com>
References: <1456619561-613-1-git-send-email-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456619561-613-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/28/2016 01:32 AM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Thanks, Jakub. Applied.

Cheers,

Michael

> ---
>  man3/getaddrinfo.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/getaddrinfo.3 b/man3/getaddrinfo.3
> index 7bf815a..f924cdf 100644
> --- a/man3/getaddrinfo.3
> +++ b/man3/getaddrinfo.3
> @@ -232,7 +232,7 @@ for IPv4 addresses,
>  .BR IN6ADDR_ANY_INIT
>  for IPv6 address).
>  The wildcard address is used by applications (typically servers)
> -that intend to accept connections on any of the hosts's network addresses.
> +that intend to accept connections on any of the host's network addresses.
>  If
>  .I node
>  is not NULL, then the
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
