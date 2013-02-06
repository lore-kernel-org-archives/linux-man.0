From: Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] prctl.2: PR_{SET,GET}_CHILD_SUBREAPER
Date: Wed,  6 Feb 2013 10:33:09 -0800
Message-ID: <1360175589-3667-1-git-send-email-shawnlandden@gmail.com>
References: <20130111160047.GA30380@tango.0pointer.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130111160047.GA30380-kS5D54t9nk0aINubkmmoJbNAH6kLmebB@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kay Sievers <kay-tD+1rO4QERM@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org>, Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man2/prctl.2 |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/man2/prctl.2 b/man2/prctl.2
index e4a1030..fd78f48 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -379,6 +379,23 @@ if the kernel is configured with
 .B CONFIG_SECCOMP
 enabled.
 .TP
+.BR PR_SET_CHILD_SUBREAPER " (since Linux 3.3)"
+Designates this process as a service manager for its' (immediate and
+indirect) offspring processes. Any process whose immediate parent
+dies and whose ancestry includes a process where this flag is set will
+be reparented to the closest process with this flag set, instead of PID
+1. A 'subreaper' hence receives
+.B SIGHCLD
+signals for any orphaned
+offspring processes, that otherwise would be received by
+.BR init (8).
+.TP
+.BR PR_GET_CHILD_SUBREAPER " (since Linux 3.3)"
+Returns whether calling process is a child subreaper (see
+.BR PR_SET_CHILD_SUBREAPER ),
+in the location pointed to by
+.IR "(int\ *) arg2" .
+.TP
 .BR PR_SET_SECUREBITS " (since Linux 2.6.26)"
 Set the "securebits" flags of the calling thread to the value supplied in
 .IR arg2 .
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
