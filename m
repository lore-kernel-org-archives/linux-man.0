From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getpt.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 1 Apr 2014 15:25:24 +0800
Message-ID: <1396337124-32617-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function getpt() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getpt.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/getpt.3 b/man3/getpt.3
index 7ec96b4..82be3ac 100644
--- a/man3/getpt.3
+++ b/man3/getpt.3
@@ -4,7 +4,7 @@
 .\" Redistribute and modify at will.
 .\" %%%LICENSE_END
 .\"
-.TH GETPT 3 2010-09-10 "GNU" "Linux Programmer's Manual"
+.TH GETPT 3 2014-04-01 "GNU" "Linux Programmer's Manual"
 .SH NAME
 getpt \- open the pseudoterminal master (PTM)
 .SH SYNOPSIS
@@ -39,6 +39,11 @@ can fail with various errors described in
 .SH VERSIONS
 .BR getpt ()
 is provided in glibc since version 2.1.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR getpt ()
+function is thread-safe.
 .SH CONFORMING TO
 .BR getpt ()
 is glibc-specific;
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
