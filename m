From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] ioctl_list.2: add reference to netdevice.7
Date: Tue, 29 Dec 2015 22:26:51 +0100
Message-ID: <1451424411-5095-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

netdevice.7 describes most of the IOCTLs of sockios.h

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/ioctl_list.2 | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/man2/ioctl_list.2 b/man2/ioctl_list.2
index 0cca57e..ad2472a 100644
--- a/man2/ioctl_list.2
+++ b/man2/ioctl_list.2
@@ -540,7 +540,9 @@ l l l.
 0x80027501	SMB_IOC_GETMOUNTUID	uid_t *
 .TE
 
-// <include/linux/sockios.h>
+// <include/linux/sockios.h> see
+.BR netdevice (7)
+
 .TS
 l l l l.
 0x0000890B	SIOCADDRT	const struct rtentry *	// MORE
@@ -973,4 +975,5 @@ l l l.
 .TE
 .SH SEE ALSO
 .BR ioctl (2),
-.BR ioctl_fat (2)
+.BR ioctl_fat (2),
+.BR netdevice (7)
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
