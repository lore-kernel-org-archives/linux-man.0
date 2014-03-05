From: Andrew Clayton <andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>
Subject: Re: [PATCH] getpriority.2: Adjust the process priority range
Date: Wed, 5 Mar 2014 14:50:20 +0000
Message-ID: <20140305145020.7801daa2@omega.digital-domain.net>
References: <1393992460-29062-1-git-send-email-andrew@digital-domain.net>
	<CAKgNAkjkmf94mp05Gqnh8SD2PnGvCZJcYwTS9mBDF9RYuDn75w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjkmf94mp05Gqnh8SD2PnGvCZJcYwTS9mBDF9RYuDn75w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, 5 Mar 2014 15:17:46 +0100, Michael Kerrisk (man-pages) wrote:

> Andrew,
> 
> On Wed, Mar 5, 2014 at 5:07 AM, Andrew Clayton
> <andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org> wrote:
> > The {get,set}priority man pages currently lists the process's
> > priority range as being from 40..1 however it should be 40..0 as 0
> > would be for a nice of -20.
> 
> 
> I don't think this is correct. Without actually re-checking the kernel
> source, this is what I think is correct:
> 
> k-nice (the internal kernel value) has the range 40..1.
> u-nice (the user-space value) has the range -20..+19
> 
> and u-nice = 20 - k-nice
> 
> (In fact, looking further down the man page, I see this is all
> explained. Note that there is no +20 nice value on Linux.)
> 
> Cheers,
> 
> Michael

Ok, thanks for the explanation. I was just confused by the above
because what user space seems to see is 39..0 (e,g the PRI column in
top, the 18th field in /proc/self/stat). Which is perhaps not really the
same thing were talking about here, which looking at a rt task has a
value of -100.

Cheers,
Andrew
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
