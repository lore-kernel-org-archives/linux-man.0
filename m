From: Miklos Szeredi <miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org>
Subject: Re: [PATCH] utimensat() non-conformances and fixes [v3]
Date: Tue, 03 Jun 2008 13:13:00 +0200
Message-ID: <E1K3URo-0005sj-JW@pomaz-ex.szeredi.hu>
References: <482D4665.4050401@gmail.com>
	 <E1Jx3Gw-0002eA-55@pomaz-ex.szeredi.hu> <48401E7E.9090304@gmail.com> <cfd18e0f0806030405u1c32b114pa0fdd979f36f87fb@mail.gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <cfd18e0f0806030405u1c32b114pa0fdd979f36f87fb-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org)
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
Cc: miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org, drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

> > I'm not sure of the correct way to get the required nameidata (to do a
> > vfs_permission() call) from the file descriptor.  Can you give me a
> > tip there?
> 
> Could you point me at the right way of doing this?

You don't need nameidata for this at all.  Just call permission() with
a NULL nameidata.

Ugly API?  Yes, will be cleaned up if we manage to find some common
ground with the VFS maintainers.

Miklos
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
