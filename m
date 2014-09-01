From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] rtnetlink: Fix parameters for the send call in the example
Date: Mon, 01 Sep 2014 19:47:59 +0200
Message-ID: <5404B14F.1080604@gmail.com>
References: <1409405793-28111-1-git-send-email-holger@moiji-mobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409405793-28111-1-git-send-email-holger-/0vNEYwyzy+/WdZNMWml2A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Holger Hans Peter Freyther <holger-/0vNEYwyzy+/WdZNMWml2A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Holger. Applied.

Cheers,

Michael


On 08/30/2014 03:36 PM, Holger Hans Peter Freyther wrote:
> Signed-off-by: Holger Hans Peter Freyther <holger-/0vNEYwyzy+/WdZNMWml2A@public.gmane.org>
> ---
>  man3/rtnetlink.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/rtnetlink.3 b/man3/rtnetlink.3
> index 6595bc0..213234d 100644
> --- a/man3/rtnetlink.3
> +++ b/man3/rtnetlink.3
> @@ -116,7 +116,7 @@ Creating a rtnetlink message to set the MTU of a device:
>      req.n.nlmsg_len = NLMSG_ALIGN(req.nh.nlmsg_len) +
>                                    RTA_LENGTH(sizeof(mtu));
>      memcpy(RTA_DATA(rta), &mtu, sizeof(mtu));
> -    send(rtnetlink_sk, &req, req.nh.nlmsg_len);
> +    send(rtnetlink_sk, &req, req.nh.nlmsg_len, 0);
>  .fi
>  .SH SEE ALSO
>  .BR netlink (3),
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
