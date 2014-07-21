From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getcwd.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 21 Jul 2014 16:57:09 +0800
Message-ID: <1405933029-894-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions getcwd(), getwd() and get_current_dir_name() are
thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getcwd.3 | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/man3/getcwd.3 b/man3/getcwd.3
index d351938..f4762f2 100644
--- a/man3/getcwd.3
+++ b/man3/getcwd.3
@@ -205,6 +205,22 @@ The
 argument is less than the length of the absolute pathname of the
 working directory, including the terminating null byte.
 You need to allocate a bigger array and try again.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw22 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR getcwd (),
+.BR getwd ()
+T}	Thread safety	MT-Safe
+T{
+.BR get_current_dir_name ()
+T}	Thread safety	MT-Safe env
+.TE
 .SH CONFORMING TO
 .BR getcwd ()
 conforms to POSIX.1-2001.
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
