From: Dave Chinner <david@fromorbit.com>
Subject: Re: [PATCH] [RFC] xfs: wire up aio_fsync method
Date: Mon, 16 Jun 2014 08:33:23 +1000
Message-ID: <20140615223323.GB9508@dastard>
References: <1402562047-31276-1-git-send-email-david@fromorbit.com>
 <20140612141329.GA11676@infradead.org>
 <20140612234441.GT9508@dastard>
 <20140613162352.GB23394@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140613162352.GB23394@infradead.org>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Christoph Hellwig <hch@infradead.org>
Cc: xfs@oss.sgi.com, linux-fsdevel@vger.kernel.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On Fri, Jun 13, 2014 at 09:23:52AM -0700, Christoph Hellwig wrote:
> On Fri, Jun 13, 2014 at 09:44:41AM +1000, Dave Chinner wrote:
> > On Thu, Jun 12, 2014 at 07:13:29AM -0700, Christoph Hellwig wrote:
> > > There doesn't really seem anything XFS specific here, so instead
> > > of wiring up ->aio_fsync I'd implement IOCB_CMD_FSYNC in fs/aio.c
> > > based on the workqueue and ->fsync.
> > 
> > I really don't know whether the other ->fsync methods in other
> > filesystems can stand alone like that. I also don't have the
> > time to test that it works properly on all filesystems right now.
> 
> Of course they can, as shown by various calls to vfs_fsync_range that
> is nothing but a small wrapper around ->fsync.

Sure, but that's not getting 10,000 concurrent callers, is it? And
some fsync methods require journal credits, and others serialise
completely, and so on.

Besides, putting an *unbound, highly concurrent* aio queue into the
kernel for an operation that can serialise the entire filesystem
seems like a pretty nasty user-level DOS vector to me.

> I'm pretty sure if you
> Cc linux-fsdevel you'll find plenty of testers.  -fsdevel and -man
> should get a Cc anyway when implementing an ABI that had it's constants
> defines but never was implemented properly.

When the userspace ABIs are already fully documented and *just
work*, I'm not sure that there's any need for an ABI or man page
discussion...

> Talking about documentation:  The kernel aio manpages (io_*.2) seems
> to not really be very useful, mostly because they don't explain how
> to set up the iocbs.  Michael, any idea how to get started to improve
> this?

$ man 3 io_prep_fsync

or, perhaps you just need to use:

$ man 3 io_fsync

Which does all the prep and submission for you. Yup, I used those
man pages to write the fs_mark modifications....

> > Also, doing this implementation in fs/aio.c would mean we can't
> > optimise it to reduce things like log forces by splitting up the
> > work of concurrent fsyncs into a single log force of the highest
> > LSN of the batch of fsyncs being run. We also want to be able to do
> > "background fsync" where latency doesn't matter and we only want to
> > trickle them out rather than issue them as fast as we possibly can.
> 
> It didn't really sound like you were aiming for that.  But in that
> case the current implementation is still useful as a
> generic_file_aio_fsync as suggested by Brian.

It's an RFC - I'm not proposing it as is, but merely posting it to
see what people think about the approach and where to take it from
the. This is not production ready code, nor is it something we
should implement generically as it stands because of things like the
DOS potential it has.

> > So I really don't see this as the infrastructure solution that
> > everyone uses. It could be made a generic method with the filesystem
> > passing the workqueue to use to generic_aio_fsync(), but for XFS I
> > see it turning into something much more complex and optimised...
> 
> Why not have a common workqueue?  In fact we already have a common
> workqueue to call ->fsync from aio code to implement aio O_SYNC anyway.

Maybe a generic solution will eventually, but this isn't an RFC for
a generic solution to the aio_fsync() hook...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
