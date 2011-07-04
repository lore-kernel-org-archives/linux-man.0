From: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH/RFC] resolver_r.3: New page documenting res_ninit() et al
Date: Mon, 4 Jul 2011 04:37:19 -0500
Message-ID: <20110704093719.GB25520@elie>
References: <20110704051737.GA15844@elie>
 <20110704053331.GA16153@elie>
 <CACKs7VCC_gkVEeci+ctTQ-H+YPsErN9cWb-CczvVUW5pG3zmDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACKs7VCC_gkVEeci+ctTQ-H+YPsErN9cWb-CczvVUW5pG3zmDw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Kettenis <mark.kettenis-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Martin Ferrari <tincho-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Robert Edmonds <edmonds-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

Stefan Puiu wrote:

> IIRC bind 8 (or libbind) also comes with its own manpages.

libbind does.  Good find; not sure how I missed that.

> Ages ago I
> stole the info from their resolver.3 page and merged it with the page
> distributed with glibc (the current version is taken from there as
> well, IIRC). The patch got somehow lost through the cracks, I think...
>
> Or do you see any licensing issues with doing that?

libbind's manpages are permissively (ISC) licensed and so pretty much
hassle-free to reuse.  Could you send a link or other pointer (e.g.,
message-id) to your patch?

> OTOH, if you want to keep your approach and add another page for the
> reentrant functions, you might want to add a pointer in resolver.3 so
> people know there's another page as well :).

I snuck in a link in the SEE ALSO section.  If you have ideas for
where to broach the subject elsewhere (maybe in the paragraph
discussing _res?), I'd be happy to take them. :)

Thanks for looking it over.
Jonathan
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
