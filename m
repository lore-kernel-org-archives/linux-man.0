From: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
Subject: [PATCH 1/2] ioctl_list.2: srcfix
Date: Sun, 15 Mar 2015 03:16:28 +0100
Message-ID: <1426385789-12406-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

=46ix a warning of groff: line 527: warning [p 6, 2.3i]: cannot adjust =
line

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man2/ioctl_list.2 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man2/ioctl_list.2 b/man2/ioctl_list.2
index 00f6c4b..994e0f4 100644
--- a/man2/ioctl_list.2
+++ b/man2/ioctl_list.2
@@ -525,9 +525,9 @@ l l l l.
 // <include/linux/scsi.h>
 .TS
 l l l.
-0x00005382	SCSI_IOCTL_GET_IDLUN	struct { int [2]; } *
-0x00005383	SCSI_IOCTL_TAGGED_ENABLE	void
-0x00005384	SCSI_IOCTL_TAGGED_DISABLE	void
+0x00005382	SCSI_IOCTL_GET_IDLUN       struct { int [2]; } *
+0x00005383	SCSI_IOCTL_TAGGED_ENABLE   void
+0x00005384	SCSI_IOCTL_TAGGED_DISABLE  void
 .TE
 .TS
 l l l l.
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
