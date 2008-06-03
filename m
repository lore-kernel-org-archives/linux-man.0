From: Al Viro <viro-3bDd1+5oDREiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Subject: Re: [PATCH] utimensat() non-conformances and fixes [v3]
Date: Tue, 3 Jun 2008 12:58:01 +0100
Message-ID: <20080603115801.GY28946@ZenIV.linux.org.uk>
References: <482D4665.4050401@gmail.com> <E1Jx3Gw-0002eA-55@pomaz-ex.szeredi.hu> <48401E7E.9090304@gmail.com> <cfd18e0f0806030405u1c32b114pa0fdd979f36f87fb@mail.gmail.com> <E1K3URo-0005sj-JW@pomaz-ex.szeredi.hu> <20080603112221.GW28946@ZenIV.linux.org.uk> <cfd18e0f0806030427p22a274dev746e1656662f34f6@mail.gmail.com> <20080603113018.GA27955@shareable.org> <cfd18e0f0806030439n5a11fa4aocd6251ffab66b6dd@mail.gmail.com> <20080603114921.GX28946@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20080603114921.GX28946-3bDd1+5oDREiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>, Miklos Szeredi <miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org>, drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, Jun 03, 2008 at 12:49:21PM +0100, Al Viro wrote:
> On Tue, Jun 03, 2008 at 01:39:07PM +0200, Michael Kerrisk wrote:
> 
> > > Is there anything else where the file descriptor's access mode allows
> > > doing things on Linux, but the standard requires a permissions check
> > > each time?
> > 
> > Jamie,
> > 
> > I can't think of examples offhand -- but I'm also not quite sure what
> > your question is about.  Could you say a little more?
> 
> "Is anything else equally stupid?", I suspect...  AFAICS, behaviour in
> question is inherited from futimes(2) in one of the *BSD - nothing to
> do about that now (at least 10 years too late).  It's rather inconsistent
> with a lot of things, starting with "why utimes(2) has weaker requirements
> with NULL argument", but we are far too late to fix that.

PS: as far as I can reconstruct what had happened there, they've got
these checks buried directly in ufs_setattr() and its ilk, which worked
for utimes(2), but had bitten them when they tried to do descriptor-based
analog...
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
