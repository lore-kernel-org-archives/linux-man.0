From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] wcschr.3: Reformat thread-safety information
Date: Wed, 9 Jul 2014 10:10:23 +0800
Message-ID: <1404871823-9655-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/wcschr.3 | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/man3/wcschr.3 b/man3/wcschr.3
index 597082f..883aa2a 100644
--- a/man3/wcschr.3
+++ b/man3/wcschr.3
@@ -45,10 +45,17 @@ or NULL if
 .I wc
 does not occur in the string.
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
 .BR wcschr ()
-function is thread-safe.
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 C99.
 .SH SEE ALSO
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
