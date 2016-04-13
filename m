From: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 0/4] Makefile: fix temporary file handling and improve
 check-groff-warnings
Date: Thu, 14 Apr 2016 01:04:34 +0200
Message-ID: <20160414010434.1a7bdcfc.alex.miller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Michael,

a while ago I noticed that every time make is run a new empty file
would be created in /tmp. This has been annoying me since, so I
decided to have a look.

The first patch fixes this problem; the file is crated only for
"make check-groff-warnings" where it is needed.
While at it, I improved various bits for that target (in patch 2).
Finally, the last 2 patches are purely cosmetic trivial changes.

I also noticed that check-groff-warnings works only with man-db.
I happened to test it on a box with plain man and got a usage
error for every man page. I haven't included a patch to silence
these errors, since the old man has no equivalent for the --warnings
option, and so I think it doesn't make sense to support it, you'd
get the default warnings only. But if you like, I can provide a
patch.

Regards,
Alex

---
Alexander Miller (4):
  Makefile: Don't leave $(GROFF_LOG) files behind
  Makefile: Improve recipe for "check-groff-warnings" target
  Makefile: wsfix (trailing space)
  Makefile: Remove line continuation at end of "install" recipe

 Makefile | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
