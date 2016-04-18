From: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 0/7] Improve support for compressed man pages
Date: Mon, 18 Apr 2016 19:10:26 +0200
Message-ID: <20160418191026.7fa8c669.alex.miller@gmx.de>
References: <20160416022503.1df762cb.alex.miller@gmx.de>
	<20160416045058.GS6588@vapier.lan>
	<20160416183013.352f4ba6.alex.miller@gmx.de>
	<5714D9D2.8050501@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5714D9D2.8050501-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, 18 Apr 2016 13:57:54 +0100 Michael Kerrisk wrote:

> On 04/16/2016 05:30 PM, Alexander Miller wrote:
> > On Sat, 16 Apr 2016 00:50:58 -0400
> > Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> >   
> >> imo, we should just drop all compression support.  distros already
> >> handle this properly and pick whatever they want/need.  
> > 
[...]
> > 
> > We can drop compression support or do it right - I'm fine with
> > either option. We shouldn't keep the status quo, though.  
> 
> I'm inclined to say drop it. Would you mind putting together a 
> patch, Alex?

I'm not sure what exactly we should do.
The problem isn't really compressing the files, but the "screen"
and "uninstall" targets.

If we drop support for compressing man pages ourselves, what shall
we do with those targets? They aren't useful for distros either.
And they *still* might have to deal with files compressed by the
distro's package manager (if a user tries to update manually).
We could
- drop "screen" and/or "uninstall", too
  (getting rid of the problem and simplifying the Makefile but
  being inconvenient for users);
- fix them to handle man pages compressed by the distro
  (but not compressed sources, resulting in only slightly simpler
  patches than those I've posted);
- or explicitly state "screen" (and maybe "uninstall") don't support
  compressed files. This is problematic IMO, especially since they
  are used by "make all". Moreover, "uninstall" can remove .gz/.bz2
  files but no .xz files right now; this could be changed to include
  .xz or to exclude .gz/.bz2.
  
What do you want me to drop/fix with a new patch?

Alex 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
