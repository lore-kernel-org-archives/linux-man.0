From: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: open(2) says O_DIRECT works on 512 byte boundries?
Date: Tue, 3 Feb 2009 16:01:12 +0100
Message-ID: <20090203150111.GA20323@random.random>
References: <20090128213322.GA15789@kroah.com> <20090129141338.34e44a1f.kamezawa.hiroyu@jp.fujitsu.com> <20090129160826.701E.KOSAKI.MOTOHIRO@jp.fujitsu.com> <20090130061714.GC31209@kroah.com> <20090202220856.GY20323@random.random> <20090203035012.GC1867@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090203035012.GC1867-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Cc: KOSAKI Motohiro <kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org>, KAMEZAWA Hiroyuki <kamezawa.hiroyu-+CUm20s59erQFUHtdCDX3A@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Feb 02, 2009 at 07:50:12PM -0800, Greg KH wrote:
> On Mon, Feb 02, 2009 at 11:08:56PM +0100, Andrea Arcangeli wrote:
> > Hi Greg!
> > 
> > > Thanks for the pointers, I'll go read the thread and follow up there.
> > 
> > If you also run into this final fix is attached below. Porting to
> > mainline is a bit hard because of gup-fast... Perhaps we can use mmu
> > notifiers to fix gup-fast... need to think more about it then I'll
> > post something.
> > 
> > Please help testing the below on pre-gup-fast kernels, thanks!
> 
> Thanks a lot for the patch, I'll try this out tomorrow.

before testing I recommend to make this change:

-       if ((flags & FOLL_WRITE) && PageAnon(page) && !PageGUP(page))
+	if (PageAnon(page) && !PageGUP(page))

If gup triggers cow, gup clears FOLL_WRITE from foll_flags before
calling follow_page again, I think that's why it didn't work right for
everyone, it just couldn't work right if FOLL_WRITE was going away
before the last follow_page run. I wanted to set PG_gup only for
gup(write=1) and not for gup(write=0) but that optimization that
clears FOLL_WRITE prevents the above to work right, so the simple
solution is to always set PG_gup, it won't make a big difference.

I'm looking at the hugetlb cow before posting an update...
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
