From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH] utimensat() non-conformances and fixes [v3]
Date: Tue, 3 Jun 2008 12:22:21 +0100
Message-ID: <20080603112221.GW28946@ZenIV.linux.org.uk>
References: <482D4665.4050401@gmail.com> <E1Jx3Gw-0002eA-55@pomaz-ex.szeredi.hu> <48401E7E.9090304@gmail.com> <cfd18e0f0806030405u1c32b114pa0fdd979f36f87fb@mail.gmail.com> <E1K3URo-0005sj-JW@pomaz-ex.szeredi.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E1K3URo-0005sj-JW@pomaz-ex.szeredi.hu>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: mtk.manpages@googlemail.com, drepper@redhat.com, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-man@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On Tue, Jun 03, 2008 at 01:13:00PM +0200, Miklos Szeredi wrote:
> > > I'm not sure of the correct way to get the required nameidata (to do a
> > > vfs_permission() call) from the file descriptor.  Can you give me a
> > > tip there?
> > 
> > Could you point me at the right way of doing this?
> 
> You don't need nameidata for this at all.  Just call permission() with
> a NULL nameidata.
> 
> Ugly API?  Yes, will be cleaned up if we manage to find some common
> ground with the VFS maintainers.

As soon as I'm done with sysctls...

FWIW, I very much doubt that you are right wrt required permissions, though.
AFAICS, intent here is "if you can write to file, you can touch the timestamps
anyway" and having descriptor opened for write gives that, current permissions
be damned.
