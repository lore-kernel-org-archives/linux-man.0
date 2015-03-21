From: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Subject: [PATCH] credential syscalls only effect calling thread
Date: Sat, 21 Mar 2015 13:50:44 -0700
Message-ID: <1426971044-37980-1-git-send-email-shawn@churchofgit.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
---
 man2/seteuid.2   | 4 ++++
 man2/setfsgid.2  | 4 ++++
 man2/setfsuid.2  | 4 ++++
 man2/setgid.2    | 4 ++++
 man2/setresuid.2 | 4 ++++
 man2/setreuid.2  | 4 ++++
 man2/setuid.2    | 4 ++++
 7 files changed, 28 insertions(+)

diff --git a/man2/seteuid.2 b/man2/seteuid.2
index 4690fd6..d482570 100644
--- a/man2/seteuid.2
+++ b/man2/seteuid.2
@@ -138,6 +138,10 @@ are implemented as library functions that call, respectively,
 .BR setreuid (2)
 and
 .BR setresgid (2).
+
+The syscall only sets the credentials of the calling thread. The glibc wrapper
+sets up a signal handler so that it effects all threads. This means that you
+can use the syscall directly to have differn't credentials on differn't threads.
 .SH SEE ALSO
 .BR geteuid (2),
 .BR setresuid (2),
diff --git a/man2/setfsgid.2 b/man2/setfsgid.2
index d1d021d..1451b69 100644
--- a/man2/setfsgid.2
+++ b/man2/setfsgid.2
@@ -120,6 +120,10 @@ least,
 should be returned when the call fails (because the caller lacks the
 .B CAP_SETGID
 capability).
+
+The syscall only sets the credentials of the calling thread. The glibc wrapper
+sets up a signal handler so that it effects all threads. This means that you
+can use the syscall directly to have differn't credentials on differn't threads.
 .SH SEE ALSO
 .BR kill (2),
 .BR setfsuid (2),
diff --git a/man2/setfsuid.2 b/man2/setfsuid.2
index 57b125e..e04ad78 100644
--- a/man2/setfsuid.2
+++ b/man2/setfsuid.2
@@ -128,6 +128,10 @@ least,
 should be returned when the call fails (because the caller lacks the
 .B CAP_SETUID
 capability).
+
+The syscall only sets the credentials of the calling thread. The glibc wrapper
+sets up a signal handler so that it effects all threads. This means that you
+can use the syscall directly to have differn't credentials on differn't threads.
 .SH SEE ALSO
 .BR kill (2),
 .BR setfsgid (2),
diff --git a/man2/setgid.2 b/man2/setgid.2
index d9cccd5..0500961 100644
--- a/man2/setgid.2
+++ b/man2/setgid.2
@@ -80,6 +80,10 @@ supporting 32-bit IDs.
 The glibc
 .BR setgid ()
 wrapper function transparently deals with the variation across kernel versions.
+
+The syscall only sets the credentials of the calling thread. The glibc wrapper
+sets up a signal handler so that it effects all threads. This means that you
+can use the syscall directly to have differn't credentials on differn't threads.
 .SH SEE ALSO
 .BR getgid (2),
 .BR setegid (2),
diff --git a/man2/setresuid.2 b/man2/setresuid.2
index 99ab94f..eb97a9d 100644
--- a/man2/setresuid.2
+++ b/man2/setresuid.2
@@ -129,6 +129,10 @@ The glibc
 and
 .BR setresgid ()
 wrapper functions transparently deal with the variations across kernel versions.
+
+The syscall only sets the credentials of the calling thread. The glibc wrapper
+sets up a signal handler so that it effects all threads. This means that you
+can use the syscall directly to have differn't credentials on differn't threads.
 .SH SEE ALSO
 .BR getresuid (2),
 .BR getuid (2),
diff --git a/man2/setreuid.2 b/man2/setreuid.2
index c6597e9..844c5c4 100644
--- a/man2/setreuid.2
+++ b/man2/setreuid.2
@@ -191,6 +191,10 @@ The glibc
 and
 .BR setregid ()
 wrapper functions transparently deal with the variations across kernel versions.
+
+The syscall only sets the credentials of the calling thread. The glibc wrapper
+sets up a signal handler so that it effects all threads. This means that you
+can use the syscall directly to have differn't credentials on differn't threads.
 .SH SEE ALSO
 .BR getgid (2),
 .BR getuid (2),
diff --git a/man2/setuid.2 b/man2/setuid.2
index c6f870e..6a90ae0 100644
--- a/man2/setuid.2
+++ b/man2/setuid.2
@@ -142,6 +142,10 @@ supporting 32-bit IDs.
 The glibc
 .BR setuid ()
 wrapper function transparently deals with the variation across kernel versions.
+
+The syscall only sets the credentials of the calling thread. The glibc wrapper
+sets up a signal handler so that it effects all threads. This means that you
+can use the syscall directly to have differn't credentials on differn't threads.
 .SH SEE ALSO
 .BR getuid (2),
 .BR seteuid (2),
-- 
2.2.1.209.g41e5f3a

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
