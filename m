From: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Subject: Re: open(2) says O_DIRECT works on 512 byte boundries?
Date: Wed, 4 Feb 2009 15:41:53 -0800
Message-ID: <20090204234153.GA32244@kroah.com>
References: <20090128213322.GA15789@kroah.com> <20090129141338.34e44a1f.kamezawa.hiroyu@jp.fujitsu.com> <20090129160826.701E.KOSAKI.MOTOHIRO@jp.fujitsu.com> <20090130061714.GC31209@kroah.com> <20090202220856.GY20323@random.random>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090202220856.GY20323-ulAA2RpUuRJvbPj5LQlJ3g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: KOSAKI Motohiro <kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org>, KAMEZAWA Hiroyuki <kamezawa.hiroyu-+CUm20s59erQFUHtdCDX3A@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Feb 02, 2009 at 11:08:56PM +0100, Andrea Arcangeli wrote:
> Hi Greg!
> 
> > Thanks for the pointers, I'll go read the thread and follow up there.
> 
> If you also run into this final fix is attached below. Porting to
> mainline is a bit hard because of gup-fast... Perhaps we can use mmu
> notifiers to fix gup-fast... need to think more about it then I'll
> post something.
> 
> Please help testing the below on pre-gup-fast kernels, thanks!

What kernel version was this patch against?  I can't seem to apply it to
anything close to mainline :(

I tried 2.6.29-rc3, 2.6.28-stable and 2.6.27-stable.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
