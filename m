From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: [PATCH] nscd.8: Correct NOTES section on reloading
	configuration files
Date: Sat, 6 Dec 2008 11:26:16 +0100
Message-ID: <20081206102616.GA10491@machine.or.cz>
References: <20081205231738.GU10491@machine.or.cz> <cfd18e0f0812051549o3d1d2273j8577bb0c69d71a58@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f0812051549o3d1d2273j8577bb0c69d71a58-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

  Hi,

On Fri, Dec 05, 2008 at 06:49:09PM -0500, Michael Kerrisk wrote:
> On Fri, Dec 5, 2008 at 6:17 PM, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org> wrote:
> > The original notes were obsolete, current nscd watches changes in
> > config files.
> 
> Can you provide some supporting information here.  Pointers to
> relevant sources, or email threads.

  nscd/connections.c, git log nscd/connections.c. ;-)

> I think what I'm really meaning
> is: could you write a nice changelog entry for this patch.  Also, my
> reading of the patch is that you are changing the page because glibc
> changed at a certain point.  If this is the case, it would be good to
> note in which glibc version the change occurred, and then it would be
> better to rewrite the page to describe old and new behaviors, rather
> than just dropping the text that describes the old behavior.  Do you
> see what I mean?

  It behaved this way at least since "Sun Oct 18 15:02:11 1998 +0000",
some four months after including the nscd implementation in glibc. But
there does seem to be a short window between glibc-2.1 and glibc-2.1.3
when nscd -i was not available, I don't think it's worth muddling the
point of the page with that, though.

-- 
				Petr "Pasky" Baudis
People who take cold baths never have rheumatism, but they have
cold baths.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
