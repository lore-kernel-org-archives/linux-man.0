From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ptrace(2): userspace->user space
Date: Tue, 31 Dec 2013 01:59:13 -0500
Message-ID: <1388473153-17590-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man2/ptrace.2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index fa5d63f..f70471a 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -628,8 +628,8 @@ and
 returns the stop signal.
 If any other ptrace-stop is generated at the same time (for example,
 if a signal is sent to the tracee), this ptrace-stop happens.
-If none of the above applies (for example, if the tracee is running in userspace),
-it stops with
+If none of the above applies (for example, if the tracee is running in user
+space), it stops with
 .B PTRACE_EVENT_STOP
 with
 .I WSTOPSIG(status)
-- 
1.8.4.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
