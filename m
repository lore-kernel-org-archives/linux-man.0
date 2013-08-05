From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ip.7: IP_MULTICAST_IF setsockopt recognizes struct mreq
 (compatibility)
Date: Mon, 5 Aug 2013 23:11:38 +0200
Message-ID: <20130805211138.GI20063@mraw.org>
References: <1368831532-8327-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1368831532-8327-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

What is your feedback regarding the patch below ?

On Sat, May 18, 2013 at 12:58:52AM +0200, Simon Paillard wrote:
> Kernel added compatibility only recently in
> 3a084ddb4bf299a6e898a9a07c89f3917f0713f7
> See: http://bugs.debian.org/607979
> ---
>  man7/ip.7 |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/man7/ip.7 b/man7/ip.7
> index d5036ea..39715a3 100644
> --- a/man7/ip.7
> +++ b/man7/ip.7
> @@ -542,6 +542,9 @@ Argument is an
>  .I ip_mreqn
>  or
>  .I ip_mreq
> +.\" net: IP_MULTICAST_IF setsockopt now recognizes struct mreq
> +.\" Commit: 3a084ddb4bf299a6e898a9a07c89f3917f0713f7
> +(since Linux 3.5)
>  structure similar to
>  .BR IP_ADD_MEMBERSHIP .
>  .IP
> -- 
> 1.7.10.4

-- 
Simon Paillard
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
