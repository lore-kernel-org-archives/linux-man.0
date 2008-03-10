From: WANG Cong <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch] Fix the prototype of personality(2)
Date: Mon, 10 Mar 2008 15:24:22 +0800 (CST)
Message-ID: <20080310.152422.158004388.xiyou.wangcong@gmail.com>
References: <20080308.200447.90797012.xiyou.wangcong@gmail.com>
	<cfd18e0f0803100021u3d28db41pcdf2c0b64aabeada@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0803100021u3d28db41pcdf2c0b64aabeada-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Date: Mon, 10 Mar 2008 08:21:32 +0100

> Hi Cong,
> 
> On Sat, Mar 8, 2008 at 1:04 PM, WANG Cong <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> >  According to the source code of Linux kernel, the type of the
> >  return value of personality(2) should be long instead of int.
> 
> But in <sys/personality.h>, the return type is long...  So it seems to
> me the page is correct.  Let me know if/why you still disagree.
> 

Oh, I see.

It seems that glibc wraps it, right? And what's the relation between
kernel headers and glibc headers?

Thank you.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
