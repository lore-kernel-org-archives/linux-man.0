From: "J. Bruce Fields" <bfields-uC3wQj2KruNg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] access: fix outdated NFS information
Date: Wed, 11 Sep 2013 16:22:11 -0400
Message-ID: <20130911202210.GB1462@fieldses.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

From: "J. Bruce Fields" <bfields-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Note that NFS versions since version 3 support an "access" call so that
the client doesn't have to guess permissions or id mapping on its own.

(See rfc 1813 sections 1.7 and 3.3.4.)

Signed-off-by: J. Bruce Fields <bfields-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man2/access.2 |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/man2/access.2 b/man2/access.2
index 6df68de..3bacab1 100644
--- a/man2/access.2
+++ b/man2/access.2
@@ -209,9 +209,10 @@ Similarly, a DOS file may be found to be "executable," but the
 call will still fail.
 .PP
 .BR access ()
-may not work correctly on NFS filesystems with UID mapping enabled,
+may not work correctly on NFSv2 filesystems with UID mapping enabled,
 because UID mapping is done on the server and hidden from the client,
-which checks permissions.
+which checks permissions.  (NFS versions 3 and higher perform the check on
+the server.)
 Similar problems can occur to FUSE mounts.
 .SH BUGS
 In kernel 2.4 (and earlier) there is some strangeness in the handling of
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
