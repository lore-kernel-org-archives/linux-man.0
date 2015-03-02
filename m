From: saulery-GANU6spQydw@public.gmane.org
Subject: man-pages-3.81.Announce: Replace words "and protocols" by "and configuration"
Date: Mon,  2 Mar 2015 21:49:32 +0100
Message-ID: <1425329372-11176-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

=46rom: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

There are no protocol descriptions in Section 5. Protocols are in Secti=
on 7.

See commit 12618ce888aaa8d9d70f586b61b8d532d42fbd4a

There are configuration descriptions in Section 5.

See commit db6642bdb2aa29b356ea61857623bc72793c3870

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man-pages-3.81.Announce | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man-pages-3.81.Announce b/man-pages-3.81.Announce
index d21357a..56d9a70 100644
--- a/man-pages-3.81.Announce
+++ b/man-pages-3.81.Announce
@@ -31,7 +31,7 @@ Here is a breakdown of what this distribution contain=
s:
     Section 2 =3D system calls
     Section 3 =3D libc calls
     Section 4 =3D devices (e.g., hd, sd)
-    Section 5 =3D file formats and protocols (e.g., wtmp, /etc/passwd,=
 nfs)
+    Section 5 =3D file formats and configuration (e.g., wtmp, /etc/pas=
swd)
     Section 6 =3D games (intro only)
     Section 7 =3D overviews, conventions, macro packages, etc.
     Section 8 =3D system administration (intro, plus a few other pages=
)
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
