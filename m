From: Jamie Lokier <jamie@shareable.org>
Subject: Re: munmap, msync: synchronization
Date: Mon, 21 Apr 2014 22:34:18 +0100
Message-ID: <20140421213418.GH30215@jl-vm1.vm.bytemark.co.uk>
References: <5353A158.9050009@gmx.de>
 <5354F00E.8050609@gmail.com>
 <20140421181431.GA17125@infradead.org>
 <53557768.5070905@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53557768.5070905@gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, linux-man@vger.kernel.org, Dave Chinner <david@fromorbit.com>, Theodore T'so <tytso@mit.edu>, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, Miklos Szeredi <miklos@szeredi.hu>
List-Id: linux-man@vger.kernel.org

Michael Kerrisk (man-pages) wrote:
> >> 7. On Linux (and probably many other modern systems), the only
> >>    call that has any real use is msync(MS_SYNC), meaning
> >>    "flush the buffers *now*, and I want to wait for that to 
> >>    complete, so that I can then continue safe in the knowledge
> >>    that my data has landed on a device". That's useful if we
> >>    want insurance for our data in the event of a system crash.
> > 
> > Right.  It's basically another way to call fsync, which is used to
> > implement it underneath.  It actually should be a ranged-fdatasync
> > but right it's it's implemented horribly inefficiently in that it
> > does a fsync call for each vma that it encounters in the range
> > specified.

A ranged-fdatasync, for databases with little logs inside the big data
file, would be nice.  AIX, NetBSD and FreeBSD all have one :) Any
likelihood of that ever appearing in Linux?  sync_file_range() comes
with its Warning in the man page which basically means "don't trust me
unless you know the filesystem exactly".

> Thanks for checking all of this over and thanks also
> for confirming that I learned my lessens well in the
> "Jamie Lokier school of tough technical reviewing" ;-).

Hi! That was a long time ago :)

> >> 9. The mmap() man page says this:
> >>
> >>        MAP_SHARED 
> >>            Share this mapping.  Updates to the mapping are vis???
> >>            ible to other processes that map this file, and  are
> >>            carried  through  to  the underlying file.  The file
> >>            may not actually be updated until msync(2)  or  mun???
> >>            map() is called.
> >>
> >>    I believe the piece "or munmap()" is misleading. It implies
> >>    that munmap() must trigger a sync action. I don't think this
> >>    is true. All that it is required to do is remove some range
> >>    of pages from the process's virtual address space. I'm
> >>    inclined to remove those words, but I'd like to see if any
> >>    FS person has a correction to my understanding first.
> > 
> > I would expect non-coherent systems to update their caches on munmap,
> > Posix does not seem to require this, and I can't find any language
> > towards that in the HP-UX man page, which was a system that I remember
> > as non-coherent until the end.
> 
> Yes, that's how I read it too. POSIX seems to have no requirements here,
> so I assume it was catering to to the lowest common denominator.

According to this:

    http://h30499.www3.hp.com/t5/System-Administration/2-second-delays-in-fsync-msync-munmap/td-p/3092785/page/2#.U1WBw8dSI1-

and the conclusion of the following page:

   - munmap() does _something_ on HP-UX, but it might be just a poorly
     implemented artifact rather than equivalent to msync.

   - While we're there, the lowest common denominator for HP-UX was
     that pwrite() followed by mmap() does not provide the data
     recently written, even with fsync() between.  The thread ended
     there, but I would guess either it's a bug _or_ perhaps
     write+mmap+msync(MS_INVALIDATE) are needed in that order despite
     the write being before the mmap, perhaps if the shared segment
     was maintained by another process.

   - To keep it exciting, if you look at the HP-UX man page, 32-bit
     and 64-bit processes have separate mmap caches - writing to
     shared memory in one of them won't be seen immediately by the other.

Then there's this, about Linux NFS incoherency with msync() and O_DIRECT:

    - https://groups.google.com/d/msg/comp.os.linux.development.apps/B49Rej6KV24/xEouZOVXs9gJ

I don't know if any of the above are _true_ though :)

Best,
-- Jamie
