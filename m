From: Simon Paillard <simon.paillard-RGJHTEmuthQGuQl/6FzYuenJ6Cvpl5oe@public.gmane.org>
Subject: Re: getifaddrs()
Date: Fri, 6 Jul 2012 21:29:45 +0200
Message-ID: <20120706192945.GA15283@glenfiddich.mraw.org>
References: <4FF60812.70408@seclab.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FF60812.70408-qE3U7d0pukyEhLc4KmoMIOTv7YV0F9Eg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Adrian Dabrowski <atrox-qE3U7d0pukyEhLc4KmoMIOTv7YV0F9Eg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

On Thu, Jul 05, 2012 at 11:33:06PM +0200, Adrian Dabrowski wrote:
> Version: manpages-dev 3.27-1ubuntu2

You should upgrade your manpages-dev version:
http://packages.ubuntu.com/search?keywords=manpages-dev 
 
> The example program source produces a Seg-Fault, when a device does
> not have an ifa->ifa_addr. (e.g. openvpn-tunnels, probably others
> (dialup?))

Thanks for reporting the issue, don't hesitate to report similar reports *that
still apply in current version*.
 
> ORIGINAL:
>            for (ifa = ifaddr; ifa != NULL; ifa = ifa->ifa_next) {
>                family = ifa->ifa_addr->sa_family;

http://man7.org/linux/man-pages/man3/getifaddrs.3.html

           for (ifa = ifaddr; ifa != NULL; ifa = ifa->ifa_next) {
               if (ifa->ifa_addr == NULL)
                   continue;

               family = ifa->ifa_addr->sa_family; 

It has been fixed by
http://git.kernel.org/?p=docs/man-pages/man-pages.git;a=commitdiff;h=ebd05fecfe

> POSSIBLE FIX:
>            for (ifa = ifaddr; ifa != NULL; ifa = ifa->ifa_next) {
> 		if (ifa->ifa_addr != NULL)
>                		family = ifa->ifa_addr->sa_family;
> 		else
> 			family = -1;
> 
> 
> Also it is not documented, that  struct sockaddr *ifa_addr  might be NULL.


Best regards.

-- 
Simon Paillard
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
