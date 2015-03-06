From: saulery-GANU6spQydw@public.gmane.org
Subject: [PATCH 6/6] intro.1: Prompt is not % but $
Date: Fri,  6 Mar 2015 13:47:33 +0100
Message-ID: <1425646053-7294-6-git-send-email-saulery@free.fr>
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
 man1/intro.1 | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/man1/intro.1 b/man1/intro.1
index a87a336..78ff28c 100644
--- a/man1/intro.1
+++ b/man1/intro.1
@@ -95,9 +95,9 @@ A session might go like
 .nf
 .RB "knuth login: " aeb
 .RB "Password: " ********
-.RB "% " date
+.RB "$ " date
 Tue Aug  6 23:50:44 CEST 2002
-.RB "% " cal
+.RB "$ " cal
      August 2002
 Su Mo Tu We Th Fr Sa
              1  2  3
@@ -106,37 +106,37 @@ Su Mo Tu We Th Fr Sa
 18 19 20 21 22 23 24
 25 26 27 28 29 30 31
=20
-.RB "% " ls
+.RB "$ " ls
 bin  tel
-.RB "% " "ls \-l"
+.RB "$ " "ls \-l"
 total 2
 drwxrwxr\-x   2 aeb       1024 Aug  6 23:51 bin
 \-rw\-rw\-r\-\-   1 aeb         37 Aug  6 23:52 tel
-.RB "% " "cat tel"
+.RB "$ " "cat tel"
 maja    0501\-1136285
 peter   0136\-7399214
-.RB "% " "cp tel tel2"
-.RB "% " "ls \-l"
+.RB "$ " "cp tel tel2"
+.RB "$ " "ls \-l"
 total 3
 drwxr\-xr\-x   2 aeb       1024 Aug  6 23:51 bin
 \-rw\-r\-\-r\-\-   1 aeb         37 Aug  6 23:52 tel
 \-rw\-r\-\-r\-\-   1 aeb         37 Aug  6 23:53 tel2
-.RB "% " "mv tel tel1"
-.RB "% " "ls \-l"
+.RB "$ " "mv tel tel1"
+.RB "$ " "ls \-l"
 total 3
 drwxr\-xr\-x   2 aeb       1024 Aug  6 23:51 bin
 \-rw\-r\-\-r\-\-   1 aeb         37 Aug  6 23:52 tel1
 \-rw\-r\-\-r\-\-   1 aeb         37 Aug  6 23:53 tel2
-.RB "% " "diff tel1 tel2"
-.RB "% " "rm tel1"
-.RB "% " "grep maja tel2"
+.RB "$ " "diff tel1 tel2"
+.RB "$ " "rm tel1"
+.RB "$ " "grep maja tel2"
 maja    0501\-1136285
-%
+$
 .fi
 .RE
 and here typing Control-D ended the session.
 The
-.B "% "
+.B $
 here was the command prompt\(emit is the shell's way of indicating
 that it is ready for the next command.
 The prompt can be customized
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
