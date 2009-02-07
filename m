From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] man2/epoll_create.2: fix typo in epoll_create1 desc
Date: Sat,  7 Feb 2009 02:38:41 -0500
Message-ID: <1233992321-23201-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christopher Head <chead-EynCeXvFgoheoWH0uzbU5w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Christopher Head reported that there is a typo in the epoll_create1 desc.
When referring to the epoll_create func, we should say "size", not "flags".

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
CC: Christopher Head <chead-EynCeXvFgoheoWH0uzbU5w@public.gmane.org>
---
 man2/epoll_create.2 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man2/epoll_create.2 b/man2/epoll_create.2
index 9a0aea0..52b8f09 100644
--- a/man2/epoll_create.2
+++ b/man2/epoll_create.2
@@ -62,7 +62,7 @@ and releases the associated resources for re-use.
 If
 .I flags
 is 0, then, other than the fact that the obsolete
-.I flags
+.I size
 argument is dropped,
 .BR epoll_create1 ()
 is the same as
-- 
1.6.1.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
