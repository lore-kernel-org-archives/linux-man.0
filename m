From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] inotify.7: Bug 77111 - watch descriptor reuse
Date: Thu, 29 May 2014 19:39:03 +0200
Message-ID: <1401385143-19306-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jeff Smith <jsmith.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Watch descriptor IDs are returned by inotify_add_watch.
When calling inotify_rm_watch an IN_IGNORE is placed on the inotify queue
pointing to the ID of the removed watch.

inotify_add_watch should not return a watch descriptor ID for which events are
still on the queue but should return an unused ID.

Unfortunately the existing Kernel code does not provide such a guarantee.

Actually in rare cases watch descriptor IDs are returned by inotify_add_watch
for which events are still on the inotify queue.

cf. https://bugzilla.kernel.org/show_bug.cgi?id=77111

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man7/inotify.7 | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/man7/inotify.7 b/man7/inotify.7
index 1fc83f8..b1c2f6f 100644
--- a/man7/inotify.7
+++ b/man7/inotify.7
@@ -728,6 +728,18 @@ and the accompanying
 event might be fetched only on the next
 .BR read (2).
 .SH BUGS
+As of Linux 3.14,
+the following bug exists:
+.IP * 3
+.\" FIXME https://bugzilla.kernel.org/show_bug.cgi?id=77111
+.BR inotify_add_watch (2)
+may return a watch descriptor ID released by a prior call to
+.BR inotify_rm_watch (2)
+even if events for this watch descriptor still exist on the inotify queue.
+As a workaround the inotify file descriptor can be read until the queue is
+empty before calling
+.BR inotify_add_watch (2).
+.PP
 .\" FIXME kernel commit 611da04f7a31b2208e838be55a42c7a1310ae321
 .\" implies that unmount events were buggy 2.6.11 to 2.6.36
 .\"
@@ -745,7 +757,7 @@ However, as an unintended effect of other changes,
 since Linux 2.6.36, an
 .B IN_IGNORED
 event is generated in this case.
