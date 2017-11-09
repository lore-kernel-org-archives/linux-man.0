From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] readv.2: document RWF_NOWAIT
Date: Thu, 9 Nov 2017 16:01:34 +0100
Message-ID: <20171109150133.GA25025@lst.de>
References: <20171029084023.8463-1-hch@lst.de> <20171029094106.GA15945@bombadil.infradead.org> <CAKgNAkhbNxpKLcO8aGS0rid2iZSUi76NY7e5WTh1BmY7NNcKWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkhbNxpKLcO8aGS0rid2iZSUi76NY7e5WTh1BmY7NNcKWA@mail.gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@lst.de>, linux-man <linux-man@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Milosz Tanski <milosz@adfin.com>
List-Id: linux-man@vger.kernel.org

On Thu, Nov 09, 2017 at 02:40:38PM +0100, Michael Kerrisk (man-pages) wrote:
> > The phrasing is a bit tortured ... try this:
> >
> > .TP
> > .BR RWF_NOWAIT " (since Linux 4.14)"
> > Do not wait for data which is not immediately available.
> > If this flag is specified the
> > .BR preadv2 ()
> > system call will return instantly if it would have to read data from
> > the backing storage or wait for a lock.
> > If some data was successfully read, it will return the number of bytes read.
> > If no bytes were read, it will return -1 and set
> > .IR errno to
> > .BR EAGAIN .
> > This flag is meaningful only for
> > .BR preadv2 ()
> > at the moment.
> > .\" commit 3239d834847627b6634a4139cf1dc58f6f137a46
> > .\" commit 91f9943e1c7b6638f27312d03fe71fcc67b23571
> 
> What are your thoughts on Matthew's proposed rewording?

The look good to me.  I'll try to find some time to respin the patch
with them incorporated.
