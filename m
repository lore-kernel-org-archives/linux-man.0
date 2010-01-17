From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: Re: sync_file_range.2: add some big WARNINGS
Date: Sun, 17 Jan 2010 10:58:05 +0100
Message-ID: <20100117095804.GA16882@lst.de>
References: <20090827180116.GB31605@lst.de> <20100109144910.GA30167@lst.de> <cfd18e0f1001162148w78c3ebe8u9d54fdeb7dac8892@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f1001162148w78c3ebe8u9d54fdeb7dac8892-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, Jan 17, 2010 at 06:48:03PM +1300, Michael Kerrisk wrote:
> Hi Christoph,
> 
> On Sun, Jan 10, 2010 at 3:49 AM, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org> wrote:
> > Are you going to put this or some equivalent note in? ? Currently the
> > manpages is extremly dangerous as it doesn't warn people about this
> > system call not actually guaranteeing any data integrity.
> 
> I lightly edited your patch, and applied it. Sorry for the long delay.

Thanks a lot!

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
