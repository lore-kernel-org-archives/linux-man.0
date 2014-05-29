From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: RES_DEBUG needs DEBUG (was: [PATCH] host.conf(5): order option
 deprecated)
Date: Thu, 29 May 2014 12:41:27 +0200
Message-ID: <20140529104127.GI13900@mraw.org>
References: <1355073222-13020-1-git-send-email-spaillard@debian.org>
 <CAKgNAkixQ7=9EQdbM_1EQJsDq=3gWV6eYwuk0DDc3UUL8YmtYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkixQ7=9EQdbM_1EQJsDq=3gWV6eYwuk0DDc3UUL8YmtYw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Aug 09, 2013 at 10:40:04AM +0200, Michael Kerrisk (man-pages) wrote:
> So, from the references you've given, and from a little bit of code
> spelunking, it looks like the change took place in glibc 2.5. I'd much
> prefer a patch that preserved the glibc <= 2.4 info, and noted that
> "order" is ignored in glibc >= 2.5. See some notes below.
> 
> 
> On Sun, Dec 9, 2012 at 6:13 PM, Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrote:
[...]
> > diff --git a/man5/resolv.conf.5 b/man5/resolv.conf.5
> > index 9a3ca54..282f748 100644
> > --- a/man5/resolv.conf.5
> > +++ b/man5/resolv.conf.5
> > @@ -134,6 +134,7 @@ sets
> >  .BR RES_DEBUG
> >  in
> >  .IR _res.options .
> > +This option needs glibc to be build with debugging enabled.
> 
> Where did this piece come from? It seems to be unrelated?

It is unrelated, but still applicable.

http://codesearch.debian.net/search?q=RES_DEBUG
(links 404, unless you replace 2.18-[5-6] with 2.18-7)

Almost all tests using the RES_DEBUG are in "#ifdef DEBUG" sections 

I'll provide a separate patch.

-- 
Simon Paillard
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
