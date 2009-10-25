From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ptrace(2): note SPARC deviation wrt get/set regs
Date: Sun, 25 Oct 2009 03:15:09 -0400
Message-ID: <1256454909-22861-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Unfortunately the SPARC ptrace port handles the addr/data args the opposite
of every other arch.  It expects the struct to be in addr and the data is
ignored.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man2/ptrace.2 |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index 68601df..7cce955 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -168,6 +168,8 @@ respectively, to location \fIdata\fP in the parent.
 See \fI<sys/user.h>\fP for information on
 the format of this data.
 (\fIaddr\fP is ignored.)
+
+Note that SPARC systems have the meaning of \fIdata\fP and \fIaddr\fP reversed.
 .TP
 .BR PTRACE_GETSIGINFO " (since Linux 2.3.99-pre6)"
 Retrieve information about the signal that caused the stop.
@@ -184,6 +186,8 @@ As for
 some general
 purpose register modifications may be disallowed.
 (\fIaddr\fP is ignored.)
+
+Note that SPARC systems have the meaning of \fIdata\fP and \fIaddr\fP reversed.
 .TP
 .BR PTRACE_SETSIGINFO " (since Linux 2.3.99-pre6)"
 Set signal information.
-- 
1.6.5.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
