From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/3] netlink.7: Add references to sock_diag(7)
Date: Wed, 7 Dec 2016 16:15:48 +0100
Message-ID: <191d8d5c-cd8b-abbd-7b00-901b602a70a7@gmail.com>
References: <20161207140014.GE1100@altlinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161207140014.GE1100-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Pavel Emelyanov <xemul-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/07/2016 03:00 PM, Dmitry V. Levin wrote:
> Signed-off-by: Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>

Applied.

Thanks,

Michael

> ---
>  man7/netlink.7 | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/man7/netlink.7 b/man7/netlink.7
> index 4c43344..45ccb74 100644
> --- a/man7/netlink.7
> +++ b/man7/netlink.7
> @@ -63,7 +63,9 @@ Used by
>  kernel module.
>  .TP
>  .BR NETLINK_INET_DIAG " (since Linux 2.6.14, also known as " NETLINK_SOCK_DIAG " since Linux 3.3)"
> -Query information about sockets of various protocol families from the kernel.
> +Query information about sockets of various protocol families from the kernel
> +(see
> +.BR sock_diag (7)).
>  .TP
>  .BR NETLINK_NFLOG
>  Netfilter/iptables ULOG.
> @@ -538,7 +540,8 @@ for (nh = (struct nlmsghdr *) buf; NLMSG_OK (nh, len);
>  .BR cmsg (3),
>  .BR netlink (3),
>  .BR capabilities (7),
> -.BR rtnetlink (7)
> +.BR rtnetlink (7),
> +.BR sock_diag (7)
>  
>  .UR ftp://ftp.inr.ac.ru\:/ip-routing\:/iproute2*
>  information about libnetlink
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
