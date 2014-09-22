From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] nextafter.3: Reformat thread-safety information
Date: Mon, 22 Sep 2014 16:12:22 +0800
Message-ID: <1411373542-16712-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/nextafter.3 | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/man3/nextafter.3 b/man3/nextafter.3
index 5548908..bee37d7 100644
--- a/man3/nextafter.3
+++ b/man3/nextafter.3
@@ -177,16 +177,24 @@ These functions do not set
 .\" FIXME . Is it intentional that these functions do not set errno?
 .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6799
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw28 lb lb
+l l l.
+Interface	Attribute	Value
+T{
 .BR nextafter (),
 .BR nextafterf (),
+.br
 .BR nextafterl (),
 .BR nexttoward (),
+.br
 .BR nexttowardf (),
-and
 .BR nexttowardl ()
-functions are thread-safe.
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 C99, POSIX.1-2001.
 This function is defined in IEC 559 (and the appendix with
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
