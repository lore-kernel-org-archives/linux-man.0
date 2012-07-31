From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] futex.7: ffix
Date: Tue, 31 Jul 2012 18:24:00 -0400
Message-ID: <1343773440-24968-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

uri(7) documents that =E2=80=9COlder documents suggested inserting the =
prefix
"URL:" just before the URI, but this form has never caught on.=E2=80=9D=
 and
advise to =E2=80=9Cenclosed in angle brackets=E2=80=9D (and a few other=
 alternatives).

Reported-By: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man7/futex.7 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/futex.7 b/man7/futex.7
index 95a0ea1..241fee2 100644
--- a/man7/futex.7
+++ b/man7/futex.7
@@ -115,4 +115,4 @@ primitives: it is by no means the only one.
 .IR "Fuss, Futexes and Furwocks: Fast Userlevel Locking in Linux"
 (proceedings of the Ottawa Linux Symposium 2002),
 futex example library, futex-*.tar.bz2
-<URL:ftp://ftp.kernel.org/pub/linux/kernel/people/rusty/>.
+<ftp://ftp.kernel.org/pub/linux/kernel/people/rusty/>.
--=20
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
