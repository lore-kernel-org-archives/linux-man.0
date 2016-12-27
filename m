From: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] poll.2/select.2: Add a reference to the sigset discussion in
 sigprocmask
Date: Tue, 27 Dec 2016 14:32:29 -0500
Message-ID: <20161227193229.GA557@juliacomputing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

A little while back, I added a note to sigprocmask.2 that discussed the
difference between the libc's and the kernel's sigset_t structures.
I added that note, because I saw this being done wrong in a tool tracing
system calls (causing subtle bugs). As it turns out, the same bugs existed
for ppoll and pselect, for the same reason. I'm hoping by adding the
reference here, future writers of similar tools will find that discussion
and not make the same mistake.
---
 man2/poll.2   |  5 ++++-
 man2/select.2 | 11 +++++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/man2/poll.2 b/man2/poll.2
index 26bb10d..163df6e 100644
--- a/man2/poll.2
+++ b/man2/poll.2
@@ -416,7 +416,10 @@ The glibc
 .BR ppoll ()
 wrapper function specifies this argument as a fixed value
 (equal to
-.IR sizeof(sigset_t) ).
+.IR sizeof(kernel_sigset_t) ). See
+.BR sigprocmask(2)
+for a discussion on the differences between the kernel and the libc
+notion of the sigset.
 .SH BUGS
 See the discussion of spurious readiness notifications under the
 BUGS section of
diff --git a/man2/select.2 b/man2/select.2
index 1a5d36a..5b02fda 100644
--- a/man2/select.2
+++ b/man2/select.2
@@ -510,9 +510,9 @@ pointer, but is instead a structure of the form:
 .nf
 
 struct {
-    const sigset_t *ss;     /* Pointer to signal set */
-    size_t          ss_len; /* Size (in bytes) of object pointed
-                               to by 'ss' */
+    const kernel_sigset_t *ss;     /* Pointer to signal set */
+    size_t                 ss_len; /* Size (in bytes) of object pointed
+                                      to by 'ss' */
 };
 
 .fi
@@ -520,7 +520,10 @@ struct {
 This allows the system call to obtain both
 a pointer to the signal set and its size,
 while allowing for the fact that most architectures
-support a maximum of 6 arguments to a system call.
+support a maximum of 6 arguments to a system call. See
+.BR sigprocmask(2)
+for a discussion of the difference between the kernel and libc
+notion of the signal set.
 .SH BUGS
 POSIX allows an implementation to define an upper limit,
 advertised via the constant
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
