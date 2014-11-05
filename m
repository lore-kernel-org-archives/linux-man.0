From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] user_namespaces(7): typo fixes
Date: Wed,  5 Nov 2014 01:31:34 -0500
Message-ID: <1415169094-28799-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man7/user_namespaces.7 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man7/user_namespaces.7 b/man7/user_namespaces.7
index d76721d..cadfa7a 100644
--- a/man7/user_namespaces.7
+++ b/man7/user_namespaces.7
@@ -34,7 +34,7 @@ For an overview of namespaces, see
 User namespaces isolate security-related identifiers and attributes,
 in particular,
 user IDs and group IDs (see
-.BR credentials (7),
+.BR credentials (7)),
 the root directory,
 keys (see
 .BR keyctl (2)),
@@ -572,7 +572,7 @@ in
 
 The cases where unmapped IDs are mapped in this fashion include
 system calls that return user IDs
-.RB ( getuid (2)
+.RB ( getuid (2),
 .BR getgid (2),
 and similar),
 credentials passed over a UNIX domain socket,
-- 
2.1.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
