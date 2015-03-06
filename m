From: Dave Chinner <david-FqsqvQoI3Ljby3iVrkZq2A@public.gmane.org>
Subject: Re: Documenting RENAME_WHITEOUT
Date: Sat, 7 Mar 2015 08:44:57 +1100
Message-ID: <20150306214457.GC13958@dastard>
References: <CAKgNAkiog0S5kHYNb_4+d2ZXcA-nPw-cBsuNG03AyEPt3K34nw@mail.gmail.com>
 <20150306161145.GA13649@tucsk.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150306161145.GA13649-YynjPCA0bi1olqkO4TVVkw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Miklos Szeredi <miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Mar 06, 2015 at 05:11:45PM +0100, Miklos Szeredi wrote:
> On Thu, Jan 29, 2015 at 11:01:08AM +0100, Michael Kerrisk (man-pages) wrote:
> > Hi Miklos,
> > 
> > I just noticed that your RENAME_WHITEOUT flag went into Linux 3.18:
> > commit 0d7a855526dd672e114aff2ac22b60fc6f155b08
> > commit 787fb6bc9682ec7c05fb5d9561b57100fbc1cc41
> > 
> > Would you be willing to write some text for the rename(2)/renameat2(2)
> > man page that described this flag. In that text it would be great to
> > have an explanation of what a whiteout is and why they are useful.
> 
> Hi Michael,
> 
> Sorry for the delay...
> 
>   RENAME_WHITEOUT is a special operation, that only makes sense for
>   overlay/union type filesystem implementations.  Currently it is used
>   internally by the overlay filesystem.

However, it is exposed to userspace by renameat2, and filesystem
developers still need to know it's exact semantics documented so
they can implement it.

>   Specifying RENAME_WHITEOUT will create a "whiteout" object at the source of
>   the rename at the same time as performing the rename.  The whole operation is
>   still atomic, so if the rename succeeds then the whiteout will also have been
>   created.
> 
>   A "whiteout" is an object that has special meaning in union/overlay type file
>   system constructs, in these constructs multiple layers exists and only the top
>   one is ever modified.  A whiteout on an upper layer will effectively hide the
>   matching file on the lower layer, making it appear if the file didn't exist.
> 
>   When a file that exists on the lower layer is renamed, the file is first
>   copied up (if not already on the upper layer) and then renamed on the upper,
>   read-write layer.  At the same time the source file needs to be "whiteouted".
>   The whole operation needs to be done atomically.

This doesn't explain exactly what the RENAME_WHITEOUT operation is
supposed to do. It explains how overlayfs uses them, not the
semantics and behaviour of RENAME_WHITEOUT. e.g. source
restrictions, target restrictions, can you RENAME_WHITEOUT over
another whiteout, etc. I've noticed these restrictions are very
different from other rename operations, but I don't know whether
that is ext4 implementation bugs or intentional because there is no
documentation or regression tests in xfstests for it...

Cheers,

Dave.
-- 
Dave Chinner
david-FqsqvQoI3Ljby3iVrkZq2A@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
