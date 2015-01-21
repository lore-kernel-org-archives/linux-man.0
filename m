From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] termios.3: Modify thread-safety information
Date: Wed, 21 Jan 2015 17:07:34 +0800
Message-ID: <1421831254-23376-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

As this is man page for Linux, we don't need thread safety information
for bsd

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/termios.3 | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/man3/termios.3 b/man3/termios.3
index 8eb04be..314218f 100644
--- a/man3/termios.3
+++ b/man3/termios.3
@@ -984,9 +984,12 @@ Interface	Attribute	Value
 T{
 .BR tcgetattr (),
 .BR tcsetattr (),
+.BR tcsendbreak (),
 .BR tcdrain (),
 .br
 .BR tcflush (),
+.br
+.BR tcflow (),
 .BR cfmakeraw (),
 .BR cfgetispeed (),
 .BR cfgetospeed (),
@@ -994,10 +997,6 @@ T{
 .BR cfsetospeed (),
 .BR cfsetspeed ()
 T}	Thread safety	MT-Safe
-T{
-.BR tcsendbreak (),
-.BR tcflow ()
-T}	Thread safety	MT-Unsafe race:tcattr(filedes)/bsd
 .TE
 .ad
 .hy
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
