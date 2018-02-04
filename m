From: "Michael Kerrisk (man-opages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] put(3): fix formatting of trailing period
Date: Sun, 4 Feb 2018 07:29:27 +0100
Message-ID: <36a0815a-cd8e-fe36-7538-db5fc40f623c@gmail.com>
References: <20180120053322.9173-1-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180120053322.9173-1-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Mike,

On 01/20/2018 06:33 AM, Mike Frysinger wrote:
> The period after the function call is incorrectly marked with bold.

Thanks. Patch applied.

Cheers,

Michael

> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
>   man3/puts.3 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/puts.3 b/man3/puts.3
> index 2f039a43729f..2396f7d82d8e 100644
> --- a/man3/puts.3
> +++ b/man3/puts.3
> @@ -65,7 +65,7 @@ more than once.
>   .PP
>   .BI "putchar(" c )
>   is equivalent to
> -.BI "putc(" c ", " stdout ).
> +.BI "putc(" c ", " stdout ) \fR.
>   .PP
>   .BR puts ()
>   writes the string
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
