From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] resolv.conf.5: explain how to set empty domain
Date: Thu, 18 Jul 2013 02:05:47 +0200
Message-ID: <51E7315B.4020209@gmail.com>
References: <1368974323-2764-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1368974323-2764-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/19/13 16:38, Simon Paillard wrote:
> See http://bugs.debian.org/463575

Applied.

Thanks,

Michael


> ---
>  man5/resolv.conf.5 |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/man5/resolv.conf.5 b/man5/resolv.conf.5
> index 716b345..9f2f3f9 100644
> --- a/man5/resolv.conf.5
> +++ b/man5/resolv.conf.5
> @@ -63,6 +63,7 @@ until a maximum number of retries are made.)
>  \fBdomain\fP Local domain name.
>  Most queries for names within this domain can use short names
>  relative to the local domain.
> +If set to \(aq.\(aq, the root domain is considered.
>  If no \fBdomain\fP entry is present, the domain is determined
>  from the local hostname returned by
>  .BR gethostname (2);
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
