From: Matthew Wilcox <willy@linux.intel.com>
Subject: Re: munmap, msync: synchronization
Date: Wed, 23 Apr 2014 10:03:08 -0400
Message-ID: <20140423140308.GC13050@linux.intel.com>
References: <5353A158.9050009@gmx.de>
 <5354F00E.8050609@gmail.com>
 <20140421181431.GA17125@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140421181431.GA17125@infradead.org>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Christoph Hellwig <hch@infradead.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>, linux-man@vger.kernel.org, Dave Chinner <david@fromorbit.com>, Theodore T'so <tytso@mit.edu>, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, jamie@shareable.org
List-Id: linux-man@vger.kernel.org

On Mon, Apr 21, 2014 at 11:14:31AM -0700, Christoph Hellwig wrote:
> > 6. On Linux, MS_ASYNC is also a no-op. That's fine on a unified 
> >    cache system. Filesystem I/O always sees a consistent view,
> >    and MS_ASYNC never undertook to give a guarantee about *when*
> >    the update would occur. (The Linux buffer cache logic will 
> >    ensure that it is flushed out sometime in the near future.)
> 
> Right.  It's a fairly inefficient noop, though - it actually loops
> over all vmas to do nothing with them.

This will probably change for Persistent Memory.  The reason it
works today is that we have a page cache which tracks dirty bits and
periodically writes dirty pages to storage.  If we bypass the page cache,
we have to ensure that everything does still eventually get synced.

I don't quite know how this is going to work yet ... I have a number of
ideas in my head.  It probably won't be asynchronous though!

> > 7. On Linux (and probably many other modern systems), the only
> >    call that has any real use is msync(MS_SYNC), meaning
> >    "flush the buffers *now*, and I want to wait for that to 
> >    complete, so that I can then continue safe in the knowledge
> >    that my data has landed on a device". That's useful if we
> >    want insurance for our data in the event of a system crash.
> 
> Right.  It's basically another way to call fsync, which is used to
> implement it underneath.  It actually should be a ranged-fdatasync
> but right it's it's implemented horribly inefficiently in that it
> does a fsync call for each vma that it encounters in the range
> specified.

See also: 

From: Matthew Wilcox <matthew.r.wilcox@intel.com>
To: linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
Cc: Matthew Wilcox <matthew.r.wilcox@intel.com>, willy@linux.intel.com
Subject: [PATCH] Sync only the requested range in msync
Date: Thu, 27 Mar 2014 19:02:41 -0400
Message-Id: <1395961361-21307-1-git-send-email-matthew.r.wilcox@intel.com>

