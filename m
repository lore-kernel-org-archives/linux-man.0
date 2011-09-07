From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getgrnam.3: Add description of the functions are not thread-safe.
Date: Wed, 07 Sep 2011 09:13:48 +0800
Message-ID: <4E66C54C.1070303@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


The functions getgrnam() and getgrgid() return a pointer to a static area which
is overwritten by a subsequent call to them. So they are thread-unsafe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getgrnam.3 |   15 ++++++++++++++-
 1 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/man3/getgrnam.3 b/man3/getgrnam.3
index e4afa3e..cbbdc74 100644
--- a/man3/getgrnam.3
+++ b/man3/getgrnam.3
@@ -28,7 +28,7 @@
 .\" Modified 1993-07-24 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
 .\" Modified 2003-11-15 by aeb
 .\"
-.TH GETGRNAM 3 2010-10-21 "" "Linux Programmer's Manual"
+.TH GETGRNAM 3 2011-09-07 "" "Linux Programmer's Manual"
 .SH NAME
 getgrnam, getgrnam_r, getgrgid, getgrgid_r \- get group file entry
 .SH SYNOPSIS
@@ -199,6 +199,19 @@ Insufficient buffer space supplied.
 .TP
 .I /etc/group
 local group database file
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The two functions
+.BR getgrnam ()
+and
+.BR getgrgid ()
+are not thread-safe.
+.LP
+The two functions
+.BR getgrnam_r ()
+and
+.BR getgrgid_r ()
+are thread-safe.
 .SH "CONFORMING TO"
 SVr4, 4.3BSD, POSIX.1-2001.
 .SH NOTES
-- 
1.7.1

-- 
Best Regards,
Peng Haitao

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
