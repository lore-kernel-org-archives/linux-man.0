From: Andre Majorel <aym-xunil-Bi/FLWfhfolQFI55V6+gNQ@public.gmane.org>
Subject: BLKGETSIZE64 not documented
Date: Fri, 17 Jan 2014 10:30:29 +0100
Message-ID: <20140117093029.GA29966@aym.net2.nerim.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

[Re-sending this as it seems to have fallen through the cracks.]

No trace of BLKGETSIZE64 in
www.kernel.org/pub/linux/docs/man-pages/man-pages-3.54.tar.xz

I think it should be listed along BLKGETSIZE in sd(4).

Probably applies to fd(4) and hd(4) too.

And of course ioctl_list(2) but completing _that_ one sounds
like a major project in itself. <g>

Note that /usr/include/linux/fs.h quotes the argument as being
"*u64" but I believe that it would be better written as
"*uint64_t", which is standard.

There may be other related ioctl()s missing, like those used in
blockdev(8), I'm reporting the one I'm sure about.

Thanks in advance.

--=20
Andr=E9 Majorel http://www.teaser.fr/~amajorel/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
