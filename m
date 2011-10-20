From: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH/RFC 0/6] ld.so.8: some improvements from Debian
Date: Thu, 20 Oct 2011 02:01:01 -0500
Message-ID: <20111020070037.GA11392@elie.hsd1.il.comcast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>, Aurelien Jarno <aurelien-rXXEIb44qovR7s880joybQ@public.gmane.org>, Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

I would like to see Debian using the ld.so(8) page from the man-pages
project instead of its own custom copy, so people making improvements
to that documentation would not need to choose which to contribute to.
Here are some changes that might make it easier to use the upstream
ld.so.8 as a drop-in replacement.

I have tried to be very conservative, when in doubt matching what is
in Debian's libc-bin package.  Some comments on this in the mails with
each patch.

Anyway, some of these seem to me like good improvements to the page
regardless.  What do you think?

Jonathan Nieder (6):
  ld.so.8: clarify synopsis
  ld.so.8: move important information toward the top
  ld.so.8: document LD_ASSUME_KERNEL
  ld.so.8: document Debian's /etc/ld.so.nohwcap extension
  ld.so.8: document $PLATFORM and $LIB expansion
  ld.so.8: document how hwcaps affect search path

 man8/ld.so.8 |  181 +++++++++++++++++++++++++++++++++++++++++-----------------
 1 files changed, 128 insertions(+), 53 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
