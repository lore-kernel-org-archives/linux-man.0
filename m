From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] lseek.2: wfix
Date: Fri, 23 Sep 2011 23:04:14 -0400
Message-ID: <1316833454-6563-1-git-send-email-taffit@debian.org>
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
 man2/lseek.2 |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/man2/lseek.2 b/man2/lseek.2
index 9a59fa6..8a0580f 100644
--- a/man2/lseek.2
+++ b/man2/lseek.2
@@ -140,7 +140,6 @@ always return the offset of the end of the file,
 and making
 .BR SEEK_DATA
 always return
-return
 .IR offset
 (i.e., even if the location referred to by
 .I offset
--=20
1.7.6.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
