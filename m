From: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: sync_file_range.2: add some big WARNINGS
Date: Mon, 21 Sep 2009 13:15:19 -0700
Message-ID: <20090921131519.875b4608.akpm@linux-foundation.org>
References: <20090827180116.GB31605@lst.de>
	<cfd18e0f0909192234l57ad4ec0rda34dcb83e355c5e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0909192234l57ad4ec0rda34dcb83e355c5e-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, hch-jcswGhMUV9g@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, 20 Sep 2009 07:34:40 +0200
Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:

> Hi Christoph,
> 
> Thanks for this patch. Since Andrew was the original author of this
> syscall, I'd like him to take a look at these changes, to get some
> review.
> 
> Andrew?
> 
> Thanks
> 
> Michael
> 
> On Thu, Aug 27, 2009 at 8:01 PM, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org> wrote:
> > This system call is by design completely unsuitable for any data
> > integrity operations. __Make that very clear in the manpage.
> >
> >
> > Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
> >
> > Index: man-pages/man2/sync_file_range.2
> > ===================================================================
> > --- man-pages.orig/man2/sync_file_range.2 __ __ __ 2009-08-27 14:51:51.373360594 -0300
> > +++ man-pages/man2/sync_file_range.2 __ __2009-08-27 14:57:35.213854927 -0300
> > @@ -80,11 +80,22 @@ after performing any write.
> > __Specifying
> > __.I flags
> > __as 0 is permitted, as a no-op.
> > -.SS Some details
> > -None of these operations write out the file's metadata.
> > +.SS WARNING
> > +This system call is extremly dangerous and should not be used in portable
> > +programs. __None of these operations write out the file's metadata.
> > __Therefore, unless the application is strictly performing overwrites of
> > -already-instantiated disk blocks,
> > -there are no guarantees that the data will be available after a crash.
> > +already-instantiated disk blocks, there are no guarantees that the data will
> > +be available after a crash. __There is no user interface to know if a
> > +write is purely an overwrite. On filesystem using copy on write semantics
> > +like
> > +.IR btrfs
> > +an over write of existing allocated blocks is impossible. __Writing into
> > +pre-allocated space many filesystems also require calls into the block
> > +allocator which this system call does not sync out to disk.
> > +This system call does not flush disk write caches and thus does not provide
> > +any data integrity on systems with volatile disk write caches.
> > +
> > +.SS Some details
> >

Shrug.  If you want.

The syscall is all about dirty memory management and userspace control
over IO timing/volume.  Trying to use it for data integrity purposes is a
bit perverse.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
