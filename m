From: Kevin Lyda <kevin-lVvlXWpnww44d9/VWYMlNA@public.gmane.org>
Subject: [PATCH] Fix a few misspellings.
Date: Sun, 2 Oct 2011 15:31:51 +0100
Message-ID: <20111002151639.159AA274128@banshee.ie.suberic.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Some typo fixes.  The one I'm not sure of is the fix for man2/mknodat.2.
The resulting sentence doesn't seem sensible.  If anyone has a better
suggestion I can change it, but I'm really not sure what the original
author was trying to say.

The line was modified last year in change 2cee1088.

https://github.com/mkerrisk/man-pages/commit/2cee1088

Kevin

---
 man2/mknodat.2         |    2 +-
 man2/rt_sigqueueinfo.2 |    2 +-
 man3/netlink.3         |    2 +-
 man3/termios.3         |    2 +-
 man5/nsswitch.conf.5   |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/man2/mknodat.2 b/man2/mknodat.2
index ee4176a..fce438a 100644
--- a/man2/mknodat.2
+++ b/man2/mknodat.2
@@ -49,7 +49,7 @@ Feature Test Macro Requirements for glibc (see
 Since glibc 2.10:
  _XOPEN_SOURCE\ >=\ 700
 .\" Other FTM combinations will also expose mknodat(), but this function was
-.\" added in SUSv4, maked XSI, so we'll just document what the standard says
+.\" added in SUSv4, made XSI, so we'll just document what the standard says
 .TP 4
 Before glibc 2.10:
 _ATFILE_SOURCE
diff --git a/man2/rt_sigqueueinfo.2 b/man2/rt_sigqueueinfo.2
index 4f7e8ce..581d025 100644
--- a/man2/rt_sigqueueinfo.2
+++ b/man2/rt_sigqueueinfo.2
@@ -55,7 +55,7 @@ system call sends the signal
 .I sig
 to the thread group with the ID
 .IR tgid .
-(The term "thread group" is synonomous with "process", and
+(The term "thread group" is synonymous with "process", and
 .I tid
 corresponds to the traditional UNIX process ID.)
 The signal will be delivered to an arbitrary member of the thread group
diff --git a/man3/netlink.3 b/man3/netlink.3
index 37ff6b9..898bd6a 100644
--- a/man3/netlink.3
+++ b/man3/netlink.3
@@ -73,7 +73,7 @@ of the message buffer.
 This macro decrements it by the length of the message header.
 .TP
 .BR NLMSG_OK ()
-Return true if the netlink message is not truncated and ok to parse.
+Return true if the netlink message is not truncated and OK to parse.
 .TP
 .BR NLMSG_PAYLOAD ()
 Return the length of the payload associated with the
diff --git a/man3/termios.3 b/man3/termios.3
index 21eb3f0..dd16721 100644
--- a/man3/termios.3
+++ b/man3/termios.3
@@ -614,7 +614,7 @@ is set, and then not passed as input.
 Switch character (SWTCH).
 Used in System V to switch shells in
 .IR "shell layers" ,
-a precedessor to shell job control.
+a predecessor to shell job control.
 .TP
 .B VTIME
 Timeout in deciseconds for noncanonical read (TIME).
diff --git a/man5/nsswitch.conf.5 b/man5/nsswitch.conf.5
index c4f16a2..88705c5 100644
--- a/man5/nsswitch.conf.5
+++ b/man5/nsswitch.conf.5
@@ -199,7 +199,7 @@ The default
 action for this is `return'.
 .TP
 .B notfound
-The lookup process works ok but the needed value was not found.
+The lookup process works OK but the needed value was not found.
 The default action is `continue'.
 .TP
 .B unavail
-- 
1.7.0.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
