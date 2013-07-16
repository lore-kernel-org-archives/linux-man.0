From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] qecvt.3: wfix phrasing
Date: Tue, 16 Jul 2013 08:20:52 +0200
Message-ID: <51E4E644.1070505@gmail.com>
References: <1373915657-5323-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1373915657-5323-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied.

On 07/15/13 21:14, Simon Paillard wrote:
> ---
>  man3/qecvt.3 |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man3/qecvt.3 b/man3/qecvt.3
> index 82f7d00..5c26b3b 100644
> --- a/man3/qecvt.3
> +++ b/man3/qecvt.3
> @@ -77,9 +77,9 @@ and
>  .BR qfcvt ()
>  are not thread-safe.
>  .LP
> -The function
> +The
>  .BR qgcvt ()
> -is thread-safe.
> +function is thread-safe.
>  .SH CONFORMING TO
>  SVr4.
>  Not seen in most common UNIX implementations,
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
