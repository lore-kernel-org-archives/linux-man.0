From: Tej Chajed <tchajed-3s7WtUTddSA@public.gmane.org>
Subject: [patch] fsync.2: wfix
Date: Sat, 9 Sep 2017 14:41:01 -0400
Message-ID: <CAFCzHYbqE17Zoo0TSffgQ3hkZYQaEjVi0cc63s-_UpaZp=7CmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

There's some awkward wording in the fsync(2) manpage where a sentence
switches to past tense for a hypothetical and reads "after the system
crashed or was rebooted". This is in man-pages version 4.13. Here's a
proposed fix:

diff --git a/man2/fsync.2 b/man2/fsync.2
index 8b4bc0019..4fbe2cfc8 100644
--- a/man2/fsync.2
+++ b/man2/fsync.2
@@ -66,8 +66,8 @@ transfers ("flushes") all modified in-core data of
 file referred to by the file descriptor
 .I fd
 to the disk device (or other permanent storage device) so that all
-changed information can be retrieved even after the system crashed or
-was rebooted.
+changed information can be retrieved even if the system crashes or
+is rebooted.
 This includes writing through or flushing a disk cache if present.
 The call blocks until the device reports that the transfer has completed.
 It also flushes metadata information associated with the file (see
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
