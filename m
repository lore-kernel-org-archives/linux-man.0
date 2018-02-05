From: Karel Zak <kzak-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] tmpfs(5): document current mount options
Date: Mon, 5 Feb 2018 10:43:52 +0100
Message-ID: <20180205094352.tphbanrjsf5zp5jn@ws.net.home>
References: <20180127095928.6294-1-vapier@gentoo.org>
 <d92fae63-5d6a-56ea-1a69-973bee77395c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <d92fae63-5d6a-56ea-1a69-973bee77395c-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, Feb 04, 2018 at 10:03:28AM +0100, Michael Kerrisk (man-pages) wrote:
> On 01/27/2018 10:59 AM, Mike Frysinger wrote:
> > Some of this content is moved from the mount(8) man page.
> > Style was based on proc(5) sections.
> 
> Thanks. I've applied this. I also added some further details for the
> 'mpol' and 'huge' options, largely drawn from kernel Documentation
> files. Could you take a quick look at that new content?
> 
> Is there any other text for mount(8) that should be imported to
> tmpfs(5)?

It would be nice to completely remove filesystem specific stuff from
mount(8). It's already done for filesystems with active community
(like extN, XFS, etc), but the rest... ;-)

And another idea... what about to add a generic filesystem(5) (or
section 7) man page to explain why we have filesystems, relation with
mkfs programs, block devices, mount(8) ?

    Karel

-- 
 Karel Zak  <kzak-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
 http://karelzak.blogspot.com
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
