From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] uri.7: Use "example.com" as example domain
Date: Sat, 8 Oct 2016 20:07:56 +0200
Message-ID: <60ba37c7-ff5f-f30e-d9ee-8085789f8133@gmail.com>
References: <20161008142044.4983-1-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161008142044.4983-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 10/08/2016 04:20 PM, Jakub Wilk wrote:
> The owner of the "xyz.com" domain might not be happy that their domain
> is used is examples. RFC 2606 reserves (among others) "example.com" for
> this purpose, so let's use it.

Thanks, Jakub. Applied.

Cheers,

Michael


> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
> ---
>  man7/uri.7 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man7/uri.7 b/man7/uri.7
> index d1f20e5..4d3fc6a 100644
> --- a/man7/uri.7
> +++ b/man7/uri.7
> @@ -124,8 +124,8 @@ The
>  is the name of the host computer, either its name as determined by DNS
>  or an IP address (numbers separated by periods).
>  Thus the URI
> -<http://fred:fredpassword-+zpghU0kKgY@public.gmane.org:8080/>
> -logs into a web server on host xyz.com
> +<http://fred:fredpassword-hcDgGtZH8xNBDgjK7y7TUQ@public.gmane.org:8080/>
> +logs into a web server on host example.com
>  as fred (using fredpassword) using port 8080.
>  Avoid including a password in a URI if possible because of the many
>  security risks of having a password written down.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
