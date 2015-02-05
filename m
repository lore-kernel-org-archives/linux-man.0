From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] socket.7: document SO_REUSEPORT socket option.
Date: Thu, 05 Feb 2015 14:47:09 +0100
Message-ID: <54D3745D.1040205@gmail.com>
References: <1419052469-43586-1-git-send-email-dw@botanicus.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419052469-43586-1-git-send-email-dw-ahVZHQAumb4sV2N9l4h3zg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Wilson <dw-ahVZHQAumb4sV2N9l4h3zg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/20/2014 06:14 AM, David Wilson wrote:
> Signed-off-by: David Wilson <dw-ahVZHQAumb4sV2N9l4h3zg@public.gmane.org>

Thanks, David. Applied.

Cheers,

Michael



> ---
>  man7/socket.7 | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/man7/socket.7 b/man7/socket.7
> index ff98e3e..ff4c46b 100644
> --- a/man7/socket.7
> +++ b/man7/socket.7
> @@ -662,6 +662,20 @@ with a specific port then it is not possible
>  to bind to this port for any local address.
>  Argument is an integer boolean flag.
>  .TP
> +.BR SO_REUSEPORT " (since Linux 3.9)"
> +Indicates that attempts to bind an identical listening address to
> +multiple
> +.B AF_INET
> +or
> +.B AF_INET6
> +sockets by the same UID may succeed. This option allows
> +.BR accept (2)
> +load distribution in a multi-threaded server to be improved by
> +using a distinct listener socket for each thread. This must be set
> +on each socket prior to calling
> +.BR bind (2)
> +on the socket.
> +.TP
>  .BR SO_RXQ_OVFL " (since Linux 2.6.33)"
>  .\" commit 3b885787ea4112eaa80945999ea0901bf742707f
>  Indicates that an unsigned 32-bit value ancillary message (cmsg)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
