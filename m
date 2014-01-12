From: Ruben Kerkhof <ruben-pkfekA+zf0jEimEGZCN+oA@public.gmane.org>
Subject: [PATCH] Fix a few double words
Date: Sun, 12 Jan 2014 21:55:16 +0100
Message-ID: <1389560116-7676-1-git-send-email-ruben@rubenkerkhof.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ruben Kerkhof <ruben-pkfekA+zf0jEimEGZCN+oA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Ruben Kerkhof <ruben-pkfekA+zf0jEimEGZCN+oA@public.gmane.org>
---
 man2/setpgid.2   | 2 +-
 man2/sigaction.2 | 2 +-
 man3/mcheck.3    | 2 +-
 man5/proc.5      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/man2/setpgid.2 b/man2/setpgid.2
index 492d32a88955..317b4079c206 100644
--- a/man2/setpgid.2
+++ b/man2/setpgid.2
@@ -159,7 +159,7 @@ call, which takes arguments
 .I pid
 and
 .IR pgid ,
-is is a wrapper function that calls
+is a wrapper function that calls
 
     setpgid(pid, pgid)
 
diff --git a/man2/sigaction.2 b/man2/sigaction.2
index 4142f3337d2e..c132b1f206ad 100644
--- a/man2/sigaction.2
+++ b/man2/sigaction.2
@@ -379,7 +379,7 @@ of the (configurable) system jiffy (see
 .\" measurement unit was HZ, which was the same as clock ticks
 .\" (sysconf(_SC_CLK_TCK)).  In 2.6, HZ became configurable, and
 .\" was *still* used as the unit to return the info these fields,
-.\" with the result that the field values depended on the the
+.\" with the result that the field values depended on the
 .\" configured HZ.  Of course, the should have been measured in
 .\" USER_HZ instead, so that sysconf(_SC_CLK_TCK) could be used to
 .\" convert to seconds.  I have a queued patch to fix this:
diff --git a/man3/mcheck.3 b/man3/mcheck.3
index e59da317f7be..c2ef9527089c 100644
--- a/man3/mcheck.3
+++ b/man3/mcheck.3
@@ -79,7 +79,7 @@ is called beforehand.
 If the system detects an inconsistency in the heap,
 the caller-supplied function pointed to by
 .I abortfunc
-is invoked with a single argument argument,
+is invoked with a single argument,
 .IR mstatus ,
 that indicates what type of inconsistency was detected.
 If
diff --git a/man5/proc.5 b/man5/proc.5
index 2024c75004db..62771bec79ec 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -2689,7 +2689,7 @@ a process's filesystem UID is normally the same as its effective UID);
 .IP *
 the link is not in a sticky world-writable directory; or
 .IP *
-the symbolic link and and its parent directory have the same owner (UID)
+the symbolic link and its parent directory have the same owner (UID)
 .RE
 .IP
 A system call that fails to follow a symbolic link
-- 
1.8.5.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
