From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] fdim.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 15 Jul 2013 15:03:15 +0800
Message-ID: <1373871795-14782-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions fdim(), fdimf() and fdiml() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/fdim.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/fdim.3 b/man3/fdim.3
index 62dac84..0f7c619 100644
--- a/man3/fdim.3
+++ b/man3/fdim.3
@@ -6,7 +6,7 @@
 .\" Distributed under GPL
 .\" %%%LICENSE_END
 .\"
-.TH FDIM 3 2010-09-20 "" "Linux Programmer's Manual"
+.TH FDIM 3 2013-07-15 "" "Linux Programmer's Manual"
 .SH NAME
 fdim, fdimf, fdiml \- positive difference
 .SH SYNOPSIS
@@ -78,6 +78,14 @@ These functions do not set
 .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6796
 .SH VERSIONS
 These functions first appeared in glibc in version 2.1.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR fdim (),
+.BR fdimf (),
+and
+.BR fdiml ()
+functions are thread-safe.
 .SH CONFORMING TO
 C99, POSIX.1-2001.
 .SH SEE ALSO
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
