From: James Hunt <james.hunt-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] Explain how to read a single inotify event.
Date: Tue, 06 Dec 2011 09:40:53 +0000
Message-ID: <4EDDE325.2080203@ubuntu.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040107070309050605050809"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------040107070309050605050809
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

man7/inotify.7:

- Explain how to read a single inotify event.
- Add missing "struct" in explanation of event size.

Kind regards,
-- 
James Hunt


--------------040107070309050605050809
Content-Type: text/x-diff;
 name="0001-Explain-how-to-read-a-single-inotify-event.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-Explain-how-to-read-a-single-inotify-event.patch"

>From 2c2e9150661fc12142725f97e3cebf8ff64e1264 Mon Sep 17 00:00:00 2001
From: James Hunt <james.hunt-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Date: Tue, 6 Dec 2011 09:33:51 +0000
Subject: Explain how to read a single inotify event.

Also added missing "struct" to sizeof().
---
 man7/inotify.7 |   24 +++++++++++++++++++++++-
 1 files changed, 23 insertions(+), 1 deletions(-)

diff --git a/man7/inotify.7 b/man7/inotify.7
index ddeb5e5..742dec2 100644
--- a/man7/inotify.7
+++ b/man7/inotify.7
@@ -144,7 +144,7 @@ including the null bytes;
 the length of each
 .I inotify_event
 structure is thus
-.IR "sizeof(inotify_event)+len" .
+.IR "sizeof(struct inotify_event)+len" .
 
 The behavior when the buffer given to
 .BR read (2)
@@ -417,6 +417,28 @@ be aware that by the time you create a watch for the new subdirectory,
 new files may already have been created in the subdirectory.
 Therefore, you may want to scan the contents of the subdirectory
 immediately after adding the watch.
+
+To read a
+.B single
+event requires the buffer provided to
+.BR read (2)
+be large enough to hold the event. However, since inotify employs
+variable-length events for files in a watched directory (via the
+.I name
+field), it is not possible to know exactly how big such a
+buffer should be since the event itself has not yet been read. One
+method to overcome this limitation is to start with a buffer of size
+.I sizeof(struct inotify_event)
+and attempt to read the event. If this fails with
+.BR EINVAL ","
+continue to increase the buffer size by one byte up to
+.I "sizeof(struct inotify_event)+NAME_MAX"
+until
+.BR read (2)
+does not return
+.BR EINVAL "."
+Note that this technique is not particularly efficient.
+
 .SH "BUGS"
 In kernels before 2.6.16, the
 .B IN_ONESHOT
-- 
1.7.5.4


--------------040107070309050605050809--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
