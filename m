From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] fork(2): fix style around io_setup highlight
Date: Wed, 28 Oct 2009 01:09:58 -0400
Message-ID: <1256706598-21429-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man2/fork.2 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man2/fork.2 b/man2/fork.2
index 17c42db..0a371cd 100644
--- a/man2/fork.2
+++ b/man2/fork.2
@@ -85,7 +85,7 @@ from its parent
 .RB ( aio_read (3),
 .BR aio_write (3)),
 nor does it inherit any asynchronous I/O contexts from its parent
-.RB ( see io_setup (2)).
+.RB (see\  io_setup (2)).
 .PP
 The process attributes in the preceding list are all specified
 in POSIX.1-2001.
-- 
1.6.5.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
