From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 2/4] userfaultfd.2: tfix
Date: Thu, 27 Apr 2017 20:49:30 +0200
Message-ID: <20170427184932.9877-2-jwilk@jwilk.net>
References: <20170427184932.9877-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170427184932.9877-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/userfaultfd.2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/userfaultfd.2 b/man2/userfaultfd.2
index e6fcd3f3b..8b89162b2 100644
--- a/man2/userfaultfd.2
+++ b/man2/userfaultfd.2
@@ -253,7 +253,7 @@ Generated when the faulting process invokes
 The event details are available in the
 .I fork
 field.
-.\" FIXME descirbe duplication of userfault file descriptor during fork
+.\" FIXME describe duplication of userfault file descriptor during fork
 .TP
 .BR UFFD_EVENT_REMAP " (since Linux 4.11)"
 Generated when the faulting process invokes
@@ -321,7 +321,7 @@ The new address of the memory range that was remapped using
 .BR mremap (2).
 .TP
 .I remap.len
-The original length of the the memory range that was remapped using
+The original length of the memory range that was remapped using
 .BR mremap (2).
 .TP
 .I remove.start
-- 
2.13.0.rc0.306.g87b477812d

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
