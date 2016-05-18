From: Omar Sandoval <osandov-nWWhXC5lh1RBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 2/2] mount.2: MS_BIND still ignores mountflags
Date: Wed, 18 May 2016 11:57:30 -0700
Message-ID: <b7d41a470056188c253e61095fe40e02cbf03040.1463597825.git.osandov@fb.com>
References: <cb66a4ad2808c6d6054e483348134d2e05405084.1463597825.git.osandov@fb.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cb66a4ad2808c6d6054e483348134d2e05405084.1463597825.git.osandov-b10kYP2dOMg@public.gmane.org>
In-Reply-To: <cb66a4ad2808c6d6054e483348134d2e05405084.1463597825.git.osandov-b10kYP2dOMg@public.gmane.org>
References: <cb66a4ad2808c6d6054e483348134d2e05405084.1463597825.git.osandov-b10kYP2dOMg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Omar Sandoval <osandov-b10kYP2dOMg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

From: Omar Sandoval <osandov-b10kYP2dOMg@public.gmane.org>

This is clear from the do_mount() function in the kernel as of v4.6.

Signed-off-by: Omar Sandoval <osandov-b10kYP2dOMg@public.gmane.org>
---
 man2/mount.2 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man2/mount.2 b/man2/mount.2
index 419e22da800f..bd4c35bd15ff 100644
--- a/man2/mount.2
+++ b/man2/mount.2
@@ -98,10 +98,10 @@ The
 and
 .IR data
 arguments are ignored.
-Up until Linux 2.6.26,
+The
 .I mountflags
-was also ignored
-.\" with the exception of the "hidden" MS_REC mountflags bit
+argument is also ignored, with the exception of
+.B MS_REC
 (the bind mount has the same mount options as
 the underlying mount point).
 .TP
-- 
2.8.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
