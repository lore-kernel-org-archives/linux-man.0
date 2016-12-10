From: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] fuse.4: Add new file describing /dev/fuse
Date: Sat, 10 Dec 2016 16:03:04 -0500
Message-ID: <CABV8kRxw+Dps3iMi8GJOUiegUdxFBuaMF-icy=z0=faKUNi4SA@mail.gmail.com>
References: <20161210072018.GA5267@juliacomputing.com> <96577e95-953c-994c-1dbb-2b4c92c1d2c4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <96577e95-953c-994c-1dbb-2b4c92c1d2c4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Miklos Szeredi <miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org>, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nikolaus Rath <nikolaus-BTH8mxji4b0@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael, your edits look good to me. Here's some suggested wording
to address the FIXMEs. Hope that's clearer (I also hope this goes
through ok, gmail sometimes mangles patches, so I usually send them
from the command line).

diff --git a/man4/fuse.4 b/man4/fuse.4
index 30f4b0a..af28ef9 100644
--- a/man4/fuse.4
+++ b/man4/fuse.4
@@ -177,9 +177,6 @@ of the minor versions provided by the daemon and
the kernel and
 both parties should use the protocol corresponding to said minor version.
 .TP
 .BR FUSE_GETATTR
-.\" FIXME It looks like this is for implementing a stat(2) type of
-.\" operation. There needs to be a sentence here describing what
-.\" this option does.

 .in +4n
 .nf
@@ -192,47 +189,58 @@ struct fuse_getattr_in {
 .fi
 .in

-As usual, the filesystem object operated on is indicated by
-.IR header\->nodeid .
-The daemon should compute the attributes
-of this object and reply with the following message:
-.in +4n
+The requested operation is to compute the attributes to be returned
+by
+.BR stat(2)
+and similar operations for the given file system object.
+The object for which the attributes should be computed is indicated
+either by
+.IR header\->nodeid
+or, if the
+.IR FUSE_GETATTR_FH
+flag is set, by the file handle
+.IR fh.
+The latter case of operation is analogous to
+.BR fstat(2).
+
+For performance reasons, these attributes may be cached in the kernel for
+a specified duration of time. While the cache timeout has not been exceeded,
+the attributes will be served from the cache and will not cause additional
+.B FUSE_GETATTR
+requests.
+
+The computed attributes and the requested
+cache timeout should then be returned in the following structure:

+.in +4n
 .nf
-struct fuse_attr {
-    uint64_t ino;
-    uint64_t size;
-    uint64_t blocks;
-    uint64_t atime;
-    uint64_t mtime;
-    uint64_t ctime;
-    uint32_t atimensec;
-    uint32_t mtimensec;
-    uint32_t ctimensec;
-    uint32_t mode;
-    uint32_t nlink;
-    uint32_t uid;
-    uint32_t gid;
-    uint32_t rdev;
-    uint32_t blksize;
-    uint32_t padding;
-};
-
 struct fuse_attr_out {
     /* Attribute cache duration (seconds + nanoseconds) */
     uint64_t attr_valid;
     uint32_t attr_valid_nsec;
     uint32_t dummy;
-    struct fuse_attr attr;
+    struct fuse_attr {
+        uint64_t ino;
+        uint64_t size;
+        uint64_t blocks;
+        uint64_t atime;
+        uint64_t mtime;
+        uint64_t ctime;
+        uint32_t atimensec;
+        uint32_t mtimensec;
+        uint32_t ctimensec;
+        uint32_t mode;
+        uint32_t nlink;
+        uint32_t uid;
+        uint32_t gid;
+        uint32_t rdev;
+        uint32_t blksize;
+        uint32_t padding;
+    } attr;
 };
 .fi
 .in

-The fields of
-.I struct fuse_attr
-describe the attributes of the required file.
-For the interpretation of these fields, see
-.BR stat (2).
 .TP
 .BR FUSE_ACCESS

@@ -249,9 +257,10 @@ If the
 .I default_permissions
 mount options is not used, this request may be used for permissions checking.
 No reply data is expected, but errors may be indicated
-as usual in the reply header (in particular, access denied errors
-may be indicated, by setting such field to
-.\" FIXME What does "such field" mean? The 'error' field?
+as usual by setting the
+.I error
+field in the reply header (in particular, access denied errors
+may be indicated by returning
 .BR \-EACCES ).
 .TP
 .BR FUSE_OPEN " and " FUSE_OPENDIR
@@ -328,10 +337,7 @@ The requested action is to read up to
 .I size
 bytes of the file or directory, starting at
 .IR offset .
-.\" FIXME
-.\" In the following, what are "out header" and "out structure"?
-The bytes should be returned directly following the out header,
-with no further special out structure.
+The bytes should be returned directly following the usual reply header.
 .TP
 .BR FUSE_INTERRUPT
 .in +4n
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
