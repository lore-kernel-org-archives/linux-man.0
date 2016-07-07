From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 3/3] mount_namespaces.7: tfix
Date: Thu,  7 Jul 2016 11:57:38 +0200
Message-ID: <1467885458-625-3-git-send-email-jwilk@jwilk.net>
References: <1467885458-625-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467885458-625-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man7/mount_namespaces.7 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man7/mount_namespaces.7 b/man7/mount_namespaces.7
index fdd7368..1640c5b 100644
--- a/man7/mount_namespaces.7
+++ b/man7/mount_namespaces.7
@@ -677,7 +677,7 @@ as for a bind operation on each mount in the subtree.
 (Unbindable mounts are automatically pruned at the target mount point.)
 
 For further details, see
-.I Documenation/filesystems/sharedsubtrees.txt
+.I Documentation/filesystems/sharedsubtree.txt
 in the kernel source tree.
 .\"
 .SS Move (MS_MOVE) semantics
@@ -715,7 +715,7 @@ dest(B)	shared    |	shared	shared	slave+shared	invalid
 Note: moving a mount that resides under a shared mount is invalid.
 
 For further details, see
-.I Documenation/filesystems/sharedsubtrees.txt
+.I Documentation/filesystems/sharedsubtree.txt
 in the kernel source tree.
 .\"
 .SS Mount semantics
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
