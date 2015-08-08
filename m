From: Gleb Fotengauer-Malinovskiy <glebfm-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] unshare.2: fix unbalanced parentheses
Date: Sat, 8 Aug 2015 10:04:37 +0200
Message-ID: <20150808080356.GA7347@glebfm.cloud.tilaa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man2/unshare.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/unshare.2 b/man2/unshare.2
index 42b2d0e..5d1c235 100644
--- a/man2/unshare.2
+++ b/man2/unshare.2
@@ -50,7 +50,7 @@ _BSD_SOURCE || _SVID_SOURCE
 .SH DESCRIPTION
 .BR unshare ()
 allows a process (or thread) to disassociate parts of its execution
-context that are currently being shared with other processes or threads).
+context that are currently being shared with other processes (or threads).
 Part of the execution context, such as the mount namespace, is shared
 implicitly when a new process is created using
 .BR fork (2)
-- 
glebfm
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
