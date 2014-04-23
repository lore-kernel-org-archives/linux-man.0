From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] fsync_range, was: Re: munmap, msync: synchronization
Date: Wed, 23 Apr 2014 08:45:50 -0700
Message-ID: <20140423154550.GA21014@infradead.org>
References: <5353A158.9050009@gmx.de>
 <5354F00E.8050609@gmail.com>
 <20140421181431.GA17125@infradead.org>
 <53557768.5070905@gmail.com>
 <20140421213418.GH30215@jl-vm1.vm.bytemark.co.uk>
 <20140422060320.GA21241@infradead.org>
 <20140422070421.GI30215@jl-vm1.vm.bytemark.co.uk>
 <20140422092837.GA6191@infradead.org>
 <5357CF22.2090900@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5357CF22.2090900@gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, Jamie Lokier <jamie@shareable.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, linux-man@vger.kernel.org, Dave Chinner <david@fromorbit.com>, Theodore T'so <tytso@mit.edu>, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, Miklos Szeredi <miklos@szeredi.hu>
List-Id: linux-man@vger.kernel.org

On Wed, Apr 23, 2014 at 04:33:06PM +0200, Michael Kerrisk (man-pages) wrote:
> # Take journaling and atime out of the equation:
> 
> $ sudo umount /dev/sdb6
> $ sudo tune2fs -O ^has_journal /dev/sdb6$ 
> [sudo] password for mtk: 
> tune2fs 1.42.8 (20-Jun-2013)
> $ sudo mount -o norelatime,strictatime /dev/sdb6 /testfs

The second strictatime argument overrides the earlier norelatime,
so you put it into the picture.

> 
> But I have a question:
> 
> When I precreate a 10MB file, and repeat the tests (this time with 
> 100 loops), I no longer see any significant difference between 
> FFILESYNC and FDATASYNC. What am I missing? Sample runs here, 
> though I did the tests repeatedly with broadly similar results 
> each time:

Not sure.  Do you also see this on other filesystems?

> Add another question: is there any piece of sync_file_range() 
> functionality that could or should be incorporated in this API?

I don't think so.  sync_file_range is a complete mess and impossible
to use correctly for data integrity operations.  Especially the whole
notion that submitting I/O and waiting for it are separate operations
is incompatible with a data integrity call.

