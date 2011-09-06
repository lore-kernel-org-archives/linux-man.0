From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getpass.3: Add description of the function is not thread-safe
Date: Tue, 06 Sep 2011 17:40:40 +0800
Message-ID: <4E65EA98.6070807@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


The function getpass() uses a static variable "buf", so it is not thread-safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getpass.3 |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/man3/getpass.3 b/man3/getpass.3
index d363ec4..d07a323 100644
--- a/man3/getpass.3
+++ b/man3/getpass.3
@@ -20,7 +20,7 @@
 .\" Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111,
 .\" USA.
 .\"
-.TH GETPASS 3  2010-09-20 "Linux" "Linux Programmer's Manual"
+.TH GETPASS 3  2011-09-06 "Linux" "Linux Programmer's Manual"
 .SH NAME
 getpass \- get a password
 .SH SYNOPSIS
@@ -86,6 +86,11 @@ The process does not have a controlling terminal.
 .\" A
 .\" .BR getpass ()
 .\" function appeared in Version 7 AT&T UNIX.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR getpass ()
+function is not thread-safe.
 .SH "CONFORMING TO"
 Present in SUSv2, but marked LEGACY.
 Removed in POSIX.1-2001.
-- 
1.7.1

-- 
Best Regards,
Peng Haitao

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
