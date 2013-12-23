From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] ualarm.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 23 Dec 2013 11:31:54 +0800
Message-ID: <1387769514-20661-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function ualarm() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/ualarm.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/ualarm.3 b/man3/ualarm.3
index 7a9165c..e69d2ff 100644
--- a/man3/ualarm.3
+++ b/man3/ualarm.3
@@ -21,7 +21,7 @@
 .\" <http://www.gnu.org/licenses/>.
 .\" %%%LICENSE_END
 .\"
-.TH UALARM 3  2013-04-18 "" "Linux Programmer's Manual"
+.TH UALARM 3  2013-12-23 "" "Linux Programmer's Manual"
 .SH NAME
 ualarm \- schedule signal after given number of microseconds
 .SH SYNOPSIS
@@ -89,6 +89,11 @@ Interrupted by a signal.
 .B EINVAL
 \fIusecs\fP or \fIinterval\fP is not smaller than 1000000.
 (On systems where that is considered an error.)
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR ualarm ()
+function is thread-safe.
 .SH CONFORMING TO
 4.3BSD, POSIX.1-2001.
 POSIX.1-2001 marks
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
