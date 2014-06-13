From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] [RFC] xfs: wire up aio_fsync method
Date: Fri, 13 Jun 2014 09:23:52 -0700
Message-ID: <20140613162352.GB23394@infradead.org>
References: <1402562047-31276-1-git-send-email-david@fromorbit.com>
	<20140612141329.GA11676@infradead.org>
	<20140612234441.GT9508@dastard>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <xfs-bounces@oss.sgi.com>
Content-Disposition: inline
In-Reply-To: <20140612234441.GT9508@dastard>
List-Unsubscribe: <http://oss.sgi.com/mailman/options/xfs>,
	<mailto:xfs-request@oss.sgi.com?subject=unsubscribe>
List-Archive: <http://oss.sgi.com/pipermail/xfs>
List-Post: <mailto:xfs@oss.sgi.com>
List-Help: <mailto:xfs-request@oss.sgi.com?subject=help>
List-Subscribe: <http://oss.sgi.com/mailman/listinfo/xfs>,
	<mailto:xfs-request@oss.sgi.com?subject=subscribe>
Errors-To: xfs-bounces@oss.sgi.com
Sender: xfs-bounces@oss.sgi.com
To: Dave Chinner <david@fromorbit.com>
Cc: linux-fsdevel@vger.kernel.org, linux-man@vger.kernel.org, xfs@oss.sgi.com
List-Id: linux-man@vger.kernel.org

On Fri, Jun 13, 2014 at 09:44:41AM +1000, Dave Chinner wrote:
> On Thu, Jun 12, 2014 at 07:13:29AM -0700, Christoph Hellwig wrote:
> > There doesn't really seem anything XFS specific here, so instead
> > of wiring up ->aio_fsync I'd implement IOCB_CMD_FSYNC in fs/aio.c
> > based on the workqueue and ->fsync.
> 
> I really don't know whether the other ->fsync methods in other
> filesystems can stand alone like that. I also don't have the
> time to test that it works properly on all filesystems right now.

Of course they can, as shown by various calls to vfs_fsync_range that
is nothing but a small wrapper around ->fsync.  I'm pretty sure if you
Cc linux-fsdevel you'll find plenty of testers.  -fsdevel and -man
should get a Cc anyway when implementing an ABI that had it's constants
defines but never was implemented properly.

Talking about documentation:  The kernel aio manpages (io_*.2) seems
to not really be very useful, mostly because they don't explain how
to set up the iocbs.  Michael, any idea how to get started to improve
this?

> Also, doing this implementation in fs/aio.c would mean we can't
> optimise it to reduce things like log forces by splitting up the
> work of concurrent fsyncs into a single log force of the highest
> LSN of the batch of fsyncs being run. We also want to be able to do
> "background fsync" where latency doesn't matter and we only want to
> trickle them out rather than issue them as fast as we possibly can.

It didn't really sound like you were aiming for that.  But in that
case the current implementation is still useful as a
generic_file_aio_fsync as suggested by Brian.

> So I really don't see this as the infrastructure solution that
> everyone uses. It could be made a generic method with the filesystem
> passing the workqueue to use to generic_aio_fsync(), but for XFS I
> see it turning into something much more complex and optimised...

Why not have a common workqueue?  In fact we already have a common
workqueue to call ->fsync from aio code to implement aio O_SYNC anyway.

_______________________________________________
xfs mailing list
xfs@oss.sgi.com
http://oss.sgi.com/mailman/listinfo/xfs
