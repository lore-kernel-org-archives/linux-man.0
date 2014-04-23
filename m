From: Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>
Subject: Re: [PATCH] fsync_range, was: Re: munmap, msync: synchronization
Date: Wed, 23 Apr 2014 23:15:27 +0100
Message-ID: <20140423221402.GL30215@jl-vm1.vm.bytemark.co.uk>
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
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dave Chinner <david-FqsqvQoI3Ljby3iVrkZq2A@public.gmane.org>, Theodore T'so <tytso-3s7WtUTddSA@public.gmane.org>, Linux-Fsdevel <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Miklos Szeredi <miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Christoph Hellwig wrote:
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

Yes, especially with the headings on the man pages saying FreeBSD :)
Just checked a FreeBSD 8.2 system, doesn't have it.

> The APIs are mostly the same, except that AIX reuses O_ flags as
> argument and NetBSD has a separate namespace.  Following the latter
> seems more sensible, and also allows developer to define the separate
> name to the O_ flag for portability.
...
> I've cooked up a patch, but I really need someone to test it and promote
> it.  Find the patch attached.  There are two differences to the NetBSD
> one:
> 
>  1) It doesn't fail for read-only FDs.  fsync doesn't, and while
>     standards used to have fdatasync and aio_fsync fail for them,
>     Linux never did and the standards are catching up:
> 
> 	http://austingroupbugs.net/view.php?id=501
> 	http://austingroupbugs.net/view.php?id=671

See also for maybe why:

        http://www.eivanov.com/2011/06/using-fsync-and-fsyncrange-with.html

>  2) I don't implement the FDISKSYNC.  Requiring it is utterly broken,
>     and we wouldn't even have the infrastructure for it.  It might make
>     sense to provide it defined to 0 so that we have the identifier but
>     make it a no-op.

I presume Linux does the equivalent without needing FDISKSYNC, if and
only if the filesystem is mounted with barriers enabled, which is the
default nowadays?

> > In the kernel, I was always under the impression the simple part of
> > fsync_range - writing out data pages - was solved years ago, but being
> > sure the filesystem's updated its metadata in the proper way, that
> > begs for a little research into what filesystems do when asked,
> > doesn't it?
> 
> The filesystems I care about handle it fine, and while I don't know
> the details of others they better handle it properly, given that we
> use vfs_fsync_range to implement O_SNYC/O_DSYNC writes and commits
> from the nfs server.

Excellent.  This really looks like it should have gone in as a system
call years ago, since vfs_fsync_range was there all along waiting to
be used!

> Differences from NetBSD are:
> 
>  1) It doesn't fail for read-only FDs.  fsync doesn't, and while standards
>     used require fdatasync and aio_fsync to fail for read-only file
>     descriptors Linux never did and the standards are catching up:
> 
> 	http://austingroupbugs.net/view.php?id=501
> 	http://austingroupbugs.net/view.php?id=671
> 
>  2) It doesn't implement the FDISKSYNC.  Requiring a flag to actuall make
>     data persistant is completely broken, and the Linux infrastructure
>     doesn't support it anyway.  We could provide it as a no-op if we
>     really need to.

Ah, more differences, which I think should be dropped actually.

   3) Does not implement NetBSD's documented behaviour when length == 0.
      NetBSD says "If the length parameter is zero, fsync_range() will
      synchronize all of the file data".  This path does from offset.

   4) Other weird range stuff inherited from sync_file_range() on 32
      bit machines only.  May not be correct with O_DIRECT or
      filesystems that don't use page cache.

See:

> +static loff_t end_offset(loff_t offset, loff_t nbytes)
> +{
> +	loff_t endbyte = offset + nbytes;
> +
> +	if ((s64)offset < 0)
> +		return -EINVAL;
> +	if ((s64)endbyte < 0)
> +		return -EINVAL;
> +	if (endbyte < offset)
> +		return -EINVAL;
> +
> +	if (sizeof(pgoff_t) == 4) {
> +		if (offset >= (0x100000000ULL << PAGE_CACHE_SHIFT)) {
> +			/*
> +			 * The range starts outside a 32 bit machine's
> +			 * pagecache addressing capabilities.  Let it "succeed"
> +			 */
> +			return 0;
> +		}
> +		if (endbyte >= (0x100000000ULL << PAGE_CACHE_SHIFT)) {
> +			/*
> +			 * Out to EOF
> +			 */
> +			return LLONG_MAX;
> +		}
> +	}
> +
> +	if (nbytes == 0)
> +		endbyte = LLONG_MAX;
> +	else
> +		endbyte--;		/* inclusive */
> +
> +	return endbyte;
> +}

That was in sync_file_range(), where I think it might have made more
sense as that's obviously tied to the page cache only.  So:

    a) Giving zero length results in sync from offset..LLONG_MAX.
       (NetBSD would have it be 0..LLONG_MAX, according to man page.)

    b) If the offset is "too large" for page cache on a 32-bit machine,
       it won't do anything -- including no metadata side-effects.

    c) If the length is "too large" for page cache on a 32-bit machine,
       it extends the length to LLONG_MAX.

The desired behaviour with zero length, that's obviously a judgement
call.  I guess that provided NetBSD applications the option to use
FDISKSYNC without a range :)

About b) and c) they both look dubious, because it's not a given that
a filesystem is using page cache, or only using page cache.  For
example FUSE using O_DIRECT.  (Not that I've checked if you can
actually write anything in those ranges though.)

b) looks worse because it means side effects are also quietly not
done, and a file might legitimately not use the page cache (consider a
FUSE-mounted file accessed with O_DIRECT).

So, would it not make sense to just check the offset, length and
offset+length fit into s64; and if length is zero change the range to
0..LLONG_MAX, and simply match NetBSD that way?  (Or, call me crazy,
just return if length is zero.)

Best,
-- Jamie
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
