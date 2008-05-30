From: Miklos Szeredi <miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org>
Subject: Re: [PATCH] utimensat() non-conformances and fixes [v3]
Date: Fri, 30 May 2008 22:08:20 +0200
Message-ID: <E1K2Atg-0002io-0v@pomaz-ex.szeredi.hu>
References: <482D4665.4050401@gmail.com> <E1Jx3Gw-0002eA-55@pomaz-ex.szeredi.hu> <48401E7E.9090304@gmail.com> <E1K27bZ-0002Gk-3b@pomaz-ex.szeredi.hu> <cfd18e0f0805301124o5f217dden10726b268d05d81a@mail.gmail.com> <E1K2ABK-0002ck-UT@pomaz-ex.szeredi.hu> <20080530193207.GB28074@parisc-linux.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20080530193207.GB28074-6jwH94ZQLHl74goWV3ctuw@public.gmane.org> (message from Matthew
	Wilcox on Fri, 30 May 2008 13:32:07 -0600)
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: matthew-Ztpu424NOJ8@public.gmane.org
Cc: miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org, mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

> > For 2) you can just use permission() instead of vfs_permission() which
> > is exactly the same in this case (and consolidated into a common
> > function later in the vfs-cleanups tree).
> 
> Miklos, don't delude people into thinking the vfs-cleanups tree is ever
> going to get merged in its current state.  Al's NAKed the path_* stuff,
> Christoph's NAKed it too.

Actually, the cleanup patches which I'm asking Michael to base his
patches on were not NAKed.

And Michael is not even working against the vfs-cleanups tree, but
rather just a couple of these utimes cleanup patches, none of which
are controversial like the path_* stuff.  But even if he was working
against the vfs-cleanups tree it wouldn't matter, since porting
patches to/from the path_* API is trivial.

>  Ignoring them and putting up a VFS tree of your own is not going to
> help matters.

Do please tell me how else should I work?  I post patches for review,
gradually, not as a 100 patch series, when we manage to submit
apparmor.  That far easier for people to handle, and sure enough I get
comments are testing for this stuff.

As for Al's NAK: the only alternative suggestion he has been able to
come up is to move the security hooks into callers.  And that has been
NAKed (not surprisingly) by the selinux folks.  And there's nothing
actually _wrong_ with those patches, they don't add complexity
(actually they remove complexity), they don't slow down the kernel,
and they even fix some bugs.  Now what the hell more do we need?

Thanks,
Miklos
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
