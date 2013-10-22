From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] bcopy.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 22 Oct 2013 09:35:16 +0800
Message-ID: <1382405716-5116-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function bcopy() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/bcopy.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/bcopy.3 b/man3/bcopy.3
index 2c79434..81891d3 100644
--- a/man3/bcopy.3
+++ b/man3/bcopy.3
@@ -30,7 +30,7 @@
 .\" Modified Sun Feb 26 14:52:00 1995 by Rik Faith <faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org>
 .\" Modified Tue Oct 22 23:48:10 1996 by Eric S. Raymond <esr-4uCgticg2UFBDgjK7y7TUQ@public.gmane.org>
 .\" "
-.TH BCOPY 3 2009-03-15 "Linux" "Linux Programmer's Manual"
+.TH BCOPY 3 2013-10-22 "Linux" "Linux Programmer's Manual"
 .SH NAME
 bcopy \- copy byte sequence
 .SH SYNOPSIS
@@ -51,6 +51,11 @@ to
 The result is correct, even when both areas overlap.
 .SH RETURN VALUE
 None.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR bcopy ()
+function is thread-safe.
 .SH CONFORMING TO
 4.3BSD.
 This function is deprecated (marked as LEGACY in POSIX.1-2001): use
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
