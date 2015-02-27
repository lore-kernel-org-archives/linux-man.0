From: saulery-GANU6spQydw@public.gmane.org
Subject: [patch] intro.1: Improve help for newcommers
Date: Fri, 27 Feb 2015 01:26:17 +0100
Message-ID: <1424996777-10600-4-git-send-email-saulery@free.fr>
References: <1424996777-10600-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424996777-10600-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

=46rom: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

- Cite man pages of all commands
- Explain how to logout and shutdown in a new subsection
- Appoint more options (shell, browser, cd, stdout)
- New subsection: Editing files
- Prompt is not % but $
- Better highlighting

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man1/intro.1 | 221 ++++++++++++++++++++++++++++++++++++++++++---------=
--------
 1 file changed, 158 insertions(+), 63 deletions(-)

diff --git a/man1/intro.1 b/man1/intro.1
index 20d36d7..f7633b6 100644
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
y giving
+your username and password.
 The program
-.I login
+.BR login (1)
 now starts a
 .I shell
 (command interpreter) for you.
@@ -73,6 +71,15 @@ In case of a graphical login, you get a screen with =
menus or icons
 and a mouse click will start a shell in a window.
 See also
 .BR xterm (1).
+.SS Logout and poweroff
+When you work is finished, you can press Control-D to close the curren=
t
+session. This does not turn off the machine. Only superusers have acce=
ss to
+this command. If you are the single user you can also not log off and =
becoming
+a superuser by typing the command
+.BR su (1).
+Also you must type yours password. Finally enter the command "shutdown=
 -P +1",
+which will turn off the computer after one minute. See
+.BR shutdown (8).
 .SS The shell
 One types commands to the
 .IR shell ,
@@ -85,19 +92,21 @@ The standard one is called
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
 .LP
-A session might go like
+A session might go like:
=20
 .RS
 .nf
 .BI "knuth login: " aeb
 .BI "Password: " ********
-.BI "% " date
+.BI "$ " date
 Tue Aug  6 23:50:44 CEST 2002
-.BI "% " cal
+.BI "$ " cal
      August 2002
 Su Mo Tu We Th Fr Sa
              1  2  3
@@ -106,37 +115,36 @@ Su Mo Tu We Th Fr Sa
 18 19 20 21 22 23 24
 25 26 27 28 29 30 31
=20
-.BI "% " ls
+.BI "$ " ls
 bin  tel
-.BI "% " "ls \-l"
+.BI "$ " "ls \-l"
 total 2
 drwxrwxr\-x   2 aeb       1024 Aug  6 23:51 bin
 \-rw\-rw\-r\-\-   1 aeb         37 Aug  6 23:52 tel
-.BI "% " "cat tel"
+.BI "$ " "cat tel"
 maja    0501\-1136285
 peter   0136\-7399214
-.BI "% " "cp tel tel2"
-.BI "% " "ls \-l"
+.BI "$ " "cp tel tel2"
+.BI "$ " "ls \-l"
 total 3
 drwxr\-xr\-x   2 aeb       1024 Aug  6 23:51 bin
 \-rw\-r\-\-r\-\-   1 aeb         37 Aug  6 23:52 tel
 \-rw\-r\-\-r\-\-   1 aeb         37 Aug  6 23:53 tel2
-.BI "% " "mv tel tel1"
-.BI "% " "ls \-l"
+.BI "$ " "mv tel tel1"
+.BI "$ " "ls \-l"
 total 3
 drwxr\-xr\-x   2 aeb       1024 Aug  6 23:51 bin
 \-rw\-r\-\-r\-\-   1 aeb         37 Aug  6 23:52 tel1
 \-rw\-r\-\-r\-\-   1 aeb         37 Aug  6 23:53 tel2
-.BI "% " "diff tel1 tel2"
-.BI "% " "rm tel1"
-.BI "% " "grep maja tel2"
+.BI "$ " "diff tel1 tel2"
+.BI "$ " "rm tel1"
+.BI "$ " "grep maja tel2"
 maja    0501\-1136285
-.B "% "
+.B "$ "
 .fi
 .RE
-and here typing Control-D ended the session.
 The
