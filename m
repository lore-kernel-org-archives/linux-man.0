From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH] fts.3 is not available in LFS builds
Date: Sun, 16 Mar 2014 10:22:19 -0700
Message-ID: <20140316172219.GA16900@infradead.org>
References: <20140315135416.GA10430@infradead.org>
 <CAKgNAkgqXUf0yWaXyAD7yBJgivp9Jmwvz4EAnh_DpyActuoGwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkgqXUf0yWaXyAD7yBJgivp9Jmwvz4EAnh_DpyActuoGwA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sat, Mar 15, 2014 at 03:47:26PM +0100, Michael Kerrisk (man-pages) wrote:
> >  4.4BSD.
> > +.SH BUGS
> > +All the APIs described in this manpage are not safe when compiling
> 
> Should this perhaps better read "not safe on 32-bit systems"?

Well, it works:

 a) on a 32-it system if _FILE_OFFSET_BITS is 32 (currently the default)
 b) on any 64-bit system

Not sure what the best langauge is to communicate this issue to the
user.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
