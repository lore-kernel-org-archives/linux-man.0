From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2] core(5): add more details for output paths and the crash handler
Date: Thu,  6 Oct 2016 13:24:37 -0400
Message-ID: <20161006172437.3329-1-vapier@gentoo.org>
References: <20160928111450.32157-1-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160928111450.32157-1-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

People sometimes assume that the crash handler runs in the same context
as the crashing process.  They would be incorrect :).

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
v2
	- update references & word smithing as requested

 man5/core.5 | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/man5/core.5 b/man5/core.5
index c587da5209c8..096f8152f445 100644
--- a/man5/core.5
+++ b/man5/core.5
@@ -208,6 +208,16 @@ and
 (see below)
 is nonzero, then .PID will be appended to the core filename.
 
+Paths are interpreted according to the settings that are active for the
+crashing process.
+That means the current
+.BR mount_namespaces (7),
+the current working directory (found via
+.BR getcwd (2)),
+and the current
+.BR chroot (2)
+path.
+
 Since version 2.4, Linux has also provided
 a more primitive method of controlling
 the name of the core dump file.
@@ -240,9 +250,33 @@ The program must be specified using an absolute pathname (or a
 pathname relative to the root directory, \fI/\fP),
 and must immediately follow the '|' character.
 .IP *
+The program pathname is interpreted with respect to the initial mount namespace
+as it is always executed there.
+It is not affected by the settings of the crashing process
+(e.g. the process using
+.BR chroot (2)
+or
+.BR mount_namespaces (7)
+or similar modifications).
+.IP *
 The process created to run the program runs as user and group
 .IR root .
 .IP *
+Running as
+.I root
+does not confer any exceptional security bypasses.
+Namely, LSMs (e.g. SELinux) are still active and may prevent the handler
+from accessing details about the crashed process via
+.I /proc/PID
+.IP *
+The process created runs in the initial namespaces (pid, mount, user, etc...)
+and not in the namespaces of the crashing process.
+You can utilize specifiers like
+.I %P
+to find the right
+.I /proc/PID
+directory and probe/enter the crashing process's namespaces if needed.
+.IP *
 Command-line arguments can be supplied to the
 program (since Linux 2.6.24),
 delimited by white space (up to a total line length of 128 bytes).
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
