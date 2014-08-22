From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] getpwnam(3): fix wrapped arg alignment
Date: Fri, 22 Aug 2014 04:36:12 -0400
Message-ID: <1408696572-17488-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man3/getpwnam.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/getpwnam.3 b/man3/getpwnam.3
index 5b63f1e..50886e9 100644
--- a/man3/getpwnam.3
+++ b/man3/getpwnam.3
@@ -48,11 +48,11 @@ getpwnam, getpwnam_r, getpwuid, getpwuid_r \- get password file entry
 .sp
 .BI "int getpwnam_r(const char *" name ", struct passwd *" pwd ,
 .br
-.BI "            char *" buf ", size_t " buflen ", struct passwd **" result );
+.BI "               char *" buf ", size_t " buflen ", struct passwd **" result );
 .sp
 .BI "int getpwuid_r(uid_t " uid ", struct passwd *" pwd ,
 .br
-.BI "            char *" buf ", size_t " buflen ", struct passwd **" result );
+.BI "               char *" buf ", size_t " buflen ", struct passwd **" result );
 .fi
 .sp
 .in -4n
-- 
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
