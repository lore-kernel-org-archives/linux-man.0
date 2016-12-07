From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] netlink.7: ffix
Date: Wed, 7 Dec 2016 15:45:20 +0100
Message-ID: <922b5cca-01b9-125f-2825-120b86464dbb@gmail.com>
References: <20161207140424.GA1138@altlinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161207140424.GA1138-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/07/2016 03:04 PM, Dmitry V. Levin wrote:
> Signed-off-by: Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>

Applied. Thanks, Dmitry.

Cheers,

Michael

(Still processing your other patches.)

> ---
>  man7/netlink.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man7/netlink.7 b/man7/netlink.7
> index 45ccb74..44f996f 100644
> --- a/man7/netlink.7
> +++ b/man7/netlink.7
> @@ -95,7 +95,7 @@ See
>  .I Documentation/connector/*
>  in the Linux kernel source tree for further information.
>  .TP
> -.B NETLINK_NETFILTER " (since Linux 2.6.14)"
> +.BR NETLINK_NETFILTER " (since Linux 2.6.14)"
>  .\" FIXME More details on NETLINK_NETFILTER needed.
>  Netfilter subsystem.
>  .TP
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
