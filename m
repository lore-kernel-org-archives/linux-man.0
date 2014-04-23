From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH] fsync_range, was: Re: munmap, msync: synchronization
Date: Wed, 23 Apr 2014 16:33:06 +0200
Message-ID: <5357CF22.2090900@gmail.com>
References: <5353A158.9050009@gmx.de> <5354F00E.8050609@gmail.com> <20140421181431.GA17125@infradead.org> <53557768.5070905@gmail.com> <20140421213418.GH30215@jl-vm1.vm.bytemark.co.uk> <20140422060320.GA21241@infradead.org> <20140422070421.GI30215@jl-vm1.vm.bytemark.co.uk> <20140422092837.GA6191@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20140422092837.GA6191@infradead.org>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Christoph Hellwig <hch@infradead.org>, Jamie Lokier <jamie@shareable.org>
Cc: mtk.manpages@gmail.com, Heinrich Schuchardt <xypron.glpk@gmx.de>, linux-man@vger.kernel.org, Dave Chinner <david@fromorbit.com>, Theodore T'so <tytso@mit.edu>, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, Miklos Szeredi <miklos@szeredi.hu>
List-Id: linux-man@vger.kernel.org

On 04/22/2014 11:28 AM, Christoph Hellwig wrote:
> On Tue, Apr 22, 2014 at 08:04:21AM +0100, Jamie Lokier wrote:
>> Hi Christoph,
>>
>> Hardly research, I just did a quick Google and was surprised to find
>> some results.  AIX API differs from the BSDs; the BSDs seem to agree
>> with each other. fsync_range(), with a flag parameter saying what type
>> of sync, and whether it flushes the storage device write cache as well
>> (because they couldn't agree that was good - similar to the barriers
>> debate).
> 
> There is no FreeBSD implementation, I think you were confused by FreeBSD
> also hosting NetBSD man pages on their site, just as I initially was.
> 
> The APIs are mostly the same, except that AIX reuses O_ flags as
> argument and NetBSD has a separate namespace.  Following the latter
> seems more sensible, and also allows developer to define the separate
> name to the O_ flag for portability.
> 
>> As for me doing it, no, sorry, I haven't touched the kernel in a few
>> years, life's been complicated for non-technical reasons, and I don't
>> have time to get back into it now.
> 
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
> 
>  2) I don't implement the FDISKSYNC.  Requiring it is utterly broken,
>     and we wouldn't even have the infrastructure for it.  It might make
>     sense to provide it defined to 0 so that we have the identifier but
>     make it a no-op.
> 
>> In the kernel, I was always under the impression the simple part of
>> fsync_range - writing out data pages - was solved years ago, but being
>> sure the filesystem's updated its metadata in the proper way, that
>> begs for a little research into what filesystems do when asked,
>> doesn't it?
> 
> The filesystems I care about handle it fine, and while I don't know
> the details of others they better handle it properly, given that we
> use vfs_fsync_range to implement O_SNYC/O_DSYNC writes and commits
> from the nfs server.

The functionality sounds like it would be worthwhile. I've applied the
patch against 3.15-rc2, and employed the test program below, with test 
files on standard laptop HDD (ext4). The test program repeatedly
a) overwrites a specified region of a file
b) does an fsync_range() on a specified range of the file (need not be 
   the same region that was written).

The CLI is crude, but the arguments are:

1: pathname
2: number of loops
3: Starting point for writes each time round loop
4: Length of region to write
5: Either 'f' for  or 'd' for FDATASYNC
6: start offset for fsync_range()
7: length for fsync_range()

It seems that the patch does roughly what it says on the tin:

# Precreate a 1MB file

$ sync; time ./t_fsync_range /testfs/f 100 0 1000000 d 0 1000000^C
$ dd of=/testfs/f bs=1000 count=1000 if=/dev/full
1000+0 records in
1000+0 records out
1000000 bytes (1.0 MB) copied, 0.00575843 s, 174 MB/s

# Take journaling and atime out of the equation:

$ sudo umount /dev/sdb6
$ sudo tune2fs -O ^has_journal /dev/sdb6$ 
[sudo] password for mtk: 
tune2fs 1.42.8 (20-Jun-2013)
$ sudo mount -o norelatime,strictatime /dev/sdb6 /testfs

# Filesystem unmounted and remounted (with above options) before 
# each of the following tests

===

# 1000 loops, writing 1 MB, syncing entire 1MB range, with FFILESYNC:

$ time ./t_fsync_range /testfs/f 1000 0 1000000 f 0 1000000
fsync_range(3, 0x20, 0, 1000000)
Performed 16000 writes
Performed 1000 sync operations

real	0m10.677s
user	0m0.011s
sys	0m0.816s


# 1000 loops, writing 1MB, syncing entire 1MB range, with FDATASYNC:
# (Takes less time, as expected)

$ time ./t_fsync_range /testfs/f 1000 0 1000000 d 0 1000000
fsync_range(3, 0x10, 0, 1000000)
Performed 16000 writes
Performed 1000 sync operations

real	0m8.685s
user	0m0.017s
sys	0m0.825s

===

# 1000 loops, writing 1 MB, syncing just 100kB, with FFILESYNC:
# (Take less time than syncing entire 1MB range, as expected)

$ time ./t_fsync_range /testfs/f 1000 0 1000000 f 0 100000
fsync_range(3, 0x20, 0, 100000)
Performed 16000 writes
Performed 1000 sync operations

real	0m1.501s
user	0m0.005s
sys	0m0.339s

# 1000 loops, writing 1 MB, syncing just 10kB, with FFILESYNC:

$ time ./t_fsync_range /testfs/f 1000 0 1000000 f 0 10000
fsync_range(3, 0x20, 0, 10000)
Performed 16000 writes
Performed 1000 sync operations

real	0m0.616s
user	0m0.004s
sys	0m0.240s

=======

But I have a question:

When I precreate a 10MB file, and repeat the tests (this time with 
100 loops), I no longer see any significant difference between 
FFILESYNC and FDATASYNC. What am I missing? Sample runs here, 
though I did the tests repeatedly with broadly similar results 
each time:

#FFILESYNC

$ time ./t_fsync_range /testfs/f 100 0 10000000 f 0 10000000
fsync_range(3, 0x20, 0, 10000000)
Performed 15300 writes
Performed 100 sync operations

real	0m17.575s
user	0m0.001s
sys	0m0.656s

# FDATASYNC

$ time ./t_fsync_range /testfs/f 100 0 10000000 d 0 10000000
fsync_range(3, 0x10, 0, 10000000)
Performed 15300 writes
Performed 100 sync operations

real	0m17.228s
user	0m0.005s
sys	0m0.624s

======

Add another question: is there any piece of sync_file_range() 
functionality that could or should be incorporated in this API?

======

Tested-by: Michael Kerrisk <mtk.manpages@gmail.com>

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
