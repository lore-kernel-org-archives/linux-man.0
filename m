From: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 0/7] Improve support for compressed man pages
Date: Sat, 16 Apr 2016 02:25:03 +0200
Message-ID: <20160416022503.1df762cb.alex.miller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

when I looked at the Makefile I noticed it has incomplete compression
support. Most notably the screen and uninstall targets didn't support
switching to a different compression type. More precisely, uninstall
supported only switching from gz or bz2 (but not xz) to uncompressed.
The screen target had no explicit compression support and when it
worked for compressed files it was pure luck.
The patches 2 and 3 provide new recipes for both targets that can
handle any combination of the supported compression types. Any file,
installed or source, may be uncompressed or compressed with any of
gz, bz2, or xz. Whether you compress before or after screen and uninstall
doesn't matter any more.
The other patches add a few minor improvements I'd suggest.

So long,
Alex
---
Alexander Miller (7):
  Makefile: Use better xz options
  Makefile: Improve uninstall target for compressed man pages
  Makefile: Support compressed files for screen target
  Makefile: Skip already compressed files in gz/bz2/xz targets
  Makefile: Add uncompress target to undo effect of gz/bz2/xz targets
  Makefile: Avoid compressing very small files in gz/bz2/xz targets
  Makefile: Mention xz in the instructive comment at top

 Makefile | 54 +++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 41 insertions(+), 13 deletions(-)

-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
