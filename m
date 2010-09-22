From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: Proposal: block(4)
Date: Wed, 22 Sep 2010 09:57:02 -0400
Message-ID: <20100922135702.GA19439@infradead.org>
References: <AANLkTin_m9n=X6k2S-8pDA_B6Z3sMt5ifYUjUG5wd_ab@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTin_m9n=X6k2S-8pDA_B6Z3sMt5ifYUjUG5wd_ab-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Robson <markxr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, Sep 12, 2010 at 03:51:56PM +0100, Mark Robson wrote:
> Hi,
> 
> Looking at the sd(4) man page, there appear to be some BLK* ioctls
> documented, but these don't really belong here, as some of them apply to all
> block devices.
> 
> Should the common functions of a block device appear on a new page, block(4)
> and refer to hd(4), sd(4), ram(4) etc as necessary?
> 
> I would create one if there was some interest.

Yes, please do.  Besides the completely generic ioctls implemented in
blkdev_ioctl it would also be good to have a manpage for the "generic
scsi" ioctls in scsi_cmd_ioctl.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
