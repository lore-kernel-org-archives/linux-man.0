From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 1/2] ptrace.2: tfix
Date: Mon,  4 Jan 2016 16:59:34 +0100
Message-ID: <1451923175-4316-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index 1942456..395fe12 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -2085,7 +2085,7 @@ A process can
 .B PTRACE_ATTACH
 to any other process running under the same UID,
 as long as the tracee is dumpable (i.e., it did
-did not transition UIDs or start start privileged, and it has not employed
+not transition UIDs or start start privileged, and it has not employed
 the
 .BR prctl (2)
 .B PR_SET_DUMPABLE
-- 
2.6.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
