From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] ioctl_list.2: path to sockios.h
Date: Tue, 29 Dec 2015 22:27:08 +0100
Message-ID: <1451424428-5140-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

sockios.h is now in include/uapi

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/ioctl_list.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/ioctl_list.2 b/man2/ioctl_list.2
index ad2472a..8366673 100644
--- a/man2/ioctl_list.2
+++ b/man2/ioctl_list.2
@@ -540,7 +540,7 @@ l l l.
 0x80027501	SMB_IOC_GETMOUNTUID	uid_t *
 .TE
 
-// <include/linux/sockios.h> see
+// <include/uapi/linux/sockios.h> see
 .BR netdevice (7)
 
 .TS
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
