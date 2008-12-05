From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: [PATCH] man3/getaddrinfo.3: Document results ordering and
	/etc/gai.conf
Date: Fri, 5 Dec 2008 18:15:06 +0100
Message-ID: <20081205171506.GT10491@machine.or.cz>
References: <20081204232200.GG10491@machine.or.cz> <cfd18e0f0812050909o3556a118p25138870a3745ad8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f0812050909o3556a118p25138870a3745ad8-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

  Hi,

On Fri, Dec 05, 2008 at 12:09:44PM -0500, Michael Kerrisk wrote:
> Hi Petr,
> 
> On Thu, Dec 4, 2008 at 6:22 PM, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org> wrote:
> > This patch documents the order of the getaddrinfo(3) results (RFC 3484), how
> > should the application deal with that, mentions the extremely common cause of
> > having multiple results per query (both IPv4 and IPv6 addresses available)
> > and mentions /etc/gai.conf.
> 
> Thanks for this!  I've applied this for 3.15, but with tweaks as noted below.

  thanks! (Purely out of curiosity, how often do you push out your git
tree? Only on releases?)

> > @@ -293,15 +295,26 @@ and returns a pointer to the start of the list in
> >  The items in the linked list are linked by the
> >  .I ai_next
> >  field.
> > +.PP
> 
> This change is not relevant to the subject of the patch, and unneeded.  Dropped.

  I simply think that with the addition, the whole paragraph is too big
and hard to read. But this is of course matter of personal preference.

> >  There are several reasons why
> >  the linked list may have more than one
> >  .I addrinfo
> > -structure, including: the network host is multi-homed; or the same service
> > -is available from multiple socket protocols (one
> > +structure, including: the network host is multi-homed, accessible
> > +over multiple protocols (e.g. both
> > +.BR AF_INET
> > +and
> > +.BR AF_INET6 );
> > +or the same service is available from multiple socket types (one
> >  .B SOCK_STREAM
> >  address and another
> >  .B SOCK_DGRAM
> > -address, for example).
> > +address, for example).  Normally, the application should try
> 
> My preference (see man-pages(7) is to start new sentences on new line.
>  This is because (later) diffs at least sometimes operate at the
> sentence level.

  Thanks, I did not actually read man-pages(7) yet, I will do that.

> > +using the addresses in the order they are returned in.
> > +The sorting function used within
> > +.BR getaddrinfo ()
> > +is defined in RFC\ 3484; the order can be tweaked for a particular
> > +system by editing
> > +.IR /etc/gai.conf .
> 
> Here, it is good to mention the glibc version that first started
> supporting gai.conf.  It looks like it was 2.5, and I've added that
> information.

  Yes, glibc-2.5 introduced this.

-- 
				Petr "Pasky" Baudis
People who take cold baths never have rheumatism, but they have
cold baths.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
