From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [PATCH] utimensat() non-conformances and fixes [v3]
Date: Tue, 3 Jun 2008 12:30:18 +0100
Message-ID: <20080603113018.GA27955@shareable.org>
References: <482D4665.4050401@gmail.com> <E1Jx3Gw-0002eA-55@pomaz-ex.szeredi.hu> <48401E7E.9090304@gmail.com> <cfd18e0f0806030405u1c32b114pa0fdd979f36f87fb@mail.gmail.com> <E1K3URo-0005sj-JW@pomaz-ex.szeredi.hu> <20080603112221.GW28946@ZenIV.linux.org.uk> <cfd18e0f0806030427p22a274dev746e1656662f34f6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f0806030427p22a274dev746e1656662f34f6@mail.gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Michael Kerrisk <mtk.manpages@googlemail.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Miklos Szeredi <miklos@szeredi.hu>, drepper@redhat.com, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-man@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Michael Kerrisk wrote:
> > FWIW, I very much doubt that you are right wrt required
> > permissions, though.  AFAICS, intent here is "if you can write to
> > file, you can touch the timestamps anyway" and having descriptor
> > opened for write gives that, current permissions be damned.
> 
> The standard is pretty clear on this point:
> 
> [[
> Only a process with the effective user ID equal to the user ID of the
> file, or with write access to the file, or with appropriate privileges
> may use futimens( ) or utimensat( ) with a null pointer as the times
> argument or with both tv_nsec fields set to the special value
> UTIME_NOW.
> ]]
> 
> The crucial words here are "a process ... with write access to the
> file" -- in other words, the permissions are determined by the
> process's credentials, not by the access mode of the file descriptor.
> I was not 100% sure on that to start with, so I did check it out with
> one of the folk at The Open Group, to make sure of my understanding.

Is there anything else where the file descriptor's access mode allows
doing things on Linux, but the standard requires a permissions check
each time?

-- Jamie
