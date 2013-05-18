From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sk98lin.4: ffix
Date: Sat, 18 May 2013 20:55:47 +0200
Message-ID: <5197CEB3.6040603@gmail.com>
References: <1367427391-26029-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1367427391-26029-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/01/13 18:56, Simon Paillard wrote:
> Format issue introduced in 2297bf0ef55bcc5f1322e695cedeaa4066fcc373

Thanks Simon. Applied.

Cheers,

Michael


> ---
>  man4/sk98lin.4 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man4/sk98lin.4 b/man4/sk98lin.4
> index d818bcc..856199d 100644
> --- a/man4/sk98lin.4
> +++ b/man4/sk98lin.4
> @@ -100,7 +100,7 @@ If loading is finished, any desired IP address can be
>  assigned to the respective
>  .I eth[x]
>  interface using the
> -.BR only ifconfig (8)
> +.BR ifconfig (8)
>  command.
>  This causes the adapter to connect to the Ethernet and to display a status
>  message on the console saying "ethx: network connection up using port y"
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
