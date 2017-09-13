From: Tej Chajed <tchajed-3s7WtUTddSA@public.gmane.org>
Subject: [patch] fsync.2: tfix
Date: Wed, 13 Sep 2017 15:29:25 -0400
Message-ID: <CAFCzHYbB-jxdQ52gndMsQAqNuJbyYc82xkbHDeYjAjgTQcT2Hg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

man-pages version 4.13 as found on GitHub has an accidental deletion
introduced in 2021d0b3be72d80decc0c869324e822a823d322f. Here's a patch
to add it back:

diff --git a/man2/fsync.2 b/man2/fsync.2
index f1a01301d..c02d880a8 100644
--- a/man2/fsync.2
+++ b/man2/fsync.2
@@ -74,6 +74,7 @@ The call blocks until the device reports that the
transfer has completed.
 As well as flushing the file data,
 .BR fsync ()
 also flushes the metadata information associated with the file (see
+.BR inode (7)).
 .PP
 Calling
 .BR fsync ()
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
