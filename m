From: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: aio manuals
Date: Wed, 16 Mar 2011 11:43:56 +0100
Message-ID: <20110316104356.GB32095@saboteur.suse.cz>
References: <20110309180600.GA14533@saboteur.suse.cz>
 <x49ei6gnpsx.fsf@segfault.boston.devel.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <x49ei6gnpsx.fsf-RRHT56Q3PSP4kTEheFKJxxDDeQx5vsVwAInAS/Ez/D0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi!
> > The io_* manuals says that we should use aio_context_t as type for aio
> > handle. That is wrong as the functions are defined with io_context_t
> > (libaio.h). Patch attached.
> >
> > The only oustanding issue is that manual for io_setup says that we must
> > set the io_context_t to 0 before use. And as the io_context_t is defined
> > as opaque type (and it's defined as pointer now) the only way to
> > initalize it without warnigs is memset(&ctxp, 0, sizeof(ctxp));. Perhaps
> > this is not needed at all, as the ctpx is passed to the syscall and then
> > initalized in the kernel (at least I haven't seem any checks in the
> > codepath).
> 
> There are checks in place for this, so the man page should not change in
> that regard.

So should we settle for memset()? I could update send updated patch
then.

-- 
Cyril Hrubis
chrubis-AlSwsSmVLrQ@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
