From: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/3] syslog.2 updates
Date: Wed, 13 Feb 2008 11:18:31 +1100
Message-ID: <1202861911.283156.369797917642.qpush@pokey>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

I've discovered that the type=10 option to the syslog syscall isn't
documented, so I've done up a patch to add it in.

Also, I've done a small apostrophe fix, and completed the docs for
other vaules of the type argument.

Cheers,


Jeremy
