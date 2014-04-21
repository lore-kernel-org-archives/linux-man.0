From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: munmap, msync: synchronization
Date: Mon, 21 Apr 2014 11:14:31 -0700
Message-ID: <20140421181431.GA17125@infradead.org>
References: <5353A158.9050009@gmx.de>
 <5354F00E.8050609@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5354F00E.8050609-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dave Chinner <david-FqsqvQoI3Ljby3iVrkZq2A@public.gmane.org>, Theodore T'so <tytso-3s7WtUTddSA@public.gmane.org>, Linux-Fsdevel <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Miklos Szeredi <miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org>, jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Apr 21, 2014 at 12:16:46PM +0200, Michael Kerrisk (man-pages) wrote:
> 1. In the bad old days (even on Linux, AFAIK, but that was in days
>    before I looked closely at what goes on), the page cache and
>    the buffer cache were not unified. That meant that a page from 
>    a file might both be in the buffer cache (because of file I/O
>    syscalls) and in the page cache (because of mmap()).

Correct.

> 2. In a non-unified cache system, pages can naturally get out of
>    synch in the two locations. Before it had a unified cache, Linux 
>    used to jump some hoops to ensure that contents in the two 
>    locations remained consistent.

Yeah.

> 3. Nowadays Linux--like most (all?) UNIX systems--has a 
>    unified cache: file I/O, mmap(), and the paging system all 
>    use the same cache. If a file is mmap()-ed and also subject
>    to file I?/, there will be only one copy of each file page 
>    in the cache. Ergo, the inconsistency problem goes away.

Mostly true, except for FreeBSD and Solaris when they use ZFS, which has
it's own file cache that is not coherent with the VM cache at the
implementation level.  Not sure how much of this leaks to userspace,
though.

> 4. IIUC, the pieces like msync(MS_ASYNC) and msync(MS_INVALIDATE)
>    exist only because of the bad old non-unified cache days.
>    MS_INVALIDATE was a way of saying: make sure that writes
>    to the file by other processes are visible in this mapping.
>    msync() without the MS_INVALIDATE flags was a way of saying:
>    make sure that read()s from the file see the changes made
>    via this mapping. Using either MS_SYNC or MS_ASYNC
>    was the way of saying: "I either want to wait until the file
>    updates have been completed", or "please start the updates
>    now, but I don't want to wait until they're completed".

Right.

> 5. On systems with a unified cache, msync(MS_INVALIDATE)
>    is a no-op. (That is so on Linux.)

Almost.  It returns EBUSY if it hits any mlock()ed region.  Don't ask me
why, though..

> 6. On Linux, MS_ASYNC is also a no-op. That's fine on a unified 
>    cache system. Filesystem I/O always sees a consistent view,
>    and MS_ASYNC never undertook to give a guarantee about *when*
>    the update would occur. (The Linux buffer cache logic will 
>    ensure that it is flushed out sometime in the near future.)

Right.  It's a fairly inefficient noop, though - it actually loops
over all vmas to do nothing with them.

> 7. On Linux (and probably many other modern systems), the only
>    call that has any real use is msync(MS_SYNC), meaning
>    "flush the buffers *now*, and I want to wait for that to 
>    complete, so that I can then continue safe in the knowledge
>    that my data has landed on a device". That's useful if we
>    want insurance for our data in the event of a system crash.

Right.  It's basically another way to call fsync, which is used to
implement it underneath.  It actually should be a ranged-fdatasync
but right it's it's implemented horribly inefficiently in that it
does a fsync call for each vma that it encounters in the range
specified.

> 8. POSIX make no mandate for a unified cache system. Thus,
>    we have MS_ASYNC and MS_INVALIDATE in the standard, and
>    the standard says nothing (AFAIK) about whether munmap() 
>    will flush data. On Linux (and probably most modern systems),
>    we're fine. but portable applications that care about 
>    standards and nonunified caches need to use msync().
> 
>    My advice: To ensure that the contents of a shared file
>    mapping are written to the underlying file--even on bad old
>    implementations--a call to msync() should be made before 
>    unmapping a mapping with munmap().

Agreed.

> 9. The mmap() man page says this:
> 
>        MAP_SHARED 
>            Share this mapping.  Updates to the mapping are vis???
>            ible to other processes that map this file, and  are
>            carried  through  to  the underlying file.  The file
>            may not actually be updated until msync(2)  or  mun???
>            map() is called.
> 
>    I believe the piece "or munmap()" is misleading. It implies
>    that munmap() must trigger a sync action. I don't think this
>    is true. All that it is required to do is remove some range
>    of pages from the process's virtual address space. I'm
>    inclined to remove those words, but I'd like to see if any
>    FS person has a correction to my understanding first.

I would expect non-coherent systems to update their caches on munmap,
Posix does not seem to require this, and I can't find any language
towards that in the HP-UX man page, which was a system that I remember
as non-coherent until the end.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
