From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: Handling of updates to kernel Documentation/ tree
Date: Tue, 10 Mar 2015 07:11:04 -0700
Message-ID: <20150310141104.GA17228@infradead.org>
References: <3421611.4D45Q2BAys@tauon>
 <20150309150739.GA6131@infradead.org>
 <20150309174057.GC12857@vapier>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150309174057.GC12857@vapier>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>, Michael Kerrisk <michael.kerrisk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Mar 09, 2015 at 01:40:57PM -0400, Mike Frysinger wrote:
> > Referencing a kernel Documentation file from a man page sounds like
> > a bad idea to me.  Why can't we include a nroff-yfied version of the
> > content in the man-pages repository?
> 
> isn't that way worse ?  now we have to keep the man pages git repo in sync with 
> the kernel Documentation/ subtree.

The content really should not change that much for public APIs.

> i think having the man pages refer to the public docbook kernel.org pages should 
> be fine.

Pointing to kernel.org posted html renderings sounds perfectly fine to
me.  The reference to files inside a kernel source tree is what I object
to.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
