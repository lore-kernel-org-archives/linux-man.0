From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 13/19] svipc.7: tfix
Date: Sun,  6 Dec 2015 19:47:26 +0100
Message-ID: <1449427652-3585-13-git-send-email-jwilk@jwilk.net>
References: <1449427652-3585-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449427652-3585-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man7/svipc.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/svipc.7 b/man7/svipc.7
index 94b5e82..c6a12eb 100644
--- a/man7/svipc.7
+++ b/man7/svipc.7
@@ -34,7 +34,7 @@
 .\"   * Documentation of the various /proc interfaces should move into
 .\"     those files (from proc(5)), and references in the various *.2
 .\"     pages that refer to the /proc files should be adjusted.
-.\"   * The only part that uniquely belongs in svipc(7) is perphaps
+.\"   * The only part that uniquely belongs in svipc(7) is perhaps
 .\"     the discussion of ipc_perm.
 .\"
 .TH SVIPC 7 2014-09-21 "Linux" "Linux Programmer's Manual"
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
