From: Dave Chinner <david-FqsqvQoI3Ljby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH] fsync_range, was: Re: munmap, msync: synchronization
Date: Thu, 24 Apr 2014 11:34:35 +1000
Message-ID: <20140424013435.GY15995@dastard>
References: <5353A158.9050009@gmx.de>
 <5354F00E.8050609@gmail.com>
 <20140421181431.GA17125@infradead.org>
 <53557768.5070905@gmail.com>
 <20140421213418.GH30215@jl-vm1.vm.bytemark.co.uk>
 <20140422060320.GA21241@infradead.org>
 <20140422070421.GI30215@jl-vm1.vm.bytemark.co.uk>
 <20140422092837.GA6191@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140422092837.GA6191-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Theodore T'so <tytso-3s7WtUTddSA@public.gmane.org>, Linux-Fsdevel <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Miklos Szeredi <miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, Apr 22, 2014 at 02:28:37AM -0700, Christoph Hellwig wrote:
> On Tue, Apr 22, 2014 at 08:04:21AM +0100, Jamie Lokier wrote:
> > Hi Christoph,
> > 
> > Hardly research, I just did a quick Google and was surprised to find
> > some results.  AIX API differs from the BSDs; the BSDs seem to agree
> > with each other. fsync_range(), with a flag parameter saying what type
> > of sync, and whether it flushes the storage device write cache as well
> > (because they couldn't agree that was good - similar to the barriers
> > debate).
> 
> There is no FreeBSD implementation, I think you were confused by FreeBSD
> also hosting NetBSD man pages on their site, just as I initially was.
> 
> The APIs are mostly the same, except that AIX reuses O_ flags as
> argument and NetBSD has a separate namespace.  Following the latter
> seems more sensible, and also allows developer to define the separate
> name to the O_ flag for portability.
> 
> > As for me doing it, no, sorry, I haven't touched the kernel in a few
> > years, life's been complicated for non-technical reasons, and I don't
> > have time to get back into it now.
> 
> I've cooked up a patch, but I really need someone to test it and promote
> it.  Find the patch attached.  There are two differences to the NetBSD
> one:
.....

> From b63881cac84b35ce3d6a61a33e33ac795a5c583c Mon Sep 17 00:00:00 2001
> From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
> Date: Tue, 22 Apr 2014 11:24:51 +0200
> Subject: fs: implement fsync_range

Christoph, if this is going into the kernel, can you add support for
xfs_io and write a couple of xfstests to test it? I'm not
comfortable with adding new data integrity primitives to the kernel
without having robust validation infrastructure already in place for
it. It might also be worthwhile looking to extend Josef's
fsync-tester.c to be able to use ranged fsyncs so to test all the
various corner cases that we need to....

Cheers,

Dave.
-- 
Dave Chinner
david-FqsqvQoI3Ljby3iVrkZq2A@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
