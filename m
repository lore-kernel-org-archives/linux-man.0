From: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Minor issues in man2/open.2 man2/pread.2 man2/readv.2
Date: Sun, 28 Nov 2010 21:38:44 +0100
Message-ID: <AANLkTingGnMCm1zp09Y8h=BQHUT-NEwE5856Y3cgFtiH@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

Here is a patch about minor issues in recent changes.

Denis

diff --git a/man2/open.2 b/man2/open.2
index eeaf0e1..ff3aa88 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -339,8 +339,8 @@ can be used without
 if
 .I pathname
 refers to a block device.
-If the block device is in use by the system (e.g., mounted)
-.BR open (),
+If the block device is in use by the system (e.g., mounted),
+.BR open ()
 fails with the error
 .BR EBUSY .

diff --git a/man2/pread.2 b/man2/pread.2
index 3f341fb..6966b31 100644
--- a/man2/pread.2
+++ b/man2/pread.2
@@ -121,7 +121,7 @@ became
 and
 .BR pwrite ()
 became
-.BR pwrite64 (),
+.BR pwrite64 ().
 The system call numbers remained the same.
 The glibc
 .BR pread ()
diff --git a/man2/readv.2 b/man2/readv.2
index 7dded97..5cf3ca4 100644
--- a/man2/readv.2
+++ b/man2/readv.2
@@ -173,7 +173,7 @@ The file referred to by
 .I fd
 must be capable of seeking.
 .SH "RETURN VALUE"
-On success, the
+On success,
 .BR readv ()
 and
 .BR preadv ()
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
