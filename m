From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH] fsync_range, was: Re: munmap, msync: synchronization
Date: Thu, 24 Apr 2014 23:07:34 -0700
Message-ID: <20140425060734.GB30486@infradead.org>
References: <5354F00E.8050609@gmail.com>
 <20140421181431.GA17125@infradead.org>
 <53557768.5070905@gmail.com>
 <20140421213418.GH30215@jl-vm1.vm.bytemark.co.uk>
 <20140422060320.GA21241@infradead.org>
 <20140422070421.GI30215@jl-vm1.vm.bytemark.co.uk>
 <20140422092837.GA6191@infradead.org>
 <5357CF22.2090900@gmail.com>
 <20140423154550.GA21014@infradead.org>
 <20140423222011.GM30215@jl-vm1.vm.bytemark.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140423222011.GM30215-DqlFc3psUjeg7Qil/0GVWOc42C6kRsbE@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>
Cc: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dave Chinner <david-FqsqvQoI3Ljby3iVrkZq2A@public.gmane.org>, Theodore T'so <tytso-3s7WtUTddSA@public.gmane.org>, Linux-Fsdevel <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Miklos Szeredi <miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Apr 23, 2014 at 11:20:11PM +0100, Jamie Lokier wrote:
> I guess it's also to give the application a way to nudge a preferred
> asynchronous writeback order, prior to a synchronous wait.  If the
> application knows there's a lot of dirty data being generated over
> time prior to needing a short fdatasync, it might see it as beneficial
> to tell the kernel to start writing that data sooner, so the fdatasync
> delay will be shorter.

If they want to do an async writeback pass first they can just use
sync_file_range for it, that's the only thing it's actually useful for.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
