From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH] fsync_range, was: Re: munmap, msync: synchronization
Date: Thu, 24 Apr 2014 11:34:31 +0200
Message-ID: <5358DAA7.9090000@gmail.com>
References: <5353A158.9050009@gmx.de> <5354F00E.8050609@gmail.com> <20140421181431.GA17125@infradead.org> <53557768.5070905@gmail.com> <20140421213418.GH30215@jl-vm1.vm.bytemark.co.uk> <20140422060320.GA21241@infradead.org> <20140422070421.GI30215@jl-vm1.vm.bytemark.co.uk> <20140422092837.GA6191@infradead.org> <5357CF22.2090900@gmail.com> <20140423154550.GA21014@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20140423154550.GA21014@infradead.org>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Christoph Hellwig <hch@infradead.org>
Cc: mtk.manpages@gmail.com, Jamie Lokier <jamie@shareable.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, linux-man@vger.kernel.org, Dave Chinner <david@fromorbit.com>, Theodore T'so <tytso@mit.edu>, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, Miklos Szeredi <miklos@szeredi.hu>
List-Id: linux-man@vger.kernel.org

Oops -- I see that I forgot to attach the test program in my last
mail. Appended below, now.)

On 04/23/2014 05:45 PM, Christoph Hellwig wrote:
> On Wed, Apr 23, 2014 at 04:33:06PM +0200, Michael Kerrisk (man-pages) wrote:
>> # Take journaling and atime out of the equation:
>>
>> $ sudo umount /dev/sdb6
>> $ sudo tune2fs -O ^has_journal /dev/sdb6$ 
>> [sudo] password for mtk: 
>> tune2fs 1.42.8 (20-Jun-2013)
>> $ sudo mount -o norelatime,strictatime /dev/sdb6 /testfs
> 
> The second strictatime argument overrides the earlier norelatime,
> so you put it into the picture.

Oh -- have I misunderstood something? I was wanting classical behavior:
atime always updated (but only synced to disk by FILESYNC). Is that not
what I should get with norelatime+strictatime?

>> But I have a question:
>>
>> When I precreate a 10MB file, and repeat the tests (this time with 
>> 100 loops), I no longer see any significant difference between 
>> FFILESYNC and FDATASYNC. What am I missing? Sample runs here, 
>> though I did the tests repeatedly with broadly similar results 
>> each time:
> 
> Not sure.  Do you also see this on other filesystems?

=======

So, here's some results from XFS:

# 1000 loops. 1MB file, 1MB fsync_range()
# As with ext4, FDATASYNC is faster than FFILESYNC (as expected)

$ sudo umount /dev/sdb6; sudo mount -o norelatime,strictatime /dev/sdb6 /testfs
$ time ./t_fsync_range /testfs/f 1000 0 1000000 f 0 1000000
fsync_range(3, 0x20, 0, 1000000)
Performed 16000 writes
Performed 1000 sync operations

real	0m52.264s
user	0m0.018s
sys	0m0.926s
$ sudo umount /dev/sdb6; sudo mount -o norelatime,strictatime /dev/sdb6 /testfs
$ time ./t_fsync_range /testfs/f 1000 0 1000000 d 0 1000000
fsync_range(3, 0x10, 0, 1000000)
Performed 16000 writes
Performed 1000 sync operations

real	0m33.689s
user	0m0.002s
sys	0m0.915s

# (Note that I did not disable XFS journalling--it's not possible to
# do so, right?)

====

# 100 loops, 100MB file, 100MB fsync_range()
# FDATASYNC and FFIFLESYNC times are again similar

$ time ./t_fsync_range /testfs/f 100 0 100000000 f 0 100000000
fsync_range(3, 0x20, 0, 100000000)
Performed 152600 writes
Performed 100 sync operations

real	4m45.257s
user	0m0.004s
sys	0m5.607s

$ time ./t_fsync_range /testfs/f 100 0 100000000 d 0 100000000
fsync_range(3, 0x10, 0, 100000000)
Performed 152600 writes
Performed 100 sync operations

