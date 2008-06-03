From: Al Viro <viro-3bDd1+5oDREiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Subject: Re: [PATCH] utimensat() non-conformances and fixes [v3]
Date: Tue, 3 Jun 2008 13:08:50 +0100
Message-ID: <20080603120850.GZ28946@ZenIV.linux.org.uk>
References: <E1Jx3Gw-0002eA-55@pomaz-ex.szeredi.hu> <48401E7E.9090304@gmail.com> <cfd18e0f0806030405u1c32b114pa0fdd979f36f87fb@mail.gmail.com> <E1K3URo-0005sj-JW@pomaz-ex.szeredi.hu> <20080603112221.GW28946@ZenIV.linux.org.uk> <cfd18e0f0806030427p22a274dev746e1656662f34f6@mail.gmail.com> <20080603113018.GA27955@shareable.org> <cfd18e0f0806030439n5a11fa4aocd6251ffab66b6dd@mail.gmail.com> <20080603114921.GX28946@ZenIV.linux.org.uk> <20080603120135.GA28905@shareable.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20080603120135.GA28905-yetKDKU6eevNLxjTenLetw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Miklos Szeredi <miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org>, drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, Jun 03, 2008 at 01:01:35PM +0100, Jamie Lokier wrote:
> > with a lot of things, starting with "why utimes(2) has weaker requirements
> > with NULL argument", but we are far too late to fix that.
> 
> To be fair, having a writable file descriptor only lets you change the
> mtime to "now", and having a readable file descriptor only lets you
> change the atime to "now".
> 
> Changing the times _in general_ can be seen as over-reaching those
> capabilities and arguably justifies more strict checks.

Which is what all questions about writability apply only to NULL case
anyway...
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
