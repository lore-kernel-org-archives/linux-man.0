From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] termios.3: Reformat thread-safety information
Date: Mon, 21 Jul 2014 12:15:28 +0800
Message-ID: <1405916128-18956-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/termios.3 | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/man3/termios.3 b/man3/termios.3
index fbf909b..9583f11 100644
--- a/man3/termios.3
+++ b/man3/termios.3
@@ -972,8 +972,16 @@ it may be necessary to follow this call with a further call to
 .BR tcgetattr ()
 to check that all changes have been performed successfully.
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.nh
+.ad l
+.TS
+allbox;
+lb lb lb
+lw37 l l.
+Interface	Attribute	Value
+T{
 .BR tcgetattr (),
 .BR tcsetattr (),
 .BR tcsendbreak (),
@@ -985,9 +993,11 @@ The
 .BR cfgetospeed (),
 .BR cfsetispeed (),
 .BR cfsetospeed (),
-and
 .BR cfsetspeed ()
-functions are thread-safe.
+T}	Thread safety	MT-Safe
+.TE
+.ad
+.hy
 .SH CONFORMING TO
 .BR tcgetattr (),
 .BR tcsetattr (),
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
