From: Krzysztof Adamski <k@japko.eu>
Subject: [PATCH] execve.2: EPERM from filesystem capabilities.
Date: Mon, 12 Oct 2015 21:45:06 +0200
Message-ID: <20151012194506.GA6346@box2.japko.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

An EPERM error can be returned when using filesystem capabilities and
capabilities to be added are not in permitted set.

This error return values was introduced by this patch:
5459c16 security: protect legacy applications from executing with
insufficient privilege

Signed-off-by: Krzysztof Adamski <k@japko.eu>
---
 man2/execve.2 | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/man2/execve.2 b/man2/execve.2
index 8f4c616..723e622 100644
--- a/man2/execve.2
+++ b/man2/execve.2
@@ -465,6 +465,10 @@ and the file has the set-user-ID or set-group-ID bit set.
 The process is being traced, the user is not the superuser and the
 file has the set-user-ID or set-group-ID bit set.
 .TP
+.BR EPERM " (since Linux 2.6.27)"
+The file has filesystem capabilities defined that are not on a permitted set of
+capabilities of the process.
+.TP
 .B ETXTBSY
 Executable was open for writing by one or more processes.
 .SH CONFORMING TO
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
