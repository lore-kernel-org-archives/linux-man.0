From: Jamie Lokier <jamie@shareable.org>
Subject: Re: munmap, msync: synchronization
Date: Tue, 22 Apr 2014 08:04:21 +0100
Message-ID: <20140422070421.GI30215@jl-vm1.vm.bytemark.co.uk>
References: <5353A158.9050009@gmx.de>
 <5354F00E.8050609@gmail.com>
 <20140421181431.GA17125@infradead.org>
 <53557768.5070905@gmail.com>
 <20140421213418.GH30215@jl-vm1.vm.bytemark.co.uk>
 <20140422060320.GA21241@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140422060320.GA21241@infradead.org>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Christoph Hellwig <hch@infradead.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>, linux-man@vger.kernel.org, Dave Chinner <david@fromorbit.com>, Theodore T'so <tytso@mit.edu>, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, Miklos Szeredi <miklos@szeredi.hu>
List-Id: linux-man@vger.kernel.org

Christoph Hellwig wrote:
> On Mon, Apr 21, 2014 at 10:34:18PM +0100, Jamie Lokier wrote:
> > A ranged-fdatasync, for databases with little logs inside the big data
> > file, would be nice.  AIX, NetBSD and FreeBSD all have one :) Any
> > likelihood of that ever appearing in Linux?  sync_file_range() comes
> > with its Warning in the man page which basically means "don't trust me
> > unless you know the filesystem exactly".
> 
> We have the infrastructure for range fsync and fdatasync in the kernel,
> it's just not exposed.  Given that you've already done the research
> how about you send a patch to wire it up?  Do the above implementations
> at least agree on an API for it?

Hi Christoph,

Hardly research, I just did a quick Google and was surprised to find
some results.  AIX API differs from the BSDs; the BSDs seem to agree
with each other. fsync_range(), with a flag parameter saying what type
of sync, and whether it flushes the storage device write cache as well
(because they couldn't agree that was good - similar to the barriers
debate).

As for me doing it, no, sorry, I haven't touched the kernel in a few
years, life's been complicated for non-technical reasons, and I don't
have time to get back into it now.

> sync_file_range() unfortunately only writes out pagecache data and never
> the needed metadata to actually find it.  While we could multiplex a
> range fsync over it that seems to be very confusing (and would be more
> complicated than just adding new syscalls)

I agree. I never saw the point in sync_file_range() except to mislead,
whereas fsync_range() always seemed obvious!

In the kernel, I was always under the impression the simple part of
fsync_range - writing out data pages - was solved years ago, but being
sure the filesystem's updated its metadata in the proper way, that
begs for a little research into what filesystems do when asked,
doesn't it?

For example, imagine two dirty pages 0 and 1, two disk blocks A and B,
and a non-overwriting filesystem (similar to btrfs) which knows about
the dirty flags and has formulated a plan to journal a single metadata
change containing two pointers, from [0->A,1->B] to [0->C,1->D] when
it flushes metadata _after_ pages 0 and 1 are written to new disk
blocks C and D.  And you do fsync_range just on block 1.  Now if only
page 1 gets written and page 0 does not, it's important that a
different metadata change is journalled: [0->A,1->D] (or just [1->D]).
Now hopefully, all filesystems are sane enough to just do that, by
calculating what to journal as a response to only data I/O that's in
flight and behind a barrier.  But I wouldn't like to _assume_ that no
filesystems algorithms don't queue up the joint [0->C,1-D] metadata
change somehow, having seem the dirty flags, in a way that gets
confused by a forced metadata flush after partial dirty data flush.
After all it might be a legitimate thing to do in the current scheme.

(Similar things apply to converting preallocated-but-unwritten regions
to written.)

So I have this weird idea that to do it carefully needs a little
checking what filesystems do with carefully ordered block-pointer
metadata writes.

> > Then there's this, about Linux NFS incoherency with msync() and O_DIRECT:
> > 
> >     - https://groups.google.com/d/msg/comp.os.linux.development.apps/B49Rej6KV24/xEouZOVXs9gJ
> 
> That mail is utterly confused.  Yes, NFS has less coherency than normal
> filesystems (google for close to open), but msync actually does it's
> proper job on NFS.

Good to know :)

-- Jamie
