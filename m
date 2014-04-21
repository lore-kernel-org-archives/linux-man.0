From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: munmap, msync: synchronization
Date: Mon, 21 Apr 2014 12:16:46 +0200
Message-ID: <5354F00E.8050609@gmail.com>
References: <5353A158.9050009@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <5353A158.9050009@gmx.de>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, linux-man@vger.kernel.org
Cc: mtk.manpages@gmail.com, Christoph Hellwig <hch@infradead.org>, Dave Chinner <david@fromorbit.com>, Theodore T'so <tytso@mit.edu>, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, jamie@shareable.org
List-Id: linux-man@vger.kernel.org

[CCing a few people who may correct my errors; perhaps there are some
improvements that are needed for the mmap() and msync() man pages

]

Hello Heinrich,

On 04/20/2014 12:28 PM, Heinrich Schuchardt wrote:
> Hello Michael,
>=20
> when analyzing how the fanotify API interacts with mmap(2) I stumbled=
=20
> over the following issues in the manpages:
>=20
>=20
> The manpage of msync(2) says:
> "msync() flushes changes made to the in-core copy of a file that was=20
> mapped into memory using mmap(2) back to disk."
>=20
> "back to disk" implies that the file system is forced to actually wri=
te=20
> to the hard disk, somewhat equivalent to invoking sync(1). Is that=20
> guaranteed for all file systems?
>=20
> Not all file systems are necessarily disk based (e.g. davfs, tmpfs).
>=20
> So shouldn't we write:
> "... back to the file system."

Yes, that seems better to me. Done.

> http://pubs.opengroup.org/onlinepubs/007904875/functions/msync.html
> says
> "... to permanent storage locations, if any,"
>=20
>=20
> The manpage of munmap(2) leaves it unclear, if copying back to the=20
> filesystem is synchronous or asynchronous.

In fact, the page says nearly nothing about whether it synchs at all.
That is (I think) more or less deliberate. See below.

> This bit of information is important, because, if munmap is=20
> asynchronous, applications might want to call msync(,,MS_SYNC), befor=
e=20
> calling munmap. If munmap is synchronous it might block until the fil=
e=20
> system responds (think of waiting for a tape to be loaded, or a webda=
v=20
> server to respond).
>=20
>=20
> What happens to an unfinished prior asynchronous update by=20
> mmap(,,MS_ASYNC) when munmap is called?

I believe the answer is: On Linux, nothing special; the asynchronous
update will still be done. (I'm not sure that anything needs to be
said in the man page... But, if you have a good argument about why=20
something should be said, I'm open to hearing it.)

> Will munmap "invalidate other mappings of the same file (so that they=
=20
> can be updated with the fresh values just written)" like=20
> msync(,,MS_INVALIDATE) does?

I don't believe there's any requirement that it does. (Again, I'm not
sure that anything needs to be said in the man page... But, if
you have a good argument...)

So, here's how things are as I understand them.

1. In the bad old days (even on Linux, AFAIK, but that was in days
   before I looked closely at what goes on), the page cache and
   the buffer cache were not unified. That meant that a page from=20
   a file might both be in the buffer cache (because of file I/O
   syscalls) and in the page cache (because of mmap()).

2. In a non-unified cache system, pages can naturally get out of
   synch in the two locations. Before it had a unified cache, Linux=20
   used to jump some hoops to ensure that contents in the two=20
   locations remained consistent.

3. Nowadays Linux--like most (all?) UNIX systems--has a=20
   unified cache: file I/O, mmap(), and the paging system all=20
   use the same cache. If a file is mmap()-ed and also subject
   to file I?/, there will be only one copy of each file page=20
   in the cache. Ergo, the inconsistency problem goes away.

4. IIUC, the pieces like msync(MS_ASYNC) and msync(MS_INVALIDATE)
   exist only because of the bad old non-unified cache days.
   MS_INVALIDATE was a way of saying: make sure that writes
   to the file by other processes are visible in this mapping.
   msync() without the MS_INVALIDATE flags was a way of saying:
   make sure that read()s from the file see the changes made
   via this mapping. Using either MS_SYNC or MS_ASYNC
   was the way of saying: "I either want to wait until the file
   updates have been completed", or "please start the updates
   now, but I don't want to wait until they're completed".

5. On systems with a unified cache, msync(MS_INVALIDATE)
   is a no-op. (That is so on Linux.)

6. On Linux, MS_ASYNC is also a no-op. That's fine on a unified=20
   cache system. Filesystem I/O always sees a consistent view,
   and MS_ASYNC never undertook to give a guarantee about *when*
   the update would occur. (The Linux buffer cache logic will=20
   ensure that it is flushed out sometime in the near future.)

7. On Linux (and probably many other modern systems), the only
   call that has any real use is msync(MS_SYNC), meaning
   "flush the buffers *now*, and I want to wait for that to=20
   complete, so that I can then continue safe in the knowledge
   that my data has landed on a device". That's useful if we
   want insurance for our data in the event of a system crash.

8. POSIX make no mandate for a unified cache system. Thus,
   we have MS_ASYNC and MS_INVALIDATE in the standard, and
   the standard says nothing (AFAIK) about whether munmap()=20
   will flush data. On Linux (and probably most modern systems),
   we're fine. but portable applications that care about=20
   standards and nonunified caches need to use msync().

   My advice: To ensure that the contents of a shared file
   mapping are written to the underlying file--even on bad old
   implementations--a call to msync() should be made before=20
   unmapping a mapping with munmap().

9. The mmap() man page says this:

       MAP_SHARED=20
           Share this mapping.  Updates to the mapping are vis=E2=80=90
           ible to other processes that map this file, and  are
           carried  through  to  the underlying file.  The file
           may not actually be updated until msync(2)  or  mun=E2=80=90
           map() is called.

   I believe the piece "or munmap()" is misleading. It implies
   that munmap() must trigger a sync action. I don't think this
   is true. All that it is required to do is remove some range
   of pages from the process's virtual address space. I'm
   inclined to remove those words, but I'd like to see if any
   FS person has a correction to my understanding first.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
