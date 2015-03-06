From: saulery-GANU6spQydw@public.gmane.org
Subject: [PATCH 3/6] intro.1: ffix
Date: Fri,  6 Mar 2015 13:47:30 +0100
Message-ID: <1425646053-7294-3-git-send-email-saulery@free.fr>
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

=46ilenames in italic

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man1/intro.1 | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/man1/intro.1 b/man1/intro.1
index 0caa0c4..216445e 100644
--- a/man1/intro.1
+++ b/man1/intro.1
@@ -200,14 +200,21 @@ Here it finds Maja's telephone number.
 Files live in a large tree, the file hierarchy.
 Each has a
 .I "pathname"
-describing the path from the root of the tree (which is called /)
+describing the path from the root of the tree (which is called
+.IR / )
 to the file.
-For example, such a full pathname might be /home/aeb/tel.
+For example, such a full pathname might be
+.IR /home/aeb/tel .
 Always using full pathnames would be inconvenient, and the name
 of a file in the current directory may be abbreviated by giving
 only the last component.
-That is why "/home/aeb/tel" can be abbreviated
-to "tel" when the current directory is "/home/aeb".
+That is why
+.I /home/aeb/tel
+can be abbreviated
+to=20
+.I tel
+when the current directory is
+.IR /home/aeb .
 .LP
 The command
 .I pwd
@@ -231,7 +238,10 @@ The command
 (with a rather baroque syntax) will find files with given name
 or other properties.
 For example, "find . \-name tel" would find
-the file "tel" starting in the present directory (which is called ".")=
=2E
+the file
+.I tel
+starting in the present directory (which is called
+.IR . ).
 And "find / \-name tel" would do the same, but starting at the root
 of the tree.
 Large searches on a multi-GB disk will be time-consuming,
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
