From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] if_nametoindex.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 1 Apr 2014 11:05:47 +0800
Message-ID: <1396321547-18497-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions if_nametoindex() and if_indextoname() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/if_nametoindex.3 | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/man3/if_nametoindex.3 b/man3/if_nametoindex.3
index 4bce79d..1d6de4e 100644
--- a/man3/if_nametoindex.3
+++ b/man3/if_nametoindex.3
@@ -22,7 +22,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH IF_NAMETOINDEX 3 2012-12-14 "GNU" "Linux Programmer's Manual"
+.TH IF_NAMETOINDEX 3 2014-04-01 "GNU" "Linux Programmer's Manual"
 .SH NAME
 if_nametoindex, if_indextoname \- mappings between network interface
 names and indexes
@@ -82,6 +82,13 @@ may also fail for any of the errors specified for
 .BR socket (2)
 or
 .BR ioctl (2).
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR if_nametoindex ()
+and
+.BR if_indextoname ()
+functions are thread-safe.
 .SH CONFORMING TO
 RFC\ 3493, POSIX.1-2001.
 
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
