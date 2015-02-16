From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] fork.2: child and parent run in separate memory spaces
Date: Mon, 16 Feb 2015 11:40:46 +0100
Message-ID: <1424083246-6162-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

fork.2 should clearly point out that child and parent
process run in separate memory spaces.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/fork.2 | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/man2/fork.2 b/man2/fork.2
index e6695ad..dce9bff 100644
--- a/man2/fork.2
+++ b/man2/fork.2
@@ -46,9 +46,25 @@ fork \- create a child process
 .SH DESCRIPTION
 .BR fork ()
 creates a new process by duplicating the calling process.
-The new process, referred to as the \fIchild\fP,
-is an exact duplicate of the calling process,
-referred to as the \fIparent\fP, except for the following points:
+The new process is referred to as the
+.I child
+process.
+The calling process is referred to as the
+.I parent
+process.
+
+The child process and the parent process run in separate memory spaces.
+At the time of
+.BR fork ()
+both memory spaces have the same content.
+Memory writes, file mappings
+.RB ( mmap (2)),
+and unmappings
+.RB ( munmap (2))
+performed by one of the processes do not affect the other.
+
+The child process is an exact duplicate of the parent
+process except for the following points:
 .IP * 3
 The child has its own unique process ID,
 and this PID does not match the ID of any existing process group
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
