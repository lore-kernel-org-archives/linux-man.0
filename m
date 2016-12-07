From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/3] netlink.7: Document NETLINK_INET_DIAG rename to
 NETLINK_SOCK_DIAG
Date: Wed, 7 Dec 2016 16:15:38 +0100
Message-ID: <ecce6e73-c98d-67c3-14d7-c1bcbf324caf@gmail.com>
References: <20161207135958.GD1100@altlinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161207135958.GD1100-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Pavel Emelyanov <xemul-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/07/2016 02:59 PM, Dmitry V. Levin wrote:
> Signed-off-by: Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>

Applied.

Thanks,

Michael


> ---
>  man7/netlink.7 | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/man7/netlink.7 b/man7/netlink.7
> index 57bab5f..4c43344 100644
> --- a/man7/netlink.7
> +++ b/man7/netlink.7
> @@ -62,9 +62,8 @@ Used by
>  .I ip_queue
>  kernel module.
>  .TP
> -.BR NETLINK_INET_DIAG " (since Linux 2.6.14)"
> -.\" FIXME More details on NETLINK_INET_DIAG needed.
> -INET socket monitoring.
> +.BR NETLINK_INET_DIAG " (since Linux 2.6.14, also known as " NETLINK_SOCK_DIAG " since Linux 3.3)"
> +Query information about sockets of various protocol families from the kernel.
>  .TP
>  .BR NETLINK_NFLOG
>  Netfilter/iptables ULOG.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
