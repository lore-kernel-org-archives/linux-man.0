From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: munmap, msync: synchronization
Date: Mon, 21 Apr 2014 23:03:20 -0700
Message-ID: <20140422060320.GA21241@infradead.org>
References: <5353A158.9050009@gmx.de>
 <5354F00E.8050609@gmail.com>
 <20140421181431.GA17125@infradead.org>
 <53557768.5070905@gmail.com>
 <20140421213418.GH30215@jl-vm1.vm.bytemark.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140421213418.GH30215-DqlFc3psUjeg7Qil/0GVWOc42C6kRsbE@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dave Chinner <david-FqsqvQoI3Ljby3iVrkZq2A@public.gmane.org>, Theodore T'so <tytso-3s7WtUTddSA@public.gmane.org>, Linux-Fsdevel <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Miklos Szeredi <miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Apr 21, 2014 at 10:34:18PM +0100, Jamie Lokier wrote:
> A ranged-fdatasync, for databases with little logs inside the big data
> file, would be nice.  AIX, NetBSD and FreeBSD all have one :) Any
> likelihood of that ever appearing in Linux?  sync_file_range() comes
> with its Warning in the man page which basically means "don't trust me
> unless you know the filesystem exactly".

We have the infrastructure for range fsync and fdatasync in the kernel,
it's just not exposed.  Given that you've already done the research
how about you send a patch to wire it up?  Do the above implementations
at least agree on an API for it?

sync_file_range() unfortunately only writes out pagecache data and never
the needed metadata to actually find it.  While we could multiplex a
range fsync over it that seems to be very confusing (and would be more
complicated than just adding new syscalls)

> Then there's this, about Linux NFS incoherency with msync() and O_DIRECT:
> 
>     - https://groups.google.com/d/msg/comp.os.linux.development.apps/B49Rej6KV24/xEouZOVXs9gJ

That mail is utterly confused.  Yes, NFS has less coherency than normal
filesystems (google for close to open), but msync actually does it's
proper job on NFS.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
