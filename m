From: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Subject: Re: open(2) says O_DIRECT works on 512 byte boundries?
Date: Thu, 29 Jan 2009 22:17:14 -0800
Message-ID: <20090130061714.GC31209@kroah.com>
References: <20090128213322.GA15789@kroah.com> <20090129141338.34e44a1f.kamezawa.hiroyu@jp.fujitsu.com> <20090129160826.701E.KOSAKI.MOTOHIRO@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090129160826.701E.KOSAKI.MOTOHIRO-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: KOSAKI Motohiro <kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Cc: KAMEZAWA Hiroyuki <kamezawa.hiroyu-+CUm20s59erQFUHtdCDX3A@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Jan 29, 2009 at 04:10:39PM +0900, KOSAKI Motohiro wrote:
> (CC to andrea)
> 
> > On Wed, 28 Jan 2009 13:33:22 -0800
> > Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org> wrote:
> > 
> > > In looking at open(2), it says that O_DIRECT works on 512 byte boundries
> > > with the 2.6 kernel release:
> > > 	Under Linux 2.4, transfer sizes, and the alignment of the user
> > > 	buffer and  the file offset must all be multiples of the logical
> > > 	block size of the file system.  Under Linux 2.6, alignment  to
> > > 	512-byte  boundaries suffices.
> > > 
> > > However if you try to access an O_DIRECT opened file with a buffer that
> > > is PAGE_SIZE aligned + 512 bytes, it fails in a bad way (wrong data is
> > > read.)
> > > 
> > 
> > IIUC, it's not related to 512bytes boundary. Just a race between
> > direct-io v.s. copy-on-write. Copy-on-Write while reading a page via DIO
> > is a problem.
> 
> Yes.
> Greg's reproducer is a bit misleading.
> 
> >	    for (j = 0; j < workers; j++) {
> >		worker[j].offset = offset + j * PAGE_SIZE;
> >		worker[j].buffer = buffer + align + j * PAGE_SIZE;
> >		worker[j].length = PAGE_SIZE;
> >	    }
> 
> this code mean,
>   - if align == 0, reader thread touch only one page.
>     and the page is touched only one thread.
>   - if align != 0, reader thread touch two page.
>     and the page is touched two thread.
> 
> then, race is happend if align != 0.
> We discussed this issue with andrea last month.
> ("Corruption with O_DIRECT and unaligned user buffers" thread)
> 
> As far as I know, he is working on fixing this issue now.

Thanks for the pointers, I'll go read the thread and follow up there.

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
