From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: memcpy(3) man page change
Date: Sun, 21 May 2017 11:47:39 +0200
Message-ID: <a18d1671-38ad-7eb9-d298-2e314c6029cd@gmail.com>
References: <CAEdTPBfLwtWCa3dxQTjHdcEFLR2SnqASVST54u3otzoeNjc7Zw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAEdTPBfLwtWCa3dxQTjHdcEFLR2SnqASVST54u3otzoeNjc7Zw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Henry Bent <henry.r.bent-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Henry,

On 05/17/2017 02:24 PM, Henry Bent wrote:
> Hello,
> 
> The man page for memcpy(3) states that "Failure to observe the requirement
> that the memory areas do not overlap has been the source of real bugs."
> Aren't most bugs real?  I believe the intent would be better served by
> changing "real bugs" to "significant bugs," or similar language.

Yes, that wording is probably a little better. Changed as you suggest.

Thanks!

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
