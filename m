From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 1/2] Changes.old: tfix
Date: Fri, 17 Mar 2017 00:31:00 +0100
Message-ID: <20170316233101.1343-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 Changes.old | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Changes.old b/Changes.old
index ff7cb55cd..12f598925 100644
--- a/Changes.old
+++ b/Changes.old
@@ -44650,7 +44650,7 @@ system.3
 
 random.4
     Michael Kerrisk  [Jon Jensen]
-        Note that entropY-avail will be a number in the range 0..4096
+        Note that entropy_avail will be a number in the range 0..4096
 
 core.5
     Michael Kerrisk
@@ -44819,7 +44819,7 @@ signal.7
     Michael Kerrisk
         SIGXCPU: add reference to setrlimit(2)
     Michael Kerrisk
-        Migrated signal-safety discussion to new signal-safet(7) page
+        Migrated signal-safety discussion to new signal-safety(7) page
 
 unix.7
     Michael Kerrisk  [Sergey Polovko]
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
