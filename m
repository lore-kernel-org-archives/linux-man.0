From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] ttyslot.3: Reformat thread-safety information
Date: Mon, 14 Jul 2014 14:21:00 +0800
Message-ID: <1405318860-32653-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/ttyslot.3 | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/man3/ttyslot.3 b/man3/ttyslot.3
index 918ac14..e0d78f5 100644
--- a/man3/ttyslot.3
+++ b/man3/ttyslot.3
@@ -121,12 +121,17 @@ associated with a terminal that occurs in this data base)
 it returns 0 on UNIX\ V6 and V7 and BSD-like systems,
 but \-1 on System V-like systems.
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
 .BR ttyslot ()
-function calls thread-unsafe function
-.BR getttyent (),
-so it is not thread-safe.
+T}	Thread safety	MT-Unsafe
+.TE
 .SH CONFORMING TO
 SUSv1; marked as LEGACY in SUSv2; removed in POSIX.1-2001.
 SUSv2 requires \-1 on error.
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
