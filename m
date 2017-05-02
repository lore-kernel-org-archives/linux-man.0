From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] socket.2, ip.7: tfix
Date: Tue, 2 May 2017 22:17:12 +0200
Message-ID: <3d431e6a-2d5a-166b-10a4-e876df0b9d6b@gmail.com>
References: <20170501213004.2199-1-jwilk@jwilk.net>
 <20170501213004.2199-2-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170501213004.2199-2-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/01/2017 11:30 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Hi Jakub

Thanks! Applied!

Cheers,

Michael

> ---
>  man2/socket.2 | 2 +-
>  man7/ip.7     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/socket.2 b/man2/socket.2
> index 4bd1e9809..b7cb1685f 100644
> --- a/man2/socket.2
> +++ b/man2/socket.2
> @@ -295,7 +295,7 @@ or
>  argument.
>  .PP
>  When the network signals an error condition to the protocol module (e.g.,
> -using a ICMP message for IP) the pending error flag is set for the socket.
> +using an ICMP message for IP) the pending error flag is set for the socket.
>  The next operation on this socket will return the error code of the pending
>  error.
>  For some protocols it is possible to enable a per-socket error queue
> diff --git a/man7/ip.7 b/man7/ip.7
> index 0c6379f24..2ff17c845 100644
> --- a/man7/ip.7
> +++ b/man7/ip.7
> @@ -1168,7 +1168,7 @@ A connection was closed during an
>  .TP
>  .B EHOSTUNREACH
>  No valid routing table entry matches the destination address.
> -This error can be caused by a ICMP message from a remote router or
> +This error can be caused by an ICMP message from a remote router or
>  for the local routing table.
>  .TP
>  .B EINVAL
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
