From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] setbuf.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 18 Feb 2014 17:26:28 +0800
Message-ID: <1392715588-9324-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions setbuf(), setbuffer(), setlinebuf() and setvbuf()
are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/setbuf.3 | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/man3/setbuf.3 b/man3/setbuf.3
index ad9914f..242afcf 100644
--- a/man3/setbuf.3
+++ b/man3/setbuf.3
@@ -45,7 +45,7 @@
 .\" Correction,  2000-03-03, Andreas Jaeger <aj-l3A5Bk7waGM@public.gmane.org>
 .\" Added return value for setvbuf, aeb,
 .\"
-.TH SETBUF 3  2012-08-03 "Linux" "Linux Programmer's Manual"
+.TH SETBUF 3  2014-02-18 "Linux" "Linux Programmer's Manual"
 .SH NAME
 setbuf, setbuffer, setlinebuf, setvbuf \- stream buffering operations
 .SH SYNOPSIS
@@ -161,6 +161,15 @@ It may set
 on failure.
 
 The other functions do not return a value.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR setbuf (),
+.BR setbuffer (),
+.BR setlinebuf (),
+and
+.BR setvbuf ()
+functions are thread-safe.
 .SH CONFORMING TO
 The
 .BR setbuf ()
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
