From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] inet.3: Modify thread-safety information
Date: Tue, 3 Feb 2015 15:05:45 +0800
Message-ID: <1422947145-13487-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

After researching and talking, we think inet_network() and 
inet_ntoa() should be marked with locale.
After changing, the markings match glbc markings.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/inet.3 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/man3/inet.3 b/man3/inet.3
index 6e4663c..3669453 100644
--- a/man3/inet.3
+++ b/man3/inet.3
@@ -225,12 +225,12 @@ l l l.
 Interface	Attribute	Value
 T{
 .BR inet_aton (),
-.BR inet_addr ()
+.BR inet_addr (),
+.br
+.BR inet_network (),
+.BR inet_ntoa ()
 T}	Thread safety	MT-Safe locale
 T{
-.BR inet_network (),
-.BR inet_ntoa (),
-.br
 .BR inet_makeaddr (),
 .BR inet_lnaof (),
 .br
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
