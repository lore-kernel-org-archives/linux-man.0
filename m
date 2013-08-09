From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ip.7: IP_MULTICAST_IF setsockopt recognizes struct mreq
 (compatibility)
Date: Fri, 09 Aug 2013 10:17:48 +0200
Message-ID: <5204A5AC.1030002@gmail.com>
References: <1368831532-8327-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1368831532-8327-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/18/13 00:58, Simon Paillard wrote:
> Kernel added compatibility only recently in
> 3a084ddb4bf299a6e898a9a07c89f3917f0713f7
> See: http://bugs.debian.org/607979

Applied.

Thanks, Simon.

Cheers,

Michael


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
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
