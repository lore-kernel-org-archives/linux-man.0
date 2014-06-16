From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] [RFC] xfs: wire up aio_fsync method
Date: Mon, 16 Jun 2014 23:06:55 +0200
Message-ID: <539F5C6F.4060402@gmail.com>
References: <1402562047-31276-1-git-send-email-david@fromorbit.com> <20140612141329.GA11676@infradead.org> <20140612234441.GT9508@dastard> <20140613162352.GB23394@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140613162352.GB23394-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dave Chinner <david-FqsqvQoI3Ljby3iVrkZq2A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xfs-VZNHf3L845pBDgjK7y7TUQ@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Christoph,

On 06/13/2014 06:23 PM, Christoph Hellwig wrote:

> Talking about documentation:  The kernel aio manpages (io_*.2) seems
> to not really be very useful, mostly because they don't explain how
> to set up the iocbs.  Michael, any idea how to get started to improve
> this?

Well, it just needs someone knowledgeable to fill the gaps, and
perhaps add an example program. I don't have that knowledge 
offhand myself...

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
