From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 4/4] inode.7: tfix
Date: Thu, 27 Apr 2017 20:49:32 +0200
Message-ID: <20170427184932.9877-4-jwilk@jwilk.net>
References: <20170427184932.9877-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170427184932.9877-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man7/inode.7 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man7/inode.7 b/man7/inode.7
index 931dda9a4..d58391f93 100644
--- a/man7/inode.7
+++ b/man7/inode.7
@@ -92,7 +92,7 @@ The inode records the ID of the group owner of the file.
 For newly created files,
 the file group ID is either the group ID of the parent directory or
 the effective group ID of the creating process,
-dependeng on whether or not the set-group-ID bit
+depending on whether or not the set-group-ID bit
 is set on the parent directory (see below).
 The group ID of a file can be changed using
 .BR chown (2).
@@ -177,7 +177,7 @@ File creation (birth) timestamp (btime)
 The file's creation timestamp.
 This is set on file creation and not changed subsequently.
 
-The btime timestamp was not historically present on UNIX syystems
+The btime timestamp was not historically present on UNIX systems
 and is not currently supported by most Linux filesystems.
 .\" FIXME Is it supported on ext4 and XFS?
 .TP
-- 
2.13.0.rc0.306.g87b477812d

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
