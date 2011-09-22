From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] posix_fadvise.2: ffix
Date: Thu, 22 Sep 2011 16:30:02 -0400
Message-ID: <1316723402-9367-1-git-send-email-taffit@debian.org>
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
 man2/posix_fadvise.2 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man2/posix_fadvise.2 b/man2/posix_fadvise.2
index dac3c9b..740e691 100644
--- a/man2/posix_fadvise.2
+++ b/man2/posix_fadvise.2
@@ -171,7 +171,7 @@ system call that orders the arguments suitably:
 .in
 .PP
 The behavior of this system call is otherwise exactly the same as
-.BR posix_fadvise().
+.BR posix_fadvise ().
 No library support is provided for this system call in glibc.
 .\" No ARM support in glibc.
 .SH BUGS
--=20
1.7.6.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
