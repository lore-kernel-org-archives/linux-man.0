From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH] ioctl_list.2: TFD_IOC_SET_TICKS
Date: Sat, 18 Apr 2015 16:56:15 +0200
Message-ID: <1429368975-15015-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyrill Gorcunov <gorcunov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

timerfd_create.2 mentions TFD_IOC_SET_TICKS. We should add it to
ioctl_list.2, too.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/ioctl_list.2 | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/man2/ioctl_list.2 b/man2/ioctl_list.2
index ba993a1..d0390c7 100644
--- a/man2/ioctl_list.2
+++ b/man2/ioctl_list.2
@@ -738,6 +738,13 @@ l l l l.
 0xC0044DFF	SOUND_MIXER_WRITE_RECSRC	int *	// I-O
 .TE
 
+// <include/linux/timerfd.h> see
+.BR timerfd_create (2)
+.TS
+l l l l.
+0x40085400	TFD_IOC_SET_TICKS	uint64_t *
+.TE
+
 // <include/linux/umsdos_fs.h>
 .TS
 l l l l.
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
