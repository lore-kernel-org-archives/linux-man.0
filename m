From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [Patch] Fix the prototype of personality(2)
Date: Mon, 10 Mar 2008 09:10:41 +0100
Message-ID: <cfd18e0f0803100110x435c3dbchf979c6be2a6888ce@mail.gmail.com>
References: <20080308.200447.90797012.xiyou.wangcong@gmail.com>
	 <cfd18e0f0803100021u3d28db41pcdf2c0b64aabeada@mail.gmail.com>
	 <20080310.152422.158004388.xiyou.wangcong@gmail.com>
	 <cfd18e0f0803100110s4101e6c9m71c20e9a737a5f79@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0803100110s4101e6c9m71c20e9a737a5f79-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: WANG Cong <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Mar 10, 2008 at 9:10 AM, Michael Kerrisk
<mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>
> On Mon, Mar 10, 2008 at 8:24 AM, WANG Cong <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>  > From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>  >  Date: Mon, 10 Mar 2008 08:21:32 +0100
>  >
>  >
>  >  > Hi Cong,
>  >  >
>  >  > On Sat, Mar 8, 2008 at 1:04 PM, WANG Cong <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>  >  > >
>  >  > >  According to the source code of Linux kernel, the type of the
>  >  > >  return value of personality(2) should be long instead of int.
>  >  >
>  >  > But in <sys/personality.h>, the return type is long...  So it seems to
>  >  > me the page is correct.  Let me know if/why you still disagree.
>  >  >
>  >
>  >  Oh, I see.
>  >
>  >  It seems that glibc wraps it, right? And what's the relation between
>  >  kernel headers and glibc headers?
>
>  I'm not 100% sure of the details on this point.  Let me know if you find out.

PS: Yes-- glibc wraps it...
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
