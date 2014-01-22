From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH v2] strtoimax.3: ATTRIBUTES: Note functions that are thread safe with exceptions
Date: Wed, 22 Jan 2014 17:11:21 +0800
Message-ID: <1390381881-2358-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions strtoimax() and strtoumax() are thread safe with
exceptions.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/strtoimax.3 | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/man3/strtoimax.3 b/man3/strtoimax.3
index af71002..aa4f067 100644
--- a/man3/strtoimax.3
+++ b/man3/strtoimax.3
@@ -21,7 +21,7 @@
 .\" <http://www.gnu.org/licenses/>.
 .\" %%%LICENSE_END
 .\"
-.TH STRTOIMAX 3 2003-11-28 "" "Linux Programmer's Manual"
+.TH STRTOIMAX 3 2014-01-22 "" "Linux Programmer's Manual"
 .SH NAME
 strtoimax, strtoumax \- convert string to integer
 .SH SYNOPSIS
@@ -55,6 +55,17 @@ is returned, and
 .I errno
 is set to
 .BR ERANGE .
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR strtoimax ()
+and
+.BR strtoumax ()
+functions are thread-safe with exceptions.
+These functions can be safely used in multithreaded applications,
+as long as
+.BR setlocale (3)
+is not called to change the locale during their execution.
 .SH CONFORMING TO
 C99, POSIX.1-2001.
 .SH SEE ALSO
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
