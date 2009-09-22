From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: Re: sync_file_range.2: add some big WARNINGS
Date: Tue, 22 Sep 2009 13:40:52 +0200
Message-ID: <20090922114052.GA1521@lst.de>
References: <20090827180116.GB31605@lst.de> <cfd18e0f0909192234l57ad4ec0rda34dcb83e355c5e@mail.gmail.com> <20090921131519.875b4608.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090921131519.875b4608.akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, hch-jcswGhMUV9g@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Sep 21, 2009 at 01:15:19PM -0700, Andrew Morton wrote:
> The syscall is all about dirty memory management and userspace control
> over IO timing/volume.  Trying to use it for data integrity purposes is a
> bit perverse.

Yes, its is.  But that needs to be clearly documented.  If you have
better wording to make it crystal clear you're welcome.

Additionally I have a half-backed patch to allow it calling into ->fsync
to actually make it usable as a fdatasync_range/fsync_range, but I
wonder if we should just add those as syscalls instead.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