-.B "% "
+.B "$ "
 here was the command prompt\(emit is the shell's way of indicating
 that it is ready for the next command.
 The prompt can be customized
@@ -146,13 +154,13 @@ An assignment PS1=3D"What next, master? "
 would change the prompt as indicated.
 .LP
 We see that there are commands
-.I date
+.BR date (1)
 (that gives date and time), and
-.I cal
+.BR cal (1)
 (that gives a calendar).
 .LP
 The command
-.I ls
+.BR ls (1)
 lists the contents of the current directory\(emit tells you what
 files you have.
 With a
@@ -163,75 +171,90 @@ permissions people have for reading and/or changi=
ng the file.
 For example, the file "tel" here is 37 bytes long, owned by aeb
 and the owner can read and write it, others can only read it.
 Owner and permissions can be changed by the commands
-.I chown
+.BR chown (1)
 and
-.IR chmod .
+.BR chmod (1).
 .LP
 The command
-.I cat
+.BR cat (1)
 will show the contents of a file.
 (The name is from "concatenate and print": all files given as
-parameters are concatenated and sent to "standard output", here
-the terminal screen.)
+parameters are concatenated and sent to "standard output" (see
+.BR stdout (3)
+), here the terminal screen.)
 .LP
 The command
-.I cp
+.BR cp (1)
 (from "copy") will copy a file.
-On the other hand, the command
-.I mv
-(from "move") only renames it.
 .LP
 The command
-.I diff
+.BR mv (1)
+(from "move"), on the other hand, only renames it.
+.LP
+The command
+.BR diff (1)
 lists the differences between two files.
 Here there was no output because there were no differences.
 .LP
 The command
-.I rm
+.BR rm (1)
 (from "remove") deletes the file, and be careful! it is gone.
 No wastepaper basket or anything.
 Deleted means lost.
 .LP
 The command
-.I grep
+.BR grep (1)
 (from "g/re/p") finds occurrences of a string in one or more files.
 Here it finds Maja's telephone number.
 .SS Pathnames and the current directory
 Files live in a large tree, the file hierarchy.
 Each has a
-.I "pathname"
-describing the path from the root of the tree (which is called /)
+.I pathname
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
+to
+.I tel
+when the current directory is
+.IR /home/aeb .
 .LP
 The command
-.I pwd
+.BR pwd (1)
 prints the current directory.
 .LP
 The command
-.I cd
+.BR cd (1)
 changes the current directory.
-Try "cd /" and "pwd" and "cd" and "pwd".
+.LP
+Try alternatively
+.IR cd " and " pwd
+commands and explore cd usage: "cd", "cd .", "cd ..", "cd /", and "cd =
~".
 .SS Directories
 The command
-.I mkdir
+.BR mkdir (1)
 makes a new directory.
 .LP
 The command
-.I rmdir
+.BR rmdir (1)
 removes a directory if it is empty, and complains otherwise.
 .LP
 The command
-.I find
+.BR find (1)
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
@@ -239,14 +262,14 @@ and it may be better to use
 .BR locate (1).
 .SS Disks and filesystems
 The command
-.I mount
+.BR mount (8)
 will attach the filesystem found on some disk (or floppy, or CDROM or =
so)
 to the big filesystem hierarchy.
 And
-.I umount
+.BR umount (8)
 detaches it again.
 The command
-.I df
+.BR df (1)
 will tell you how much of your disk is still free.
 .SS Processes
 On a UNIX system many user and system processes run simultaneously.
@@ -255,29 +278,41 @@ The one you are talking to runs in the
 the others in the
 .IR background .
 The command
-.I ps
+.BR ps (1)
 will show you which processes are active and what numbers these
 processes have.
 The command
-.I kill
+.BR kill (1)
 allows you to get rid of them.
 Without option this is a friendly
 request: please go away.
 And "kill \-9" followed by the number
 of the process is an immediate kill.
 Foreground processes can often be killed by typing Control-C.
+.SS Editing files
+The traditional file editor of the Unix world is
+.BR vi (1),
+an its improved version
+.BR vim (1).
+This is why it is good to know at least its basic commands in an emerg=
ency.
+See
+.BR vimtutor (1)
+to learn the survival commands.
 .SS Getting information
 There are thousands of commands, each with many options.
 Traditionally commands are documented on
-.IR "man pages" ,
+.BR man-pages (7),
 (like this one), so that the command "man kill" will document
-the use of the command "kill" (and "man man" document the command "man=
").
+the use of the command
+.I kill
+(and "man man" document the command
+.IR man ).
 The program
-.I man
+.BR man (1)
 sends the text through some
-.IR pager ,
+.BR pager (1),
 usually
-.IR less .
+.BR less (1).
 Hit the space bar to get the next page, hit q to quit.
 .LP
 In documentation it is customary to refer to man pages
@@ -290,14 +325,74 @@ and explanations is useful.
 .LP
 A lot of GNU/FSF software is provided with info files.
 Type "info info"
-for an introduction on the use of the program "info".
+for an introduction on the use of the program
+.BR info (1).
 .LP
 Special topics are often treated in HOWTOs.
 Look in
 .I /usr/share/doc/howto/en
-and use a browser if you find HTML files there.
+and use a browser if you find HTML files there. The most common text b=
ased web browsers are:
+.BR elinks (1),
+.BR links (1),
+.BR lynx (1)
+.BR w3m (1).
 .\"
 .\" Actual examples? Separate section for each of cat, cp, ...?
 .\" gzip, bzip2, tar, rpm
 .SH SEE ALSO
-.BR standards (7)
+.BR ash (1),
+.BR bash (1),
+.BR cal (1),
+.BR cat (1),
+.BR cd (1),
+.BR chmod (1),
+.BR chown (1),
+.BR chsh (1),
+.BR cp (1),
+.BR csh (1),
+.BR dash (1),
+.BR date (1),
+.BR df (1),
+.BR diff (1),
+.BR elinks (1),
+.BR find (1),
+.BR grep (1),
+.BR info (1),
+.BR kill (1),
+.BR ksh (1),
+.BR less (1),
+.BR locate (1),
+.BR ls (1),
+.BR lynx (1),
+.BR links (1),
+.BR lynx (1),
+.BR man (1),
+.BR mkdir (1),
+.BR mv (1),
+.BR pager (1),
+.BR ps (1),
+.BR pwd (1),
+.BR rm (1),
+.BR rmdir (1),
+.BR su (1),
+.BR vi (1),
+.BR vim (1),
+.BR vimtutor (1),
+.BR w3m (1),
+.BR zsh (1),
+.BR login (1),
+.BR xterm (1),
+.BR intro (2),
+.BR wait (2),
+.BR intro (3),
+.BR stdout (3),
+.BR intro (4),
+.BR intro (5),
+.BR intro (6),
+.BR intro (7),
+.BR man-pages (7),
+.BR standards (7),
+.BR intro (8),
+.BR mount (8),
+.BR shutdown (8),
+.BR umount (8).
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
