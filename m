From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] sigsetops.3: Reformat thread-safety information
Date: Tue, 19 Aug 2014 10:56:12 +0800
Message-ID: <1408416972-31279-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/sigsetops.3 | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/man3/sigsetops.3 b/man3/sigsetops.3
index a2a3554..84c3247 100644
--- a/man3/sigsetops.3
+++ b/man3/sigsetops.3
@@ -129,18 +129,27 @@ to indicate the cause.
 .I sig
 is not a valid signal.
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw31 lb lb
+l l l.
+Interface	Attribute	Value
+T{
 .BR sigemptyset (),
 .BR sigfillset (),
+.br
 .BR sigaddset (),
 .BR sigdelset (),
+.br
 .BR sigismember (),
 .BR sigisemptyset (),
+.br
 .BR sigorset (),
-and
 .BR sigandset ()
-functions are thread-safe.
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
