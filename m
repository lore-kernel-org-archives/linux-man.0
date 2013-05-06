From: Kevin Easton <kevin-RFfraI6bZkdAfugRpC6u6w@public.gmane.org>
Subject: [PATCH] clone.2, execve.2: Document interaction of execve(2) with
 CLONE_FILES
Date: Mon, 6 May 2013 16:14:41 +1000
Message-ID: <20130506061441.GA9249@chicago.guarana.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

This patch is against man-pages-3.51.  It documents the fact that a
successful execve(2) in a process that is sharing a file descriptor table
results in unsharing the table.

I discovered this through testing and verified it by source inspection - 
there is a call to unshare_files() early in do_execve_common().

    - Kevin

diff -ur man-pages-3.51.orig/man2/clone.2 man-pages-3.51/man2/clone.2
--- man-pages-3.51.orig/man2/clone.2    2013-04-19 21:57:19.000000000 +1000
+++ man-pages-3.51/man2/clone.2 2013-05-06 15:42:06.841539649 +1000
@@ -206,6 +206,9 @@
 .BR fcntl (2)
 .B F_SETFD
 operation), the other process is also affected.
+If a process sharing a file descriptor table calls
+.BR execve (2),
+its file descriptor table is duplicated (unshared).

 If
 .B CLONE_FILES
Only in man-pages-3.51/man2: clone.2.orig
diff -ur man-pages-3.51.orig/man2/execve.2 man-pages-3.51/man2/execve.2
--- man-pages-3.51.orig/man2/execve.2   2013-04-19 21:57:19.000000000 +1000
+++ man-pages-3.51/man2/execve.2        2013-05-06 15:42:06.841539649 +1000
@@ -204,6 +204,11 @@
 .B SIGCHLD
 (see
 .BR clone (2)).
+.IP *
+The file descriptor table is unshared, undoing the effect of the
+.B CLONE_FILES
+flag of
+.BR clone (2).
 .PP
 Note the following further points:
 .IP * 3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
