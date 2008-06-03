From: Miklos Szeredi <miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org>
Subject: Re: [PATCH] utimensat() non-conformances and fixes [v3]
Date: Tue, 03 Jun 2008 14:16:33 +0200
Message-ID: <E1K3VRJ-00065P-Pq@pomaz-ex.szeredi.hu>
References: <482D4665.4050401@gmail.com> <E1Jx3Gw-0002eA-55@pomaz-ex.szeredi.hu> <48401E7E.9090304@gmail.com> <cfd18e0f0806030405u1c32b114pa0fdd979f36f87fb@mail.gmail.com> <E1K3URo-0005sj-JW@pomaz-ex.szeredi.hu> <20080603112221.GW28946@ZenIV.linux.org.uk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20080603112221.GW28946-3bDd1+5oDREiFSDQTTA3OLVCufUGDwFn@public.gmane.org> (message from Al Viro
	on Tue, 3 Jun 2008 12:22:21 +0100)
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: viro-3bDd1+5oDREiFSDQTTA3OLVCufUGDwFn@public.gmane.org
Cc: miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org, mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

> > > > I'm not sure of the correct way to get the required nameidata (to do a
> > > > vfs_permission() call) from the file descriptor.  Can you give me a
> > > > tip there?
> > > 
> > > Could you point me at the right way of doing this?
> > 
> > You don't need nameidata for this at all.  Just call permission() with
> > a NULL nameidata.
> > 
> > Ugly API?  Yes, will be cleaned up if we manage to find some common
> > ground with the VFS maintainers.
> 
> As soon as I'm done with sysctls...

Can't you just do that independently (for now just put a
d_find_alias() in there and be done with it)?  If you fix every piece
of horrid code that you come across, it'll never be done...

Miklos
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
