From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] madvise.2: ffix
Date: Thu, 22 Sep 2011 15:59:01 -0400
Message-ID: <1316721541-3504-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org


Signed-off-by: David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
---
 man2/madvise.2 |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/madvise.2 b/man2/madvise.2
index 59e6846..77e5aad 100644
--- a/man2/madvise.2
+++ b/man2/madvise.2
@@ -201,7 +201,7 @@ The
 and
 .BR MADV_UNMERGEABLE
 operations are only available if the kernel was configured with
-.BR CONFIG_KSM.
+.BR CONFIG_KSM .
 .TP
 .BR MADV_UNMERGEABLE " (since Linux 2.6.32)"
 Undo the effect of an earlier
@@ -239,7 +239,7 @@ The
 and
 .BR MADV_NOHUGEPAGE
 operations are only available if the kernel was configured with
-.BR CONFIG_TRANSPARENT_HUGEPAGE.
+.BR CONFIG_TRANSPARENT_HUGEPAGE .
 .TP
 .BR MADV_NOHUGEPAGE " (since Linux 2.6.38)"
 Ensures that memory in the address range specified by
--=20
1.7.6.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
