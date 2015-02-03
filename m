From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] toupper.3: Modify thread-safety information
Date: Tue, 3 Feb 2015 14:53:58 +0800
Message-ID: <1422946438-13204-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

After researching and talking, we think toupper() and tolower()
should not be marked with locale.
After changing, the markings match glbc markings.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/toupper.3 | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/man3/toupper.3 b/man3/toupper.3
index fd98245..e3abba0 100644
--- a/man3/toupper.3
+++ b/man3/toupper.3
@@ -122,9 +122,8 @@ l l l.
 Interface	Attribute	Value
 T{
 .BR toupper (),
-.BR tolower ()
-T}	Thread safety	MT-Safe locale
-T{
+.BR tolower (),
+.br
 .BR toupper_l (),
 .BR tolower_l ()
 T}	Thread safety	MT-Safe
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
