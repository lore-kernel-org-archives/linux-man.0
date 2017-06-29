From: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ioctl_userfaultfd.2: update uffdio_api.features
 description
Date: Thu, 29 Jun 2017 14:16:22 +0300
Message-ID: <20170629111621.GC24911@rapoport-lnx>
References: <1498653003-25227-1-git-send-email-rppt@linux.vnet.ibm.com>
 <20170628141112.GI7050@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170628141112.GI7050-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Dr. David Alan Gilbert" <dgilbert-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Jun 28, 2017 at 04:11:12PM +0200, Andrea Arcangeli wrote:
> On Wed, Jun 28, 2017 at 03:30:03PM +0300, Mike Rapoport wrote:
> 
> On a side note, as mentioned some time ago, if UFFDIO_API returns
> -EINVAL the uffdio_api userland structure gets clobbered with zeros by
> the kernel purely for robustness. So the "features" field is to be
> considered a meaningful output, only if UFFDIO_API ioctl succeeds and
> returns 0.

That reminded me that there was a bunch of comments from Andrea a while
ago [1]...

Michael, can you please review that thread?

If you need any help from my side, don't hesitate to ping me.
 
> Thanks,
> Andrea
> 

[1] https://lkml.org/lkml/2017/5/3/594

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
