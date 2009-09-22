From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: Re: [PATCH] open.2: add some comments on O_SYNC and friends
Date: Tue, 22 Sep 2009 13:42:51 +0200
Message-ID: <20090922114251.GB1521@lst.de>
References: <20090827180004.GA31605@lst.de> <cfd18e0f0909192241y5b45aa79u305f1e8e3295aea9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f0909192241y5b45aa79u305f1e8e3295aea9-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, Sep 20, 2009 at 07:41:34AM +0200, Michael Kerrisk wrote:
> > -data is guaranteed to have been transferred.
> > +File I/O is done directly to/from user space buffers. ?The
> > +\fBO_DIRECT\fP flag alone does make at an effort to transfer
> > +data synchronously, but does not give the guarantees of the
> > +\fBO_SYNC\fP that data and nessecary data must be transferred.
> 
> Here I wrote "data and necessary metadata".
> Okay?

Yes.

> > ?POSIX provides for three different variants of synchronized I/O,
> > ?corresponding to the flags \fBO_SYNC\fP, \fBO_DSYNC\fP and
> > -\fBO_RSYNC\fP.
> > -Currently (2.1.130) these are all synonymous under Linux.
> > +\fBO_RSYNC\fP. ?Currently (2.6.31) Linux only implements the
> > +\fBO_SYNC\fP but glibc maps \fBO_DSYNC\fP and \fBO_SYNC\fP to
> > +the same numerical value.
> 
> Here, I made it
> 
>     but glibc maps O_DSYNC and O_RSYNC to
>     the same numerical value as O_SYNC.
> 
> Okay?

Yes, again much better than my version.

> Aside from the changes notes above, and some language clean-ups, I
> applied your patch as given, for man-pages-3.23.

Thanks a lot.  Note that in the meantime I sent patches to implement
real O_SYNC/O_DSYNC and I'll send you another update once they get
applied.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
