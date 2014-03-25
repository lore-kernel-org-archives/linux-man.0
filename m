From: "penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org" <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH v2] exit.3: ATTRIBUTES: Note function that is not thread-safe
Date: Tue, 25 Mar 2014 03:04:45 +0000
Message-ID: <1395716530-22042-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org" <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The function exit() is not thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/exit.3 | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/man3/exit.3 b/man3/exit.3
index 51163e4..69f42bc 100644
--- a/man3/exit.3
+++ b/man3/exit.3
@@ -26,7 +26,7 @@
 .\" could be listed on this page. See, for example, the list in the
 .\" POSIX exit(3p) page.
 .\"
-.TH EXIT 3  2013-02-14 "Linux" "Linux Programmer's Manual"
+.TH EXIT 3  2014-03-25 "Linux" "Linux Programmer's Manual"
 .SH NAME
 exit \- cause normal process termination
 .SH SYNOPSIS
@@ -87,6 +87,12 @@ termination, respectively.
 The
 .BR exit ()
 function does not return.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR exit ()
+function uses a global variable that is not protected,
+so it is not thread-safe.
 .SH CONFORMING TO
 SVr4, 4.3BSD, POSIX.1-2001, C89, C99.
 .SH NOTES
-- 
1.8.5.3
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
