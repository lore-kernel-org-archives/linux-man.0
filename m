From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] netlink: add NETLINK_CRYPTO
Date: Wed, 07 Jan 2015 08:44:08 +0100
Message-ID: <54ACE3C8.20807@gmail.com>
References: <3063949.uKkJtgaVA5@tauon>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3063949.uKkJtgaVA5@tauon>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Steffen Klassert <steffen.klassert-opNxpl+3fjRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[CC += Steffen Klassert]

On 12/02/2014 01:16 PM, Stephan Mueller wrote:
> Add the NETLINK_CRYPTO reference to netlink(7).
> 
> Signed-off-by: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
> ---
>  man7/netlink.7 | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/man7/netlink.7 b/man7/netlink.7
> index be7814a..bfeb381 100644
> --- a/man7/netlink.7
> +++ b/man7/netlink.7
> @@ -113,6 +113,11 @@ Kernel messages to user space.
>  .TP
>  .B NETLINK_GENERIC
>  Generic netlink family for simplified netlink usage.
> +.TP
> +.B NETLINK_CRYPTO
> +Netlink interface to request information about ciphers registered
> +with the kernel crypto API as well as allow configuration of the
> +kernel crypto API.
>  .PP
>  Netlink messages consist of a byte stream with one or multiple
>  .I nlmsghdr
> 

Thanks, Stephan. Applied.

@Steffen: is the API exposed via this netlink socket type
actually documented anywhere?

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
