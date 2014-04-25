From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH] fsync_range, was: Re: munmap, msync: synchronization
Date: Thu, 24 Apr 2014 23:26:18 -0700
Message-ID: <20140425062618.GA22424@infradead.org>
References: <5353A158.9050009@gmx.de>
 <5354F00E.8050609@gmail.com>
 <20140421181431.GA17125@infradead.org>
 <53557768.5070905@gmail.com>
 <20140421213418.GH30215@jl-vm1.vm.bytemark.co.uk>
 <20140422060320.GA21241@infradead.org>
 <20140422070421.GI30215@jl-vm1.vm.bytemark.co.uk>
 <20140422092837.GA6191@infradead.org>
 <20140423221402.GL30215@jl-vm1.vm.bytemark.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140423221402.GL30215-DqlFc3psUjeg7Qil/0GVWOc42C6kRsbE@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dave Chinner <david-FqsqvQoI3Ljby3iVrkZq2A@public.gmane.org>, Theodore T'so <tytso-3s7WtUTddSA@public.gmane.org>, Linux-Fsdevel <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Miklos Szeredi <miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Apr 23, 2014 at 11:15:27PM +0100, Jamie Lokier wrote:
> >  1) It doesn't fail for read-only FDs.  fsync doesn't, and while
> >     standards used to have fdatasync and aio_fsync fail for them,
> >     Linux never did and the standards are catching up:
> > 
> > 	http://austingroupbugs.net/view.php?id=501
> > 	http://austingroupbugs.net/view.php?id=671
> 
> See also for maybe why:
> 
>         http://www.eivanov.com/2011/06/using-fsync-and-fsyncrange-with.html

I don't really see a "why" there, just the observation that fsync and
fsync_range behavior different on NetBSD, which is odd but documented
behavior.

> >  2) I don't implement the FDISKSYNC.  Requiring it is utterly broken,
> >     and we wouldn't even have the infrastructure for it.  It might make
> >     sense to provide it defined to 0 so that we have the identifier but
> >     make it a no-op.
> 
> I presume Linux does the equivalent without needing FDISKSYNC, if and
> only if the filesystem is mounted with barriers enabled, which is the
> default nowadays?

That's correct, at least for modern mainstream filesystems.  Either way
the filesystem would have to implement the cache flush, so those that
don't support it couldn't support FDISKSYNC either.

> Ah, more differences, which I think should be dropped actually.
> 
>    3) Does not implement NetBSD's documented behaviour when length == 0.
>       NetBSD says "If the length parameter is zero, fsync_range() will
>       synchronize all of the file data".  This path does from offset.

Indeed.  AIX also documents the same behavior.

>    4) Other weird range stuff inherited from sync_file_range() on 32
>       bit machines only.  May not be correct with O_DIRECT or
>       filesystems that don't use page cache.

It's not really possible to implement a full Linux filesystem without
touching the pagecache, but I agree that this probably doesn't
belong into the VFS.  sync_file_range is one of these odd layering
violations that calls straight into the pagecache without going into
the filesystem first (readahead is the other one that comes to mind).

> The desired behaviour with zero length, that's obviously a judgement
> call.  I guess that provided NetBSD applications the option to use
> FDISKSYNC without a range :)

It seems to originate from the earlier AIX version, but I think it's
just their way to sync the whole range. I prefer our 0, LLONG_MAX
notation, but given the existing user interface we should stick to it.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
