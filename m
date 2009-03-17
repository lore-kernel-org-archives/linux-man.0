From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ptrace(2): only reference sys/user.h
Date: Tue, 17 Mar 2009 19:58:01 -0400
Message-ID: <1237334281-20353-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The kernel no longer installs linux/user.h, so update references to
sys/user.h.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man2/ptrace.2 |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index f75435d..0611bfe 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -133,8 +133,7 @@ Reads a word at offset
 .I addr
 in the child's USER area,
 which holds the registers and other information about the process
-(see \fI<linux/user.h>\fP and \fI<sys/user.h>\fP).
-The word is returned as the result of the
+(see \fI<sys/user.h>\fP).  The word is returned as the result of the
 .BR ptrace ()
 call.
 Typically the offset must be word-aligned, though this might vary by
@@ -165,7 +164,7 @@ some modifications to the USER area are disallowed.
 .BR PTRACE_GETREGS ", " PTRACE_GETFPREGS
 Copies the child's general purpose or floating-point registers,
 respectively, to location \fIdata\fP in the parent.
-See \fI<linux/user.h>\fP for information on
+See \fI<sys/user.h>\fP for information on
 the format of this data.
 (\fIaddr\fP is ignored.)
 .TP
-- 
1.6.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
