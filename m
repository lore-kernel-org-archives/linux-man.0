From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ipv6.7: add description of getsockopt for IPV6_MTU
Date: Sat, 15 Dec 2012 19:56:52 +0100
Message-ID: <CAKgNAkhbo9ycVAVJrB1a582qgiQ0tT-U4cLoYi=99Ok+Ykiniw@mail.gmail.com>
References: <1355119348-3545-1-git-send-email-gaofeng@cn.fujitsu.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355119348-3545-1-git-send-email-gaofeng-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gao feng <gaofeng-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Gao Feng,

On Mon, Dec 10, 2012 at 7:02 AM, Gao feng <gaofeng-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> wrote:
> In ipv4,IP_MTU is only supported by getsockopt.
> In ipv6,we can use IPV6_MTU to set socket's mtu,
> but the return value of getsockopt is the path mtu.
> it may make people confusion.
>
> Add the description of the getsockopt for IPV6_MTU to
> tell people the mtu of getting and setting is different.

Thank you. I've applied this patch.

Cheers,

Michael


> Signed-off-by: Gao feng <gaofeng-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man7/ipv6.7 |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/man7/ipv6.7 b/man7/ipv6.7
> index e13597c..888c6fa 100644
> --- a/man7/ipv6.7
> +++ b/man7/ipv6.7
> @@ -147,6 +147,10 @@ structure.
>  .\" should be documented
>  .TP
>  .B IPV6_MTU
> +Retrieve the current known path MTU of the current socket.
> +Only valid when the socket has been connected.
> +Returns an integer.
> +
>  Set the MTU to be used for the socket.
>  The MTU is limited by the device
>  MTU or the path MTU when path MTU discovery is enabled.
> --
> 1.7.7.6
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
