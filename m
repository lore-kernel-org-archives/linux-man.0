From: chrubis-AlSwsSmVLrQ@public.gmane.org
Subject: Re: [PATCH] statfs.2: Update + Note for pipe() fds
Date: Tue, 10 Jun 2014 23:29:40 +0200
Message-ID: <20140610212940.GA22111@rei.Home>
References: <20140610160416.GA20354@rei.Home>
 <53976A4D.1010501@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53976A4D.1010501-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi!
> > * Update MAGIC constants, most of them are taken from
> >   /usr/include/linux/magic.h, some were found by grepping Linux source.
> > 
> > * Add note about fstatfs(2) broken on fd from pipe(2) between
> >   2.6.38 and 3.2
> 
> I moved that patch piece to a (new) BUGS section.
> 
> Looking at the following:
> 
> $ git describe --contains ff0c7d15f9787b7e8c601533c01529
> v2.6.38-rc1~60^2~30
> $ git describe --contains d70ef97baf048412c395bb5d65791d
> v3.2-rc1~108^2~56
> 
> The breakage was from 2.6.38 to 3.1, right? (3.2 fixed things.)
> I reworded a little.

Ah, right. Sorry for the off by one mistake.

> And I just want to check. Was it really ff0c7d15f9787b7e8c601533c01529
> that caused the breakage? At a quick glance, that patch looks
> unrelated, but perhaps something very subtle is going on...

Yep, it took me a while to notice. If you pass NULL as super_operations
to mount_pseudo() function, which was the case before the patch, default
structure super_operations (with contains only simple_statfs) is used
(have a look at mount_pseudo() in fs/libfs.c). This patch added
pipefs_ops without the statfs callback and passed it instead of the
NULL.

-- 
Cyril Hrubis
chrubis-AlSwsSmVLrQ@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
