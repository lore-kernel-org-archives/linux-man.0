From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] ctermid.3: Reformat thread-safety information
Date: Fri, 17 Oct 2014 11:10:29 +0800
Message-ID: <1413515429-29022-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/ctermid.3 | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/man3/ctermid.3 b/man3/ctermid.3
index f78fc41..5e1fc36 100644
--- a/man3/ctermid.3
+++ b/man3/ctermid.3
@@ -59,11 +59,17 @@ is the maximum number of characters in the returned pathname.
 .SH RETURN VALUE
 The pointer to the pathname.
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
 .BR ctermid ()
-function is thread-safe with exceptions.
-It is not thread-safe if called with a NULL parameter.
+T}	Thread safety	MT-Unsafe race:ctermid/!s
+.TE
 .SH CONFORMING TO
 Svr4, POSIX.1-2001.
 .SH BUGS
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
