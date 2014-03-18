From: "penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org" <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] mempcpy.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 18 Mar 2014 01:14:47 +0000
Message-ID: <1395105147-3817-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org" <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The functions mempcpy() and wmempcpy() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/mempcpy.3 | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/man3/mempcpy.3 b/man3/mempcpy.3
index 084aacb..4f18308 100644
--- a/man3/mempcpy.3
+++ b/man3/mempcpy.3
@@ -7,7 +7,7 @@
 .\" Heavily based on glibc infopages, copyright Free Software Foundation
 .\"
 .\" aeb, 2003, polished a little
-.TH MEMPCPY 3 2008-08-12 "GNU" "Linux Programmer's Manual"
+.TH MEMPCPY 3 2014-03-18 "GNU" "Linux Programmer's Manual"
 .SH NAME
 mempcpy, wmempcpy  \- copy memory area
 .SH SYNOPSIS
@@ -57,6 +57,13 @@ wide characters.
 .SH VERSIONS
 .BR mempcpy ()
 first appeared in glibc in version 2.1.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR mempcpy ()
+and
+.BR wmempcpy ()
+functions are thread-safe.
 .SH CONFORMING TO
 This function is a GNU extension.
 .SH EXAMPLE
-- 
1.8.5.3
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
