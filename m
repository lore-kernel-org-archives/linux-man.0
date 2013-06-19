From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mblen.3: ATTRIBUTES: Note function that is not thread-safe
Date: Wed, 19 Jun 2013 12:34:51 +0200
Message-ID: <51C1894B.4070501@gmail.com>
References: <1371625933-18317-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371625933-18317-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/19/13 09:12, Peng Haitao wrote:
> The function mblen() is not thread safe.

Thanks. Applied.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/mblen.3 | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/man3/mblen.3 b/man3/mblen.3
> index 235df7f..bd42382 100644
> --- a/man3/mblen.3
> +++ b/man3/mblen.3
> @@ -67,6 +67,11 @@ It returns 0, if a null wide character was recognized.
>  It returns \-1, if an
>  invalid multibyte sequence was encountered or if it couldn't parse a complete
>  multibyte character.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR mblen ()
> +function is not thread-safe.
>  .SH CONFORMING TO
>  C99.
>  .SH NOTES
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
