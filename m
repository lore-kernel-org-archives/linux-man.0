From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] access.2, chmod.2, chown.2, unlink.2: ffix
Date: Tue, 25 Feb 2014 00:43:42 +0100
Message-ID: <1393285422-5684-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Fix format issue introduced in cadd38ba

Can be detected with:
	git grep -P '.BR [a-z]+\(\)'
---
 man2/access.2 |  8 ++++----
 man2/chmod.2  |  6 +++---
 man2/chown.2  | 10 +++++-----
 man2/unlink.2 | 10 +++++-----
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/man2/access.2 b/man2/access.2
index 8be998a..83f48bd 100644
--- a/man2/access.2
+++ b/man2/access.2
@@ -125,7 +125,7 @@ referred to by the file descriptor
 .I dirfd
 (rather than relative to the current working directory of
 the calling process, as is done by
-.BR access()
+.BR access ()
 for a relative pathname).
 
 If
@@ -138,7 +138,7 @@ then
 .I pathname
 is interpreted relative to the current working
 directory of the calling process (like
-.BR access()).
+.BR access () ).
 
 If
 .I pathname
@@ -154,7 +154,7 @@ Perform access checks using the effective user and group IDs.
 By default,
 .BR faccessat ()
 uses the real IDs (like
-.BR access()).
+.BR access () ).
 .TP
 .B AT_SYMLINK_NOFOLLOW
 If
@@ -260,7 +260,7 @@ is a file descriptor referring to a file other than a directory.
 was added to Linux in kernel 2.6.16;
 library support was added to glibc in version 2.4.
 .SH "CONFORMING TO"
-.BR access():
+.BR access ():
 SVr4, 4.3BSD, POSIX.1-2001, POSIX.1-2008.
 
 .BR faccessat ():
diff --git a/man2/chmod.2 b/man2/chmod.2
index 8417100..f4636d5 100644
--- a/man2/chmod.2
+++ b/man2/chmod.2
@@ -193,7 +193,7 @@ referred to by the file descriptor
 .I dirfd
 (rather than relative to the current working directory of
 the calling process, as is done by
-.BR chmod()
+.BR chmod ()
 for a relative pathname).
 
 If
@@ -206,7 +206,7 @@ then
 .I pathname
 is interpreted relative to the current working
 directory of the calling process (like
-.BR chmod()).
+.BR chmod () ).
 
 If
 .I pathname
@@ -298,7 +298,7 @@ See above.
 See above.
 .PP
 The same errors that occur for
-.BR chmod()
+.BR chmod ()
 can also occur for
 .BR fchmodat ().
 The following additional errors can occur for
diff --git a/man2/chown.2 b/man2/chown.2
index a92c039..b1ef4a5 100644
--- a/man2/chown.2
+++ b/man2/chown.2
@@ -156,7 +156,7 @@ referred to by the file descriptor
 .I dirfd
 (rather than relative to the current working directory of
 the calling process, as is done by
-.BR chown()
+.BR chown ()
 for a relative pathname).
 
 If
@@ -169,7 +169,7 @@ then
 .I pathname
 is interpreted relative to the current working
 directory of the calling process (like
-.BR chown()).
+.BR chown () ).
 
 If
 .I pathname
@@ -206,11 +206,11 @@ If
 .I pathname
 is a symbolic link, do not dereference it:
 instead operate on the link itself, like
-.BR lchown().
+.BR lchown ().
 (By default,
 .BR fchownat ()
 dereferences symbolic links, like
-.BR chown().)
+.BR chown ().)
 .PP
 See
 .BR openat (2)
@@ -282,7 +282,7 @@ See above.
 See above.
 .PP
 The same errors that occur for
-.BR chown()
+.BR chown ()
 can also occur for
 .BR fchownat ().
 The following additional errors can occur for
diff --git a/man2/unlink.2 b/man2/unlink.2
index 29b1acd..7aafb90 100644
--- a/man2/unlink.2
+++ b/man2/unlink.2
@@ -83,7 +83,7 @@ it.
 The
 .BR unlinkat ()
 system call operates in exactly the same way as either
-.BR unlink()
+.BR unlink ()
 or
 .BR rmdir (2)
 (depending on whether or not
@@ -100,7 +100,7 @@ referred to by the file descriptor
 .I dirfd
 (rather than relative to the current working directory of
 the calling process, as is done by
-.BR unlink()
+.BR unlink ()
 and
 .BR rmdir (2)
 for a relative pathname).
@@ -115,7 +115,7 @@ then
 .I pathname
 is interpreted relative to the current working
 directory of the calling process (like
-.BR unlink()
+.BR unlink ()
 and
 .BR rmdir (2)).
 
@@ -135,7 +135,7 @@ Currently only one such flag is defined:
 By default,
 .BR unlinkat ()
 performs the equivalent of
-.BR unlink()
+.BR unlink ()
 on
 .IR pathname .
 If the
@@ -238,7 +238,7 @@ capability).
 refers to a file on a read-only filesystem.
 .PP
 The same errors that occur for
-.BR unlink()
+.BR unlink ()
 and
 .BR rmdir (2)
 can also occur for
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
