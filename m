From: saulery-GANU6spQydw@public.gmane.org
Subject: [PATCH 5/6] intro.1: ffix
Date: Fri,  6 Mar 2015 13:47:32 +0100
Message-ID: <1425646053-7294-5-git-send-email-saulery@free.fr>
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

Highlighting like other commands (2)

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man1/intro.1 | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/man1/intro.1 b/man1/intro.1
index 3a29ff8..a87a336 100644
--- a/man1/intro.1
+++ b/man1/intro.1
@@ -281,7 +281,10 @@ There are thousands of commands, each with many op=
tions.
 Traditionally commands are documented on
 .IR "man pages" ,
 (like this one), so that the command "man kill" will document
-the use of the command "kill" (and "man man" document the command "man=
").
+the use of the command
+.I kill
+(and "man man" document the command
+.IR man ).
 The program
 .I man
 sends the text through some
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
