From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1 v2] inotify.7: Bug 77111 - watch descriptor reuse
Date: Sun, 22 Jun 2014 16:45:23 +0200
Message-ID: <1403448323-13459-1-git-send-email-xypron.glpk@gmx.de>
References: <538883D9.5090709@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <538883D9.5090709-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Eric Paris <eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>, Jeff Smitth <jsmith.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The revised patch below uses the wording suggested by Michael Kerrisk.

***

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
 man7/inotify.7 | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/man7/inotify.7 b/man7/inotify.7
index 1fc83f8..d64523f 100644
--- a/man7/inotify.7
+++ b/man7/inotify.7
@@ -754,6 +754,24 @@ if the older had not yet been read)
 instead checked if the most recent event could be coalesced with the
 .I oldest
 unread event.
+
+As of Linux 3.15.1, the following bug exists:
+.\" FIXME https://bugzilla.kernel.org/show_bug.cgi?id=77111
+When a watch descriptor is removed by calling
+.BR inotify_rm_watch (2),
+any pending unread events for that watch descriptor remain available to read.
+As watch descriptors are subsequently allocated with
+.BR inotify_add_watch (2),
+the kernel cycles through the range of possible watch descriptors (0 to
+.BR INT_MAX )
+incrementally.
+When allocating a free watch descriptor, no check is made to see whether that
+watch descriptor number has any pending unread events in the inotify queue.
+Thus, it can happen that a watch descriptor is reallocated even
+when pending unread events exist for a previous incarnation of
+that watch descriptor number, with the result that the application
+might then read those events and interpret them as belonging to 
+the file associated with the newly recycled watch descriptor.
 .SH EXAMPLE
 The following program demonstrates the usage of the inotify API.
 It marks the directories passed as a command-line arguments
-- 
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
