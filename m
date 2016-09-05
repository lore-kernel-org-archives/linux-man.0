From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] rtnetlink.3: tfix
Date: Mon, 5 Sep 2016 21:05:26 +1200
Message-ID: <e5609d3a-1d3a-a8f4-3b6c-f8e8e474ca74@gmail.com>
References: <1473058499-23820-1-git-send-email-hukeping@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473058499-23820-1-git-send-email-hukeping-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: HuKeping <hukeping-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org, herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org, chamaken-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pablo-Cap9r6Oaw4JrovVCs/uTlw@public.gmane.org, fw-HFFVJYpyMKqzQB+pC5nmwQ@public.gmane.org, elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Hu Keping,
 
On 09/05/2016 06:54 PM, HuKeping wrote:
> It seems that the structure in this example doesn't
> have a field named n.

Thanks. Patch applied.

Cheers,

Michael


> Signed-off-by: Hu Keping <hukeping-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> ---
>  man3/rtnetlink.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/rtnetlink.3 b/man3/rtnetlink.3
> index 143be57..430206d 100644
> --- a/man3/rtnetlink.3
> +++ b/man3/rtnetlink.3
> @@ -113,7 +113,7 @@ Creating a rtnetlink message to set the MTU of a device:
>                               NLMSG_ALIGN(req.nh.nlmsg_len));
>      rta\->rta_type = IFLA_MTU;
>      rta\->rta_len = RTA_LENGTH(sizeof(unsigned int));
> -    req.n.nlmsg_len = NLMSG_ALIGN(req.nh.nlmsg_len) +
> +    req.nh.nlmsg_len = NLMSG_ALIGN(req.nh.nlmsg_len) +
>                                    RTA_LENGTH(sizeof(mtu));
>      memcpy(RTA_DATA(rta), &mtu, sizeof(mtu));
>      send(rtnetlink_sk, &req, req.nh.nlmsg_len, 0);
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
