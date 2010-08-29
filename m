From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: SO_NO_CHECK socket option
Date: Sun, 29 Aug 2010 15:39:34 +0200
Message-ID: <AANLkTikadQTx+bNVx1uF8SvjwTvSKVWDRsyp4LWnJNxE@mail.gmail.com>
References: <20100820174917.GA18018@sig21.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100820174917.GA18018-FF7aIK3TAVNeoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Stezenbach <js-FF7aIK3TAVNeoWH0uzbU5w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Johannes,

On Fri, Aug 20, 2010 at 7:49 PM, Johannes Stezenbach <js-FF7aIK3TAVNeoWH0uzbU5w@public.gmane.org> wrote:
> Hi,
>
> according to RFC 768 the UDP checksum is optional, and
> indeed the kernel has support for the SO_NO_CHECK socket
> option (boolean: 0 == default, calculate checksum on xmit,
> 1 == do not calculate checksum on xmit).
>
> Maybe you would like to add this to socket(7).

In the source of the socket.7 man page, there is a comment:

[[

]]
One of the coauthors of this page was Andi Kleen, and I suspect he
wrote the comment


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
