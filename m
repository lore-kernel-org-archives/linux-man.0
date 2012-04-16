From: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH/RFC 0/6] ld.so.8: some improvements from Debian
Date: Mon, 16 Apr 2012 13:23:00 -0500
Message-ID: <20120416182259.GW5813@burratino>
References: <20111020070037.GA11392@elie.hsd1.il.comcast.net>
 <CAKgNAkgbcL3deJ4x0DEV==vtiAmYie7+Gw+c=K_dAJhWE4va1Q@mail.gmail.com>
 <20120416165806.GR5813@burratino>
 <CAKgNAkj0BAKbP6SrohCEG+eeEAZAYkJ6NA9Jvi0hS2j3e19mmg@mail.gmail.com>
 <20120416172408.GT5813@burratino>
 <CAKgNAkggZ1EZyBkkkd4xmJnjt-_kw=F_xb81+--gpQztvyD8oA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkggZ1EZyBkkkd4xmJnjt-_kw=F_xb81+--gpQztvyD8oA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Petr Baudis <pasky-+ZI9xUNit7I@public.gmane.org>, Aurelien Jarno <aurelien-rXXEIb44qovR7s880joybQ@public.gmane.org>, Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Michael Kerrisk (man-pages) wrote:

> IIUC, your purpose is to allow Debian to drop downstream ld.so.8, by
> ensuring that upstream ld.so.8 has everything that useful from the
> downstream (purpose 1). Along the way, you also saw places where the
> upstream page could be further improved with *new* material (purpose
> 2). Right? What I'm saying is, please keep a good separation between
> those two purposes in your patch. Simplest would be a series of
> patches that dealt with purpose 1, followed by another series for
> purpose 2. Does that make sense?

Yeah, that makes more sense.  I don't remember the details any more,
but my intent was always only purpose #1.  I do remember there being
places where Debian and upstream differed and both seemed wrong, where
I went my own way.

Anyway, I will definitely try to follow the guideline you have
suggested above.  Thanks for your help.

Jonathan
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
