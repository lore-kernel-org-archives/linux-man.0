From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch 6/7] malloc_info.3: wfix
Date: Thu, 15 Jan 2015 22:18:29 -0500
Message-ID: <54B88305.8000509@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Harmonize all the manual pages to use "stream" for FILE*
instead of randomly using "fp" or "stream." Choosing something
and being consistent helps users scan the man pages quickly
and understand what they are looking at.

Patch against master.

diff --git a/man3/malloc_info.3 b/man3/malloc_info.3
index c7774f8..f8a487e 100644
--- a/man3/malloc_info.3
+++ b/man3/malloc_info.3
@@ -29,7 +29,7 @@ malloc_info \- export malloc state to a stream
 .nf
 .B #include <malloc.h>
 .sp
-.BI "int malloc_info(int " options ", FILE *" fp );
+.BI "int malloc_info(int " options ", FILE *" stream );
 .fi
 .SH DESCRIPTION
 The
@@ -38,7 +38,7 @@ function exports an XML string that describes the current state
 of the memory-allocation
 implementation in the caller.
 The string is printed on the file stream
-.IR fp .
+.IR stream .
 The exported string includes information about all arenas (see
 .BR malloc (3)).
 
---

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
