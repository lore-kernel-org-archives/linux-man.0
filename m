From: saulery-GANU6spQydw@public.gmane.org
Subject: [PATCH 2/6] intro.1: Add cross references cited
Date: Fri,  6 Mar 2015 13:47:29 +0100
Message-ID: <1425646053-7294-2-git-send-email-saulery@free.fr>
References: <1425646053-7294-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425646053-7294-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

=46rom: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man1/intro.1 | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/man1/intro.1 b/man1/intro.1
index c554884..0caa0c4 100644
--- a/man1/intro.1
+++ b/man1/intro.1
@@ -300,4 +300,15 @@ and use a browser if you find HTML files there.
 .\" Actual examples? Separate section for each of cat, cp, ...?
 .\" gzip, bzip2, tar, rpm
 .SH SEE ALSO
+.BR=C2=A0ash (1),
+.BR bash (1),
+.BR chsh (1),
+.BR=C2=A0csh (1),
+.BR=C2=A0locate (1),
+.BR login (1),
+.BR man (1),
+.BR xterm (1),
+.BR zsh(1),
+.BR wait (2),
+.BR man-pages (7),
 .BR standards (7)
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
