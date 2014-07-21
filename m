From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] exec.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 21 Jul 2014 16:08:13 +0800
Message-ID: <1405930093-30232-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions execl(), execlp(), execle(), execv(), execvp() and
execvpe() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/exec.3 | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/man3/exec.3 b/man3/exec.3
index 6356d2c..7756056 100644
--- a/man3/exec.3
+++ b/man3/exec.3
@@ -196,6 +196,25 @@ for any of the errors specified for
 The
 .BR execvpe ()
 function first appeared in glibc 2.11.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw29 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR execl (),
+.BR execle (),
+.BR execv ()
+T}	Thread safety	MT-Safe
+T{
+.BR execlp (),
+.BR execvp (),
+.BR execvpe ()
+T}	Thread safety	MT-Safe env
+.TE
 .SH CONFORMING TO
 POSIX.1-2001, POSIX.1-2008.
 
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
