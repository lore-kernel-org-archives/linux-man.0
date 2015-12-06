From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 02/19] Changes.old: tfix
Date: Sun,  6 Dec 2015 19:47:15 +0100
Message-ID: <1449427652-3585-2-git-send-email-jwilk@jwilk.net>
References: <1449427652-3585-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449427652-3585-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 Changes.old | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Changes.old b/Changes.old
index 48602a4..1a0e13d 100644
--- a/Changes.old
+++ b/Changes.old
@@ -16020,7 +16020,7 @@ vfork.2
 
 clock_getres.3
     Michael Kerrisk
-        CLOCK_PROCESS_CPUTIME_ID and CLOCK_THREAD_CPUTIME_ID not setabble
+        CLOCK_PROCESS_CPUTIME_ID and CLOCK_THREAD_CPUTIME_ID not settable
             According to POSIX.1-2001, the CLOCK_PROCESS_CPUTIME_ID and
             CLOCK_THREAD_CPUTIME_ID clocks should be settable, but
             currently they are not.
@@ -20618,7 +20618,7 @@ sigstack.3
     Michael Kerrisk
         New link to sigaltstack.2
             No new programs should use sigstack(3). Point the user to the
-            better sigalstack(2), whose man page briefly mentions sigstack(3).
+            better sigaltstack(2), whose man page briefly mentions sigstack(3).
 
 vlimit.3
     Michael Kerrisk
@@ -33063,7 +33063,7 @@ inotify.7
 
 libc.7
     Michael Kerrisk
-        Clarify man-pages policy on documenting C libraries other tahn glibc
+        Clarify man-pages policy on documenting C libraries other than glibc
     Michael Kerrisk
         Use absolute dates in discussion of libc vs glibc
 
@@ -35619,7 +35619,7 @@ statfs.2
         Document the 'f_flags' field added in Linux 2.6.36
     Michael Kerrisk
         Clarify that 'statfs' structure has some padding bytes
-            The number of padding bytes has changed over tyme, as some
+            The number of padding bytes has changed over time, as some
             bytes are used, so describe this aspect of the structure
             less explicitly.
     Tao Ma
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
