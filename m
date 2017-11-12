From: Ahmad Fatoum <ahmad-WDeAlZut61o@public.gmane.org>
Subject: [PATCH] Include <sys/types.h> in SYNOPSIS for pid_t
Date: Sun, 12 Nov 2017 14:29:21 +0100
Message-ID: <20171112132921.78840-1-ahmad@a3f.at>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Ahmad Fatoum <ahmad-WDeAlZut61o@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

vfork(2), getpid(2) and others which return pid_t already do this.

Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Ahmad Fatoum <ahmad-WDeAlZut61o@public.gmane.org>
---
 man2/fork.2    | 2 ++
 man2/getsid.2  | 2 ++
 man2/setpgid.2 | 2 ++
 man2/setsid.2  | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/man2/fork.2 b/man2/fork.2
index 931e8f76f..235a88e50 100644
--- a/man2/fork.2
+++ b/man2/fork.2
@@ -40,6 +40,8 @@
 .SH NAME
 fork \- create a child process
 .SH SYNOPSIS
+.B #include <sys/types.h>
+.br
 .B #include <unistd.h>
 .PP
 .B pid_t fork(void);
diff --git a/man2/getsid.2 b/man2/getsid.2
index 9f2bf9f8d..a912b651f 100644
--- a/man2/getsid.2
+++ b/man2/getsid.2
@@ -28,6 +28,8 @@
 .SH NAME
 getsid \- get session ID
 .SH SYNOPSIS
+.B #include <sys/types.h>
+.br
 .B #include <unistd.h>
 .PP
 .BI "pid_t getsid(pid_t" " pid" );
diff --git a/man2/setpgid.2 b/man2/setpgid.2
index 03a83a845..be451e765 100644
--- a/man2/setpgid.2
+++ b/man2/setpgid.2
@@ -49,6 +49,8 @@
 .SH NAME
 setpgid, getpgid, setpgrp, getpgrp \- set/get process group
 .SH SYNOPSIS
+.B #include <sys/types.h>
+.br
 .B #include <unistd.h>
 .PP
 .BI "int setpgid(pid_t " pid ", pid_t " pgid );
diff --git a/man2/setsid.2 b/man2/setsid.2
index 91150da77..d2f4cc3b2 100644
--- a/man2/setsid.2
+++ b/man2/setsid.2
@@ -33,6 +33,8 @@
 setsid \- creates a session and sets the process group ID
 .SH SYNOPSIS
 .ad l
+.B #include <sys/types.h>
+.br
 .B #include <unistd.h>
 .PP
 .B pid_t setsid(void);
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
