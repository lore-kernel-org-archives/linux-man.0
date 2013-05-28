From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getusershell.3: ATTRIBUTES: Note functions that are not thread-safe
Date: Tue, 28 May 2013 17:50:10 +0800
Message-ID: <1369734610-12284-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions getusershell(), setusershell() and endusershell()
are not thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getusershell.3 | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/man3/getusershell.3 b/man3/getusershell.3
index a6c8ab1..b9e7e58 100644
--- a/man3/getusershell.3
+++ b/man3/getusershell.3
@@ -82,6 +82,14 @@ function returns a NULL pointer on end-of-file.
 .nf
 /etc/shells
 .fi
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR getusershell (),
+.BR setusershell ()
+and
+.BR endusershell ()
+functions are not thread-safe.
 .SH CONFORMING TO
 4.3BSD.
 .SH SEE ALSO
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
