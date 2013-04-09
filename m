From: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch] open.2: Fix up incorrect O_DIRECT aligment information
Date: Tue, 09 Apr 2013 12:11:01 -0400
Message-ID: <x49fvyzznu2.fsf@segfault.boston.devel.redhat.com>
References: <x49ip4bzb6c.fsf@segfault.boston.devel.redhat.com>
	<CAKgNAkhqnRaZbY+1+bXHCRz5My8y+Ady1zotQ9JU+GNjwAL7NQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkhqnRaZbY+1+bXHCRz5My8y+Ady1zotQ9JU+GNjwAL7NQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Michael Kerrisk's message of "Tue, 9 Apr 2013 16:18:22 +0200")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

"Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> Jeff,
>
> On Thu, Mar 28, 2013 at 6:28 PM, Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> Hi,
>>
>> The alignment text for O_DIRECT is slightly misleading:
>>
>>        Under  Linux  2.4, transfer sizes, and the alignment of the user buffer
>>        and the file offset must all be multiples of the logical block size  of
>>        the  file  system.   Under  Linux 2.6, alignment to 512-byte boundaries
>>        suffices.
>>
>> The last sentence is incorrect.  You cannot perform O_DIRECT I/O in
>> sizes smaller than the underlying logical block size (for block devices
>> and block-based file systems; nfs is a different beast).  I've attached
>> my proposed change.  Comments and word-smithing are most welcome.
>
> Could you provide some detail on how you determined, verified, or
> tested this detail? I'm not saying you're wrong, but that text has
> been there a long time (since before I was maintainer), in the days
> when there was no VCS and changelog. It's even possible that I sent
> the patch to Andries that added this piece, since I have an idea that
> I tested this detail on Linux 2.6 at some point in the distant past.
> Indeed, I just now did a (very) quick test using an old program that
> suggest that you can do O_DIRECT I/O with block sizes smaller than the
> LBS.

Details on the test?

Devices do not accept I/O that is smaller than a single addressable
logical block.  Thus, you cannot perform direct I/O in sizes smaller
than that (there is no read-modify-write in O_DIRECT).  The code that
enforces the limitation is in fs/direct-io.c:

static inline ssize_t
do_blockdev_direct_IO(int rw, struct kiocb *iocb, struct inode *inode,
        struct block_device *bdev, const struct iovec *iov, loff_t
        offset,
        unsigned long nr_segs, get_block_t get_block, dio_iodone_t
        end_io,
        dio_submit_t submit_io, int flags)
{
...
        unsigned i_blkbits = ACCESS_ONCE(inode->i_blkbits);
        unsigned blkbits = i_blkbits;
        unsigned blocksize_mask = (1 << blkbits) - 1;
        ssize_t retval = -EINVAL;
...
        if (offset & blocksize_mask) { // offset is not a multiple of the file system block size
                if (bdev)
                        blkbits = blksize_bits(bdev_logical_block_size(bdev));
                blocksize_mask = (1 << blkbits) - 1;
                if (offset & blocksize_mask)
                        goto out; // offset is not a multiple of the logical block size
        }

	// and the check is done for the address and length of each segment:

       /* Check the memory alignment.  Blocks cannot straddle pages */
        for (seg = 0; seg < nr_segs; seg++) {
                addr = (unsigned long)iov[seg].iov_base;
                size = iov[seg].iov_len;
                end += size;
                if (unlikely((addr & blocksize_mask) ||
                             (size & blocksize_mask))) {
                        if (bdev)
                                blkbits = blksize_bits(
                                         bdev_logical_block_size(bdev));
                        blocksize_mask = (1 << blkbits) - 1;
                        if ((addr & blocksize_mask) || (size & blocksize_mask))
                                goto out;
                }
        }

...
out:
	return retval;
}

Cheers,
Jeff
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
