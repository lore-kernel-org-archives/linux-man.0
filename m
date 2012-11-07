From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] stat.2: EOVERFLOW not only for st_size, not in bits
Date: Wed,  7 Nov 2012 20:13:25 +0100
Message-ID: <1352315606-28494-1-git-send-email-spaillard@debian.org>
References: <20121022235500.GA16004@glenfiddich.mraw.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121022235500.GA16004-8MNqHwMchPhGJ/Ie3qa20WD2FQJk+8+b@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

egblic: sysdeps/unix/sysv/linux/xstatconv.c it can be st_ino, st_size or
st_blocks

See http://bugs.debian.org/604928

Reported-by: Lionel Elie Mamane <lionel-vlyxx04YXHqHXe+LvDLADg@public.gmane.org>
---
 man2/stat.2 |   11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/man2/stat.2 b/man2/stat.2
index d4838a2..c7886b0 100644
--- a/man2/stat.2
+++ b/man2/stat.2
@@ -343,15 +343,18 @@ is not a directory.
 .B EOVERFLOW
 .RB ( stat ())
 .I path
-refers to a file whose size cannot be represented in the type
-.IR off_t .
-This can occur when an application compiled on a 32-bit platform without
+refers to a file whose size, inode number, or number of blocks cannot be represented in their respective type
+.IR off_t ,
+.IR ino_t ,
+or
+.IR blkcnt_t .
+This usually occurs when an application compiled on a 32-bit platform without
 .I -D_FILE_OFFSET_BITS=64
 calls
 .BR stat ()
 on a file whose size exceeds
 .I (1<<31)-1
-bits.
+bytes.
 .SH "CONFORMING TO"
 These system calls conform to SVr4, 4.3BSD, POSIX.1-2001.
 .\" SVr4 documents additional
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
