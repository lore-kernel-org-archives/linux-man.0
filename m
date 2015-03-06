From: saulery-GANU6spQydw@public.gmane.org
Subject: [PATCH 6/6] filesystems.5: Specifies the scope of this list and its limits.
Date: Fri,  6 Mar 2015 13:11:21 +0100
Message-ID: <1425643881-6581-7-git-send-email-saulery@free.fr>
References: <1425643881-6581-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425643881-6581-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

=46rom: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man5/filesystems.5 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man5/filesystems.5 b/man5/filesystems.5
index 2380a00..37bff37 100644
--- a/man5/filesystems.5
+++ b/man5/filesystems.5
@@ -48,7 +48,9 @@ In order to use a filesystem, you have to
 it; see
 .BR mount (8).
=20
-Below a short description of a few of the available filesystems.
+Below a short description of the available or historically available
+filesystems in Linux kernel. See kernel documentation for a comprehens=
ive
+description of all options and limitations.
 .TP 10
 .B minix
 is the filesystem used in the Minix operating system, the first to run
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
