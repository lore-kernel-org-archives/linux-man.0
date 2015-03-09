From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: Handling of updates to kernel Documentation/ tree
Date: Mon, 9 Mar 2015 09:05:20 -0700
Message-ID: <20150309160520.GA28067@infradead.org>
References: <3421611.4D45Q2BAys@tauon>
 <20150309150739.GA6131@infradead.org>
 <54FDC468.40503@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54FDC468.40503-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>, Michael Kerrisk <michael.kerrisk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Mar 09, 2015 at 05:03:52PM +0100, Michael Kerrisk (man-pages) wrote:
> Actually, a lot of man pages do refer to kernel Documentation files.
> What's the problem?

It's not easily accessibe and coherent information.  It requires a
checked out kernel tree (or a web mirror these days), which might
be a different version than you expect.  Referencing actually installed
case documentation like man page or at least info pages is a lot easier
for the user.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
