From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [Acl-devel] Moving attr(5) man page to man-pages
Date: Wed, 22 Apr 2015 05:19:43 -0700
Message-ID: <20150422121943.GA11481@infradead.org>
References: <5537620E.3000601@gmail.com>
 <CAHpGcM+OcP1=z6KmcfqQX2L7TcFyQuQaNHphMim77zNQ_5TqYQ@mail.gmail.com>
 <55378CD2.7060408@gmail.com>
 <CAHpGcMLQPmz3-Wh3oRbx=pqdJDr6GHmRqbfR3vEedfZajFZ1nQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAHpGcMLQPmz3-Wh3oRbx=pqdJDr6GHmRqbfR3vEedfZajFZ1nQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas Gr??nbacher <agruen-mXXj517/zsQ@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, acl-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Apr 22, 2015 at 02:16:15PM +0200, Andreas Gr??nbacher wrote:
> > Hmm... some light testing (using XFS) suggests that one can create
> > more than 64 kB of attribute names, but then listxattr() fails
> > with E2BIG. That seems like a sad corner case :-(.
> 
> That's what will happen, yes. I don't have a good idea how to fix this.

We could use the same iterator style for listxattr as we do for readdir.
For XFS that would be really easy as the code is already internally
structured like that.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
