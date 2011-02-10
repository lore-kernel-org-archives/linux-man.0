From: Christian Franke <nobody-e83xkrq8dvbLvtPRa3sz4w@public.gmane.org>
Subject: Re: [PATCH] ipv6.7: fix description of IPV6_PKTINFO
Date: Thu, 10 Feb 2011 02:48:43 +0100
Message-ID: <20110210014843.GA18017@ts2server.com>
References: <20110210013700.GA17765@ts2server.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110210013700.GA17765-FCpQSzCsxjR54TAoqtyWWQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Feb 10, 2011 at 02:37:00AM +0100, Christian Franke wrote:
>   IPV6_PKTINFO takes a struct in6_pktinfo as argument, not an int,
>   see linux/net/ipv6/ipv6_sockglue.c

This is true for newer kernels. However as bug #18132 points out,
the problem of RFC2292 vs RFC3542 and the current implementation
in Linux is not that simple, so the patch is probably not very
helpful.

-Christian Franke
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
