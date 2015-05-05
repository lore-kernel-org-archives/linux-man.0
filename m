From: Gleb Fotengauer-Malinovskiy <glebfm-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] sendfile.2: tfix
Date: Tue, 5 May 2015 16:14:23 +0300
Message-ID: <20150505131356.GA22385@glebfm.cloud.tilaa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Gleb Fotengauer-Malinovskiy <glebfm-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
---
 man2/sendfile.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/sendfile.2 b/man2/sendfile.2
index efe61ec..e32fda5 100644
--- a/man2/sendfile.2
+++ b/man2/sendfile.2
@@ -141,7 +141,7 @@ Insufficient memory to read from
 .IR in_fd .
 .SH VERSIONS
 .BR sendfile ()
-ifirst appeared in Linux 2.2.
+first appeared in Linux 2.2.
 The include file
 .I <sys/sendfile.h>
 is present since glibc 2.1.
-- 
glebfm
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