real	4m43.925s
user	0m0.010s
sys	0m3.824s

# Again, the same pattern: no difference between FFILESYNC and FDATASYNC

=====
On JFS, I get

1000 loops, 1MB file, 1MB fsync_range, FFILESYNC:
* Quite a lot of variability (11.3 to 16.5 secs)
1000 loops, 1MB file, 1MB fsync_range, FDATASYNC:
* Quite a lot of variability (8.6 to 10.9 secs)
==> FDATASYNC is on average faster than FFILESYNC

100 loops, 100 MB file, 100MB fsync_range, FFILESYNC:
281 seconds (just a single test)
100 loops, 100 MB file, 100MB fsync_range, FDATASYNC:
280 seconds (just a single test)

So, again, it seems like for a large file sync, there's no difference between
FFILESYNC and FDATASYNC

>> Add another question: is there any piece of sync_file_range() 
>> functionality that could or should be incorporated in this API?
> 
> I don't think so.  sync_file_range is a complete mess and impossible
> to use correctly for data integrity operations.  Especially the whole
> notion that submitting I/O and waiting for it are separate operations
> is incompatible with a data integrity call.

Okay -- I just thought it worth checking.

Cheers,

Michael

========
#define _GNU_SOURCE
#include <unistd.h>
#include <sys/syscall.h>
#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define errExit(msg) 	do { perror(msg); exit(EXIT_FAILURE); \
			} while (0)

/* flags for fsync_range */
#define FDATASYNC	0x0010
#define FFILESYNC	0x0020

#define SYS_fsync_range 317

static int
fsync_range(unsigned int fd, int how, loff_t start, loff_t length)
{
    return syscall(SYS_fsync_range, fd, how, start, length);
}

#define BUF_SIZE 65536
static char buf[BUF_SIZE];

int
main(int argc, char *argv[])
{
    int j, fd, nloops, how;
    size_t writeLen, syncLen, wlen;
    size_t bufSize;
    off_t writeOffset, syncOffset;
    int scnt, wcnt;

    if (argc != 8 || strcmp(argv[1], "--help") == 0) {
        fprintf(stderr, "%s pathname nloops write-offset write-length {f|d} "
	        "sync-offset sync-len\n", argv[0]);
	exit(EXIT_SUCCESS);
    }

    fd = open(argv[1], O_RDWR | O_CREAT, S_IRUSR | S_IWUSR);
    if (fd == -1)
	errExit("read");

    nloops = atoi(argv[2]);
    writeOffset = atoi(argv[3]);
    writeLen = atoi(argv[4]);
    how = (argv[5][0] == 'd') ? FDATASYNC :
	  (argv[5][0] == 'f') ? FFILESYNC : 0;
    syncOffset = atoi(argv[6]);
    syncLen = atoi(argv[7]);

    if (how != 0)
        fprintf(stderr, "fsync_range(%d, 0x%x, %lld, %zd)\n",
	        fd, how, (long long) syncOffset, syncLen);

    scnt = 0;
    wcnt = 0;

    for (j = 0; j < nloops; j++) {
	memset(buf, j % 256, BUF_SIZE);
	if (lseek(fd, writeOffset, SEEK_SET) == -1)
	    errExit("lseek");

	wlen = writeLen;
        while (wlen > 0) {
            bufSize = (wlen > BUF_SIZE) ? BUF_SIZE : wlen;
	    wlen -= bufSize;
    
	    if (write(fd, buf, bufSize) != bufSize) {
	        fprintf(stderr, "Write failed\n");
	        exit(EXIT_FAILURE);
	    }

	    wcnt++;
        }

	if (how != 0) {
	    scnt++;
	    if (fsync_range(fd, how, syncOffset, syncLen) == -1)
	        errExit("fsync_range");
	}
    }

    fprintf(stderr, "Performed %d writes\n", wcnt);
    fprintf(stderr, "Performed %d sync operations\n", scnt);
    exit(EXIT_SUCCESS);
}



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
