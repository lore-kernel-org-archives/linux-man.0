From: Chris =?UTF-8?Q?=22=E3=82=AF=22?= Heath <chris-FSXMH2gLahXJKwlM9GxbOw@public.gmane.org>
Subject: [PATCH] Epoll documentation
Date: Fri, 22 Feb 2008 09:04:25 -0500
Message-ID: <1203689065.3021.79.camel@linux.heathens.co.nz>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Davide Libenzi <davidel-AhlLAIvw+VEjIGhXcJzhZg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

A few months ago, Davide Libenzi wrote this message on lkml:
  http://marc.info/?l=linux-kernel&m=119368443105320&w=2
but apparently hasn't found time yet to review the man page.

So I figured it might work better if I propose a patch and get Davide to
ack it or suggest further changes.  My proposed patch to epoll(7) is
below.

Feedback would be appreciated.  In particular, I removed reference to
threads in A1 because I was unable to find a test case where I didn't
get EEXIST.  Maybe I'm missing something.

Chris


--- man-pages-2.78/man7/epoll.7.orig	2008-02-11 06:53:44.000000000 -0500
+++ man-pages-2.78/man7/epoll.7	2008-02-21 23:43:53.000000000 -0500
@@ -234,11 +234,11 @@
 What happens if you add the same file descriptor to an epoll set twice?
 .TP
 .B A1
-You will probably get
+You will get
 .BR EEXIST .
-However, it is possible that two
-threads may add the same file descriptor twice.
-This is a harmless condition.
+However, it is possible to add a
+.BR dup (2)
+of that file descriptor to the epoll set.
 .TP
 .B Q2
 Can two
@@ -285,7 +285,15 @@
 sets automatically?
 .TP
 .B A6
-Yes.
+Only if the underlying open file description (see
+.BR open (2))
+is closed.
+For example, if the file descriptor was duplicated with a
+.BR dup (2)
+or
+.BR fork (2)
+call, it will only be removed from epoll sets when all duplicate
+descriptors are closed.
 .TP
 .B Q7
 If more than one event occurs between
