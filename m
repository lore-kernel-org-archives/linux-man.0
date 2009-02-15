From: Jens Thoms Toerring <jt-ea6gLeB8pccb1SvskN2V4Q@public.gmane.org>
Subject: [patch] sem_open.3 and sem_overview.7
Date: Sun, 15 Feb 2009 19:24:37 +0100
Message-ID: <20090215182437.GA12604@toerring.de>
Reply-To: jt-ea6gLeB8pccb1SvskN2V4Q@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Dear Michael,

   I have here two small patches for the man pages sem_open(3)
and sem_overview(7). They result from a recent discussion in
c.o.l.d.a where someone had problems creating a named semaphore
using a name of "/tmp/somename". From the man pages it's not
absolutely clear that this isn't allowed. Moreover, one gets an
errno of ENOENT in this case which doesn't seem to be covered
in sem_open(3). Thus I made a modification in sem_overview(7)
so that it now says that slashes embedded into to the name are
not allowed and to sem_open(3) to say that ENOENT can also be
the result of having O_CREAT set in oflag but using an invalid
name.

    The actual situation is a bit more complicated as a look at
the glibc code for sem_open() shows (you can actually use a slash
in the name, e.g. "/aaa/bbb", but then a directory named sem.aaa
you have write permissions for must already exist in /dev/shm,
moreover, the slash at the start isn't needed). But I guess that
isn't of much relevance to the user and probably is better left
untold since putting it into writing might make it more difficult
to change the behaviour later on.

Here's the diff for sem_overview(7):

----------8<------------------------------------------------------
--- sem_overview.7	2009-02-09 03:14:25.000000000 +0100
+++ sem_overview.7.new	2009-02-15 18:40:48.000000000 +0100
@@ -48,6 +48,9 @@
 Two processes can operate on the same named semaphore by passing
 the same name to
 .BR sem_open (3).
+Note that
+.IR /somename
+may not contain slashes except the required one at the very start.
 
 The
 .BR sem_open (3)
@@ -113,7 +116,7 @@
 normally mounted under
 .IR /dev/shm ,
 with names of the form
-.IR \fBsem.\fPname .
+.IR \fBsem.\fPsomename .
 
 Since Linux 2.6.19, ACLs can be placed on files under this directory,
 to control object permissions on a per-user and per-group basis.
----------8<------------------------------------------------------

and here's the one for sem_open(3):

----------8<------------------------------------------------------
--- sem_open.3	2009-02-09 03:14:20.000000000 +0100
+++ sem_open.3.new	2009-02-15 18:46:11.000000000 +0100
@@ -149,10 +149,17 @@
 The
 .B O_CREAT
 flag was not specified in
-.IR oflag ,
+.IR oflag
 and no semaphore with this
 .I name
-exists.
+exists, or the
+.B O_CREAT
+flag
+was set in 
+.IR oflag
+but
+.I name
+wasn't well-formed.
 .TP
 .B ENOMEM
 Insufficient memory.
----------8<------------------------------------------------------

Both are against your newest version 3.18.

                            Best regards, Jens
-- 
  \   Jens Thoms Toerring  ________      jt-ea6gLeB8pccb1SvskN2V4Q@public.gmane.org
   \_______________________________      http://toerring.de
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
