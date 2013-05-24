From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH v2] getlogin.3: ATTRIBUTES: Note function that is not thread-safe
Date: Fri, 24 May 2013 09:08:09 +0800
Message-ID: <1369357689-9069-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function getlogin() is not thread safe.
The function cuserid() is thread-safe with exceptions.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getlogin.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/getlogin.3 b/man3/getlogin.3
index be7cc87..7050d5d 100644
--- a/man3/getlogin.3
+++ b/man3/getlogin.3
@@ -135,6 +135,20 @@ password database file
 \fI/var/run/utmp\fP
 (traditionally \fI/etc/utmp\fP;
 some libc versions used \fI/var/adm/utmp\fP)
+.SH ATTRIBUTES
+.SS Multithreading(see pthreads(7))
+The
+.BR getlogin ()
+function is not thread-safe.
+.LP
+The
+.BR getlogin_r ()
+function is thread-safe.
+.LP
+The
+.BR cuserid ()
+function is thread-safe with exceptions.
+It is not thread-safe if called with a NULL parameter.
 .SH CONFORMING TO
 .BR getlogin ()
 and
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
