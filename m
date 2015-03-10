From: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
Subject: [PATCH] intro.1: Fix errors introduced by the commit 6732bb8b0d550262dbd73de4d0789dd9f9ad294b
Date: Tue, 10 Mar 2015 22:06:05 +0100
Message-ID: <1426021565-2106-1-git-send-email-saulery@free.fr>
References: <54FEB103.6070200@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54FEB103.6070200-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

- Restoration of the explanation session end.
- Delete two supernumerary references.

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man1/intro.1 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/man1/intro.1 b/man1/intro.1
index 9e3fa15..e509d03 100644
--- a/man1/intro.1
+++ b/man1/intro.1
@@ -135,6 +135,8 @@ $
 .fi
 .RE
 .LP
+Here typing Control-D ended the session.
+.LP
 The
 .B $
 here was the command prompt\(emit is the shell's way of indicating
@@ -331,11 +333,9 @@ and use a browser if you find HTML files there.
 .BR locate (1),
 .BR login (1),
 .BR man (1),
-.BR su (1),
 .BR xterm (1),
-.BR zsh(1),
+.BR zsh (1),
 .BR wait (2),
 .BR stdout (3),
 .BR man-pages (7),
-.BR standards (7),
-.BR shutdown (8)
+.BR standards (7)
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
