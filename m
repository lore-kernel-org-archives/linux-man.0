From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] packet.7: wfix
Date: Mon, 03 Mar 2014 05:48:13 +0100
Message-ID: <5314098D.4080309@gmail.com>
References: <1393627697-4009-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393627697-4009-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Simon. Applied.

Cheers,

Michael

On 02/28/2014 11:48 PM, Simon Paillard wrote:
> A side-effect: singular
> ---
>  man7/packet.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man7/packet.7 b/man7/packet.7
> index 060c984..59ea38b 100644
> --- a/man7/packet.7
> +++ b/man7/packet.7
> @@ -442,7 +442,7 @@ that intend to brute-force flood the network\(emfor example,
>  to test devices under load in a similar
>  fashion to pktgen\(emthis layer can be bypassed by setting
>  this integer option to 1.
> -A side-effects is that packet buffering in the qdisc layer is avoided,
> +A side-effect is that packet buffering in the qdisc layer is avoided,
>  which will lead to increased drops when network
>  device transmit queues are busy;
>  therefore, use at your own risk.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
