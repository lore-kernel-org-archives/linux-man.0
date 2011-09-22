From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] madvise.2: tfix
Date: Wed, 21 Sep 2011 22:13:46 -0400
Message-ID: <1316657626-30903-1-git-send-email-taffit@debian.org>
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
index 59e6846..c87877c 100644
--- a/man2/madvise.2
+++ b/man2/madvise.2
@@ -226,9 +226,9 @@ to replace them with huge pages.
 The kernel will also allocate huge pages directly when the region is
 naturally aligned to the huge page size (see
 .BR posix_memalign (2)).
-This feature is primarily aimmed at applications that use large mappin=
gs of
+This feature is primarily aimed at applications that use large mapping=
s of
 data and access large regions of that memory at a time (e.g. virtualiz=
ation
-systems such as qemu).
+systems such as QEMU).
 It can very easily waste memory (e.g. a 2MB mapping that only ever acc=
esses
 1 byte will result in 2MB of wired memory instead of one 4KB page).
 See the kernel source file
--=20
1.7.6.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
