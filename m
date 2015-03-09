From: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
Subject: [PATCH] intro.1: some improvements
Date: Mon,  9 Mar 2015 21:26:37 +0100
Message-ID: <1425932797-16050-1-git-send-email-saulery@free.fr>
References: <54F6BBC0.4010401@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54F6BBC0.4010401-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

- Add a section Logout and poweroff and change login/logout by open/clo=
se session
- Add ref. to other common shells dash(1), ksh(1)
- Add a ref. to stdout(3)
- Separate cp and mv descriptions
- Add examples of special cases of cd
- Add su(1) and shutdown(8) ref. for section Logout and poweroff
- Move Control-D to section Logout and poweroff
- Fix some little format errors

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man1/intro.1 | 59 ++++++++++++++++++++++++++++++++++++++++++++--------=
-------
 1 file changed, 44 insertions(+), 15 deletions(-)

diff --git a/man1/intro.1 b/man1/intro.1
index e9daccf..4b95871 100644
--- a/man1/intro.1
+++ b/man1/intro.1
@@ -60,12 +60,10 @@ That is faster and more powerful,
 but requires finding out what the commands are.
 Below a bare minimum, to get started.
 .SS Login
-In order to start working, you probably first have to login,
-that is, give your username and password.
-See also
-.BR login (1).
+In order to start working, you probably first have to open a session b=
y
+giving, your username and password.
 The program
-.I login
+.BR login (1)
 now starts a
 .I shell
 (command interpreter) for you.
@@ -73,6 +71,19 @@ In case of a graphical login, you get a screen with =
menus or icons
 and a mouse click will start a shell in a window.
 See also
 .BR xterm (1).
+.SS Logout and poweroff
+When you work is finished,
+you can press Control-D to close the current session.
+This does not turn off the machine.
+Only superusers have access to this command.
+If you are the single user you can also not log off
+and becoming a superuser by typing the command
+.BR su (1).
+Also you must type yours password.
+Finally enter the command "shutdown -P +1",
+which will turn off the computer after one minute.
+See
+.BR shutdown (8).
 .SS The shell
 One types commands to the
 .IR shell ,
@@ -85,12 +96,14 @@ The standard one is called
 See also
 .BR ash (1),
 .BR bash (1),
+.BR chsh (1),
 .BR csh (1),
-.BR zsh (1),
-.BR chsh (1).
+.BR dash (1),
+.BR ksh (1),
+.BR zsh (1).
+.LP
+A session might go like:
 .LP
-A session might go like
-
 .RS
 .nf
 .RB "knuth login: " aeb
@@ -134,7 +147,7 @@ maja    0501\-1136285
 $
 .fi
 .RE
-and here typing Control-D ended the session.
+.LP
 The
 .B $
 here was the command prompt\(emit is the shell's way of indicating
@@ -171,15 +184,19 @@ The command
 .I cat
 will show the contents of a file.
 (The name is from "concatenate and print": all files given as
-parameters are concatenated and sent to "standard output", here
+parameters are concatenated and sent to "standard output"
+(see
+.BR stdout (3)),
+here
 the terminal screen.)
 .LP
 The command
 .I cp
 (from "copy") will copy a file.
-On the other hand, the command
+.LP
+The command
 .I mv
-(from "move") only renames it.
+(from "move"), on the other hand, only renames it.
 .LP
 The command
 .I diff
@@ -223,7 +240,14 @@ prints the current directory.
 The command
 .I cd
 changes the current directory.
-Try "cd /" and "pwd" and "cd" and "pwd".
+.LP
+Try alternatively
+.I cd
+and
+.I pwd
+commands and explore
+.I cd
+usage: "cd", "cd .", "cd ..", "cd /" and "cd ~".
 .SS Directories
 The command
 .I mkdir
@@ -315,11 +339,16 @@ and use a browser if you find HTML files there.
 .BR bash (1),
 .BR chsh (1),
 .BR csh (1),
+.BR dash (1),
+.BR ksh (1),
 .BR locate (1),
 .BR login (1),
 .BR man (1),
+.BR su (1),
 .BR xterm (1),
 .BR zsh(1),
 .BR wait (2),
+.BR stdout (3),
 .BR man-pages (7),
-.BR standards (7)
+.BR standards (7),
+.BR shutdown (8)
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
