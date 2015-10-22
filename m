From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 1/4] bpf.2: tfix
Date: Thu, 22 Oct 2015 16:44:11 +0200
Message-ID: <1445525054-2880-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/bpf.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/bpf.2 b/man2/bpf.2
index 385d44a..5d583c7 100644
--- a/man2/bpf.2
+++ b/man2/bpf.2
@@ -85,7 +85,7 @@ unloaded when the process exits.
 In some cases, for example,
 .BR tc-bpf (8),
 the program will continue to stay alive inside the kernel even after the
-the process that loaded the program exits.
+process that loaded the program exits.
 In that case,
 the tc subsystem holds a reference to the eBPF program after the
 file descriptor has been closed by the user-space program.
-- 
2.6.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
