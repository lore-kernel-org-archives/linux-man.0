From: Fernando Luis =?ISO-8859-1?Q?V=E1zquez?= Cao
	<fernando-gVGce1chcLdL9jVzuh4AOg@public.gmane.org>
Subject: proc(5): /proc/[number]/cmdline explanation update
Date: Wed, 06 Feb 2008 15:14:10 +0900
Message-ID: <1202278450.3897.32.camel@sebastian.kern.oss.ntt.co.jp>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

It used to be true that the command line arguments were not accessible
when the process had been swapped out. In ancient kernels (circa 2.0.*)
the problem was that the kernel relied on get_phys_addr to access the
user space buffer, which stopped working as soon as the process was
swapped out. Recent kernels use get_user_pages for the same purpose and
thus they should not have that limitation.

Signed-off-by: Fernando Luis Vazquez Cao <fernando-gVGce1chcLdL9jVzuh4AOg@public.gmane.org>
---

--- proc.5.orig	2008-02-06 14:11:58.000000000 +0900
+++ proc.5	2008-02-06 14:56:22.000000000 +0900
@@ -87,12 +87,11 @@ plus one \fIunsigned long\fP value for e
 The last entry contains two zeros.
 .TP
 .I /proc/[number]/cmdline
-This holds the complete command line for the process, unless the whole
-process has been swapped out or the process is a zombie.
-In either of these latter cases, there is nothing in this file:
-that is, a read on this file will return 0 characters.
-The command line arguments appear in this file as a set of
-null-separated strings, with a further null byte after the last string.
+This holds the complete command line for the process, unless the process is a
+zombie. In the latter case, there is nothing in this file: that is, a read on
+this file will return 0 characters. The command line arguments appear in this
+file as a set of null-separated strings, with a further null byte after the
+last string.
 .TP
 .I /proc/[number]/cwd
 This is a symbolic link to the current working directory of the process.
