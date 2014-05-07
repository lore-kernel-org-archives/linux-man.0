From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] UNIX V6 or V7: add unbreakable space
Date: Wed,  7 May 2014 03:09:57 +0200
Message-ID: <1399424997-15748-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/execve.2  | 4 ++--
 man2/getuid.2  | 4 ++--
 man2/stat.2    | 2 +-
 man3/termios.3 | 2 +-
 man3/ttyslot.3 | 6 +++---
 man7/glob.7    | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/man2/execve.2 b/man2/execve.2
index fa5df8d..0351da9 100644
--- a/man2/execve.2
+++ b/man2/execve.2
@@ -537,7 +537,7 @@ command-line arguments and environment variables has changed.
 .\" that could be exploited for denial of service by a suitably crafted
 .\" ELF binary. There are no known problems with 2.0.34 or 2.2.15.
 .SS Historical
-With UNIX V6, the argument list of an
+With UNIX\ V6, the argument list of an
 .BR exec ()
 call was ended by 0,
 while the argument list of
@@ -546,7 +546,7 @@ was ended by \-1.
 Thus, this argument list was not directly usable in a further
 .BR exec ()
 call.
-Since UNIX V7, both are NULL.
+Since UNIX\ V7, both are NULL.
 .SH EXAMPLE
 The following program is designed to be execed by the second program below.
 It just echoes its command-line arguments, one per line.
diff --git a/man2/getuid.2 b/man2/getuid.2
index 6ca3052..80504c3 100644
--- a/man2/getuid.2
+++ b/man2/getuid.2
@@ -46,11 +46,11 @@ These functions are always successful.
 POSIX.1-2001, 4.3BSD.
 .SH NOTES
 .SS History
-In UNIX V6 the
+In UNIX\ V6 the
 .BR getuid ()
 call returned
 .IR "(euid << 8) + uid" .
-UNIX V7 introduced separate calls
+UNIX\ V7 introduced separate calls
 .BR getuid ()
 and
 .BR geteuid ().
diff --git a/man2/stat.2 b/man2/stat.2
index 0ac48d5..eca3854 100644
--- a/man2/stat.2
+++ b/man2/stat.2
@@ -598,7 +598,7 @@ macros are not in
 POSIX.1-1996, but both are present in POSIX.1-2001;
 the former is from SVID 4, the latter from SUSv2.
 .LP
-UNIX V7 (and later systems) had
+UNIX\ V7 (and later systems) had
 .BR S_IREAD ,
 .BR S_IWRITE ,
 .BR S_IEXEC ,
diff --git a/man3/termios.3 b/man3/termios.3
index 71a1e6c..65f6c791 100644
--- a/man3/termios.3
+++ b/man3/termios.3
@@ -1009,7 +1009,7 @@ and
 .BR cfsetspeed ()
 are nonstandard, but available on the BSDs.
 .SH NOTES
-UNIX V7 and several later systems have a list of baud rates
+UNIX\ V7 and several later systems have a list of baud rates
 where after the fourteen values B0, ..., B9600 one finds the
 two constants EXTA, EXTB ("External A" and "External B").
 Many systems extend the list with much higher baud rates.
diff --git a/man3/ttyslot.3 b/man3/ttyslot.3
index 2d9fa15..918ac14 100644
--- a/man3/ttyslot.3
+++ b/man3/ttyslot.3
@@ -58,7 +58,7 @@ Well, let's first look at some history.
 .SS Ancient history
 There used to be a file
 .I /etc/ttys
-in UNIX V6, that was read by the
+in UNIX\ V6, that was read by the
 .BR init (8)
 program to find out what to do with each terminal line.
 Each line consisted of three characters.
@@ -73,7 +73,7 @@ Thus a typical line was "18\-".
 A hang on some line was solved by changing the \(aq1\(aq to a \(aq0\(aq,
 signaling init, changing back again, and signaling init again.
 .LP
-In UNIX V7 the format was changed: here the second character
+In UNIX\ V7 the format was changed: here the second character
 was the argument to
 .BR getty (8)
 indicating the sequence of line speeds to try (\(aq0\(aq was: cycle through
@@ -118,7 +118,7 @@ returns the current user's index in the user accounting data base.
 If successful, this function returns the slot number.
 On error (e.g., if none of the file descriptors 0, 1 or 2 is
 associated with a terminal that occurs in this data base)
-it returns 0 on UNIX V6 and V7 and BSD-like systems,
+it returns 0 on UNIX\ V6 and V7 and BSD-like systems,
 but \-1 on System V-like systems.
 .SH ATTRIBUTES
 .SS Multithreading (see pthreads(7))
diff --git a/man7/glob.7 b/man7/glob.7
index 98e6fc8..60207a2 100644
--- a/man7/glob.7
+++ b/man7/glob.7
@@ -27,7 +27,7 @@
 .SH NAME
 glob \- globbing pathnames
 .SH DESCRIPTION
-Long ago, in UNIX V6, there was a program
+Long ago, in UNIX\ V6, there was a program
 .I /etc/glob
 that would expand wildcard patterns.
 Soon afterward this became a shell built-in.
-- 
2.0.0.rc0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
