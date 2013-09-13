From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dir_colors.5: ffix
Date: Fri, 13 Sep 2013 06:31:56 +0200
Message-ID: <5232953C.5040403@gmail.com>
References: <1378766315-31385-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378766315-31385-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Simon. Applied.

On 10.09.2013 00:38, Simon Paillard wrote:
> ---
>  man5/dir_colors.5 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man5/dir_colors.5 b/man5/dir_colors.5
> index 1e9a9c4..39ef236 100644
> --- a/man5/dir_colors.5
> +++ b/man5/dir_colors.5
> @@ -141,7 +141,7 @@ color instead.
>  Specifies the color used for a FIFO (named pipe).
>  
>  Synonym:
> -.BR PIPE.
> +.BR PIPE .
>  .TP
>  .B SOCK \fIcolor-sequence\fR
>  Specifies the color used for a socket.
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
