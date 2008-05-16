From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH] utimensat() non-conformances and fixes -- version 2
Date: Fri, 16 May 2008 10:31:33 +0200
Message-ID: <482D4665.4050401@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Miklos Szeredi <miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org>, Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Miklos, Al, Ulrich,

Could you please review the following patch.

This is a revised version of my earlier
(http://article.gmane.org/gmane.linux.man/129/ ) patch to fix
non-conformances in the utimensat() implementation.  The patch is
against 2.6.22-rc2.  Miklos wrote a patch that is already in
2.6.22-rc2 to fix the security issues that he saw from my earlier
mail.  Miklos's patch also introduced a few spec non-conformances,
but provided me with some pointers to how to improve this version
of my patch.  The following paragraphs summarize the rules that
this patch implements:

Historical permissions rules for target file (utime(), utimes()):

[a] The EACCES error (only) occurs if times is NULL:
       The times argument is a null pointer and the effective user
       ID of the process does not match the owner of the file and
       write access is denied.

[b] The EPERM error (only) occurs if times is not NULL (i.e., both
    times are being changed):
       The times argument is not a null pointer, the calling
       process' effective user ID does not match the owner of the
       file, and the calling process does not have appropriate
       privileges.
       (As noted in a thread on the security@ list, the current spec
       for utimensat() needlessly makes mention of "write access"
       for the EPERM error.  I've raise a bug against the spec, and
       it's recognized as something that needs to be fixed.)

My summary of the rules from the draft spec for utimensat() in
the upcoming POSIX.1 revision:

[c] No error needs to be generated if
    times == {UTIME_OMIT,UTIME_OMIT}.

[d] The times == {UTIMES_NOW,UTIMES_NOW} case should be treated
    like times == NULL.

[e] The times == {UTIMES_NOW,UTIMES_OMIT}
    and times == {UTIMES_OMIT,UTIMES_NOW}
    cases should be treated like times == {m,n}.

Further historical Linux rules, for files with "ext2" extended file
attributes (see chattr(1)).

[f] Append-only attribute set: If times == NULL, and we own the
    file, then the call should succeed.

[g] Immutable attribute set: the call should fail, but the error
    depends on the value in times.

The following table shows the expected results for various cases,
and indicates places where 2.6.26-rc2 deviates from those results.
The key for the columns is shown at the end of the table.  All of
these cases (as well as many others) have been tested with my
patch, and conform to the rules above.  (See
http://article.gmane.org/gmane.linux.man/129/ for the test
program used.)

====================================================
times  Owner?    File        Expected     2.6.26-rc2
 arg           Writable?      Result      deviation

N       o         w          success
N       o         !w         success
N       !o        w          success
!N-n-n  !o        w          success
N       !o        !w         EACCES  [1]
!N-n-n  !o        !w         EACCES  [1a]

!N      o         w          success
!N      o         !w         success
!N      !o        w          EPERM   [2]
!N-o-n  !o        w          EPERM   [2a]  success
!N      !o        !w         EPERM   [3]
!N-o-n  !o        !w         EPERM   [3a]  EACCES

(Append-only attribute set, file writable)
N       o         append     success [4]
!N-n-n  o         append     success [4a]  EPERM
!N-n-o  o         append     EPERM   [5]

(Immutable attribute set, file writable)
N       o         immutable  EACCES  [6]
!N-n-n  o         immutable  EACCES  [6a]  EPERM
!N-n-o  o         immutable  EPERM   [7]
====================================================

Key to table columns:
times arg:
  N       times is NULL
  !N      times is not NULL, and at least one of the fields is a
          value other than UTIME_OMIT or UTIME_NOW
  !N-n-n  times == {UTIME_NOW,UTIME_NOW}
  !N-n-o  times == {UTIME_NOW,UTIME_OMIT} ||
          times == {UTIME_OMIT,UTIME_NOW}

Owner:
  o       Process EUID is owner of file
  !o      Process EUID is not owner of file

File writable
  w       Process has permission to write to file
  !w      Process does not have permission to write to file

The "Expected result" column shows either "success" or expected
value in errno after failure

Labels in [] are provided for my own reference, and in case anyone wants to
refer to specific cases in discussing the patch.

Cheers,

Michael


Signed-off-by: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

--- linux-2.6.26-rc2/fs/utimes.c	2008-05-15 10:33:20.000000000 +0200
+++ linux-2.6.26-rc2-mtk/fs/utimes.c	2008-05-16 07:33:02.000000000 +0200
@@ -40,14 +40,9 @@

 #endif

-static bool nsec_special(long nsec)
-{
-	return nsec == UTIME_OMIT || nsec == UTIME_NOW;
-}
-
 static bool nsec_valid(long nsec)
 {
-	if (nsec_special(nsec))
+	if (nsec == UTIME_OMIT || nsec == UTIME_NOW)
 		return true;

 	return nsec >= 0 && nsec <= 999999999;
@@ -106,7 +101,9 @@
 	newattrs.ia_valid = ATTR_CTIME | ATTR_MTIME | ATTR_ATIME;
 	if (times) {
 		error = -EPERM;
-                if (IS_APPEND(inode) || IS_IMMUTABLE(inode))
+		if (!(times[0].tv_nsec == UTIME_NOW &&
+		      times[1].tv_nsec == UTIME_NOW) &&
+		    (IS_IMMUTABLE(inode) || IS_APPEND(inode)))
 			goto mnt_drop_write_and_out;

 		if (times[0].tv_nsec == UTIME_OMIT)
@@ -131,9 +128,10 @@
 	 * UTIME_NOW, then need to check permissions, because
 	 * inode_change_ok() won't do it.
 	 */
-	if (!times || (nsec_special(times[0].tv_nsec) &&
-		       nsec_special(times[1].tv_nsec))) {
+	if (!times || (times[0].tv_nsec == UTIME_NOW &&
+		       times[1].tv_nsec == UTIME_NOW)) {
 		error = -EACCES;
+
                 if (IS_IMMUTABLE(inode))
 			goto mnt_drop_write_and_out;

@@ -147,7 +145,20 @@
 					goto mnt_drop_write_and_out;
 			}
 		}
+	} else if (times && ((times[0].tv_nsec == UTIME_NOW &&
+			      times[1].tv_nsec == UTIME_OMIT)
+			     ||
+			     (times[0].tv_nsec == UTIME_OMIT &&
+			      times[1].tv_nsec == UTIME_NOW))) {
+		error = -EPERM;
+
+		if (IS_IMMUTABLE(inode) || IS_APPEND(inode))
+			goto mnt_drop_write_and_out;
+
+		if (!is_owner_or_cap(inode))
+			goto mnt_drop_write_and_out;
 	}
+
 	mutex_lock(&inode->i_mutex);
 	error = notify_change(dentry, &newattrs);
 	mutex_unlock(&inode->i_mutex);

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
