From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 1/3] ioctl_iflags.2: tfix
Date: Wed, 25 Jan 2017 16:37:31 +0100
Message-ID: <20170125153733.3588-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/ioctl_iflags.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/ioctl_iflags.2 b/man2/ioctl_iflags.2
index 5fa53d517..d54931be8 100644
--- a/man2/ioctl_iflags.2
+++ b/man2/ioctl_iflags.2
@@ -146,7 +146,7 @@ into the same disk block as the file metadata.
 .BR FS_PROJINHERIT_FL " \(aqP\(aq (since Linux 4.5)"
 .\" commit 040cb3786d9b25293b8b0b05b90da0f871e1eb9b
 .\" Flag name was added in Linux 4.4
-.\" FIXME Not cuurentl supported because not in FS_FL_USER_MODIFIABLE?
+.\" FIXME Not currently supported because not in FS_FL_USER_MODIFIABLE?
 Inherit the quota project ID.
 Files and subdirectories will inherit the project ID of the directory.
 This flag can be applied only to directories.
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
