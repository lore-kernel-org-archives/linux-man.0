From: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] fcntl.2: Expand documentation on flock64
Date: Tue, 27 Dec 2016 14:31:42 -0500
Message-ID: <20161227193142.GA552@juliacomputing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

In particular, the F_OFD_* variants should always be used with
`struct flock64` argument, since no `struct flock` variant exists,
and the structures are not the same when __USE_FILE_OFFSET64 is
not set on 64bit systems (similar problems would of course occur
with using struct flock for F_*LK64 under the same circumstance,
but that's probably somewhat less likely).
---
 man2/fcntl.2 | 39 +++++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/man2/fcntl.2 b/man2/fcntl.2
index 7aa191c..12ec58c 100644
--- a/man2/fcntl.2
+++ b/man2/fcntl.2
@@ -334,7 +334,7 @@ then the existing lock is converted to the new lock type.
 an existing lock if the byte range specified by the new lock does not
 precisely coincide with the range of the existing lock.)
 .TP
-.BR F_SETLK " (\fIstruct flock *\fP)"
+.BR F_SETLK " (\fIstruct flock *\fP) and " F_SETLK64 " (\fIstruct flock64 *\fP)"
 Acquire a lock (when
 .I l_type
 is
@@ -359,7 +359,7 @@ or
 (The error returned in this case differs across implementations,
 so POSIX requires a portable application to check for both errors.)
 .TP
-.BR F_SETLKW " (\fIstruct flock *\fP)"
+.BR F_SETLKW " (\fIstruct flock *\fP) and " F_SETLKW64 " (\fIstruct flock64 *\fP)"
 As for
 .BR F_SETLK ,
 but if a conflicting lock is held on the file, then wait for that
@@ -373,7 +373,7 @@ set to
 see
 .BR signal (7)).
 .TP
-.BR F_GETLK " (\fIstruct flock *\fP)"
+.BR F_GETLK " (\fIstruct flock *\fP) and " F_GETLK64 " (\fIstruct flock64 *\fP)"
 On input to this call,
 .I lock
 describes a lock we would like to place on the file.
@@ -550,7 +550,7 @@ when using the commands described below.
 The commands for working with open file description locks are analogous
 to those used with traditional locks:
 .TP
-.BR F_OFD_SETLK " (\fIstruct flock *\fP)"
+.BR F_OFD_SETLK " (\fIstruct flock64 *\fP)"
 Acquire an open file description lock (when
 .I l_type
 is
@@ -571,7 +571,7 @@ this call returns \-1 and sets
 to
 .BR EAGAIN .
 .TP
-.BR F_OFD_SETLKW " (\fIstruct flock *\fP)"
+.BR F_OFD_SETLKW " (\fIstruct flock64 *\fP)"
 As for
 .BR F_OFD_SETLK ,
 but if a conflicting lock is held on the file, then wait for that lock to be
@@ -585,7 +585,7 @@ set to
 see
 .BR signal (7)).
 .TP
-.BR F_OFD_GETLK " (\fIstruct flock *\fP)"
+.BR F_OFD_GETLK " (\fIstruct flock64 *\fP)"
 On input to this call,
 .I lock
 describes an open file description lock we would like to place on the file.
@@ -1773,16 +1773,27 @@ Consequently, an
 .BR fcntl64 ()
 system call was added in Linux 2.4.
 The newer system call employs a different structure for file locking,
-.IR flock64 ,
-and corresponding commands,
-.BR F_GETLK64 ,
-.BR F_SETLK64 ,
-and
-.BR F_SETLKW64 .
-However, these details can be ignored by applications using glibc, whose
+.IR flock64 .
+In general, all fcntl commands whose argument is of type
+.IR flock64
+need to go through this newer system call.
+However, the glibc
 .BR fcntl ()
 wrapper function transparently employs the more recent system call
-where it is available.
+where it is available. Nevertheless, applications are still responsible
+for passing the correct variant of the argument struct (either
+.IR flock64
+or
+.IR flock
+). Note that depending on preprocessor definitions, the
+.IR flock
+struct may actually be identical to
+.IR flock64
+struct in the libc headers, in which case the libc transparently uses the correct
+command. Users of the raw system call, must take care to not accidentally use
+the libc's definition of the
+.IR flock
+struct which may disagree with that of the kernel.
 
 .SS Record locks
 Since kernel 2.0, there is no interaction between the types of lock
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
