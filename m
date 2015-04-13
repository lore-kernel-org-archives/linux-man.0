From: Andreas Gruenbacher <andreas.gruenbacher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] umask.2, open.2, mknod.2, mkdir.2: Explain what default acls do
Date: Mon, 13 Apr 2015 19:38:52 +0200
Message-ID: <3fa52386efe0d027409e803629c6b751e0b7b602.1428946673.git.andreas.gruenbacher@gmail.com>
References: <fe89279fbad286454188b3146b311442cdb7401f.1428946673.git.andreas.gruenbacher@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fe89279fbad286454188b3146b311442cdb7401f.1428946673.git.andreas.gruenbacher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <fe89279fbad286454188b3146b311442cdb7401f.1428946673.git.andreas.gruenbacher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <fe89279fbad286454188b3146b311442cdb7401f.1428946673.git.andreas.gruenbacher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andreas Gruenbacher <agruenba-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Explain the effect that default acls have (instead of the umask) in umask.2.
Mention that default acls can have an affect in open.2, mknod.2, and mkdir.2.

Signed-off-by: Andreas Gruenbacher <agruenba-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man2/mkdir.2 |  5 ++---
 man2/mknod.2 |  5 +++--
 man2/open.2  |  3 ++-
 man2/umask.2 | 11 +++++++++++
 4 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/man2/mkdir.2 b/man2/mkdir.2
index 41fad55..42fc26b 100644
--- a/man2/mkdir.2
+++ b/man2/mkdir.2
@@ -54,7 +54,8 @@ The argument
 specifies the permissions to use.
 It is modified by the process's
 .I umask
-in the usual way: the permissions of the created directory are
+in the usual way: in the absence of a default acl, the permissions of the
+created directory are
 .RI ( mode " & ~" umask " & 0777)."
 Other mode bits of the created directory depend on the operating system.
 For Linux, see below.
@@ -212,8 +213,6 @@ POSIX.1-2008.
 Under Linux, apart from the permission bits, only the
 .B S_ISVTX
 mode bit is honored.
-That is, under Linux the created directory actually gets mode
-.RI ( mode " & ~" umask " & 01777)."
 See also
 .BR stat (2).
 .PP
diff --git a/man2/mknod.2 b/man2/mknod.2
index e93c345..7a8dd1e 100644
--- a/man2/mknod.2
+++ b/man2/mknod.2
@@ -63,8 +63,9 @@ listed below and the permissions for the new node.
 
 The permissions are modified by the process's
 .I umask
-in the usual way: the permissions of the created node are
-.IR "(mode & ~umask)" .
+in the usual way: in the absence of a default acl, the permissions of the
+created node are
+.RI ( mode " & ~" umask ).
 
 The file type must be one of
 .BR S_IFREG ,
diff --git a/man2/open.2 b/man2/open.2
index 96ee576..7508222 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -280,7 +280,8 @@ is ignored.
 The effective permissions are modified by
 the process's
 .I umask
-in the usual way: The permissions of the created file are
+in the usual way: In the absence of a default acl, the permissions of the
+created file are
 .IR "(mode\ &\ ~umask)" .
 Note that this mode applies only to future accesses of the
 newly created file; the
diff --git a/man2/umask.2 b/man2/umask.2
index e5e5750..905f2cd 100644
--- a/man2/umask.2
+++ b/man2/umask.2
@@ -63,6 +63,17 @@ argument to
 and
 .BR mkdir (2).
 
+Alternatively, if the parent directory has a default acl (see
+.BR acl (5)),
+the umask is ignored, the default acl is inherited, the permission bits are set
+based on the inherited acl, and permission bits absent in the
+.I mode
+argument are turned off.  For example, the default acl
+u::rwx,g::r-x,o::r-x is equivalent to a umask of 022, and with a
+.I mode
+argument of 0666 (rw-rw-rw-), the resulting file permissions are 0644
+(rw-r--r--).
+
 The constants that should be used to specify
 .I mask
 are described under
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
