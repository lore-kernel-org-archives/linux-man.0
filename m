From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getttyent.3: Reformat thread-safety information
Date: Fri, 17 Oct 2014 14:33:13 +0800
Message-ID: <1413527593-7645-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getttyent.3 | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/man3/getttyent.3 b/man3/getttyent.3
index 0271bc3..22a1bb3 100644
--- a/man3/getttyent.3
+++ b/man3/getttyent.3
@@ -70,22 +70,20 @@ can be:
 #define TTY_SECURE 0x02  /* allow UID 0 to login */
 .fi
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
-.BR getttyent ()
-function returns a pointer to a static variable, so it is not thread-safe.
-.LP
-The
-.BR setttyent ()
-and
-.BR endttyent ()
-functions use a static variable, so they are not thread-safe.
-.LP
-The
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw25 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR getttyent (),
+.BR setttyent (),
+.BR endttyent (),
 .BR getttynam ()
-function calls thread-unsafe function
-.BR getttyent ()
-so it is not thread-safe.
+T}	Thread safety	MT-Unsafe race:ttyent
+.TE
 .SH CONFORMING TO
 Not in POSIX.1-2001.
 Present on the BSDs, and perhaps other systems.
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
