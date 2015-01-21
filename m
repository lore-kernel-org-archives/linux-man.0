From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] termios.3: Modify thread-safety information
Date: Wed, 21 Jan 2015 15:40:12 +0800
Message-ID: <1421826012-12616-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

As annotation in glibc manual is more detailed, change the 
thread-safety information to be the same as glibc manual.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/termios.3 | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/man3/termios.3 b/man3/termios.3
index 371bdf7..8eb04be 100644
--- a/man3/termios.3
+++ b/man3/termios.3
@@ -979,15 +979,14 @@ For an explanation of the terms used in this section, see
 .TS
 allbox;
 lb lb lb
-lw37 l l.
+l l l.
 Interface	Attribute	Value
 T{
 .BR tcgetattr (),
 .BR tcsetattr (),
-.BR tcsendbreak (),
 .BR tcdrain (),
+.br
 .BR tcflush (),
-.BR tcflow (),
 .BR cfmakeraw (),
 .BR cfgetispeed (),
 .BR cfgetospeed (),
@@ -995,6 +994,10 @@ T{
 .BR cfsetospeed (),
 .BR cfsetspeed ()
 T}	Thread safety	MT-Safe
+T{
+.BR tcsendbreak (),
+.BR tcflow ()
+T}	Thread safety	MT-Unsafe race:tcattr(filedes)/bsd
 .TE
 .ad
 .hy
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
