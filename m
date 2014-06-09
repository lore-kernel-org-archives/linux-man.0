From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] basename.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 9 Jun 2014 18:32:26 +0800
Message-ID: <1402309946-3080-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions basename() and dirname() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/basename.3 | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/man3/basename.3 b/man3/basename.3
index bde1471..3894819 100644
--- a/man3/basename.3
+++ b/man3/basename.3
@@ -126,6 +126,13 @@ and
 return pointers to null-terminated strings.
 (Do not pass these pointers to
 .BR free (3).)
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR basename ()
+and
+.BR dirname ()
+functions are thread-safe.
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
