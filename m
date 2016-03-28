From: Al Viro <viro-3bDd1+5oDREiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Subject: Re: open(2) manpage and O_NONBLOCK
Date: Mon, 28 Mar 2016 05:08:45 +0100
Message-ID: <20160328040845.GT17997@ZenIV.linux.org.uk>
References: <20160321202347.GG1612@cork>
 <CAKgNAkiLsw5c_Q+EknRijgeJGNvQ_R6HxdgA=YhBgcXsbv+mpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkiLsw5c_Q+EknRijgeJGNvQ_R6HxdgA=YhBgcXsbv+mpQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?iso-8859-1?Q?J=F6rn?= Engel <joern-BHEL68pLQRGGvPXPguhicg@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Mar 28, 2016 at 04:58:33PM +1300, Michael Kerrisk (man-pages) wrote:
> > blocking memory allocation:
> >         f = kmem_cache_zalloc(filp_cachep, GFP_KERNEL);
> 
> For how long might this block, though?

Not much, usually.  Finding the file, though, can bloody well take a _long_
time - put it behind an automount from a slow server and we might be easily
talking about minutes, if not longer.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
