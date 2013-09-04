From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 60836] Non-existing inode-max documented
Date: Wed, 04 Sep 2013 08:05:06 +0000
Message-ID: <bug-60836-11311-1LR5ONNDyc@https.bugzilla.kernel.org/>
References: <bug-60836-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-60836-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=60836

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         Resolution|---                         |CODE_FIX

--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Marko Myllynen from comment #0)
> Created attachment 107391 [details]
> Drop references to prehistoric /proc/sys/fs/inode-max

Man-pages tends to keep historical information, so rather than dropping the
text, it's best to describe when it ceased to be true.

> Both Linux man pages and kernel's Documentation/sysctl/fs.txt document
> /proc/sys/fs/inode-max which was gone in early 2.3 (~14 years ago).

Sad, but true: the documentation is way out of date.

> My patch proposal for man pages attached, however I'm uncertain how
> preshrink works these days so please double check before applying.

"preshrink" also went away in Linux 2.4, it seems: it is nowadays a dummy value
(always zero).

I've applied thge patch below. Thanks for the report.

Cheers,

Michael

diff --git a/man5/proc.5 b/man5/proc.5
index 1c42717..e40dd4d 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -2497,15 +2497,6 @@ The kernel constant
 imposes an upper limit on the value that may be placed in
 .IR file-max .

-If you increase
-.IR /proc/sys/fs/file-max ","
-be sure to increase
-.I /proc/sys/fs/inode-max
-to 3-4 times the new
-value of
-.IR /proc/sys/fs/file-max ","
-or you will run out of inodes.
-
 Privileged processes
 .RB ( CAP_SYS_ADMIN )
 can override the
@@ -2531,15 +2522,18 @@ a past peak in the usage of open file handles.
 Since Linux 2.6, the kernel does deallocate freed file handles,
 and the "free file handles" value is always zero.
 .TP
-.I /proc/sys/fs/inode-max
+.IR /proc/sys/fs/inode-max " (only present until Linux 2.2)"
 This file contains the maximum number of in-memory inodes.
-On some (2.4) systems, it may not be present.
 This value should be 3-4 times larger
 than the value in
 .IR file-max ,
 since \fIstdin\fP, \fIstdout\fP
 and network sockets also need an inode to handle them.
 When you regularly run out of inodes, you need to increase this value.
+
+Starting with Linux 2.4,
+there is no longer a static limit on the number of inodes,
+and this file is removed.
 .TP
 .I /proc/sys/fs/inode-nr
 This file contains the first two values from
@@ -2551,20 +2545,23 @@ contains seven numbers:
 .IR nr_inodes ,
 .IR nr_free_inodes ,
 .IR preshrink ,
-and four dummy values.
+and four dummy values (always zero).
+
 .I nr_inodes
 is the number of inodes the system has allocated.
-This can be slightly more than
-.I inode-max
-because Linux allocates them one page full at a time.
+.\" This can be slightly more than
+.\" .I inode-max
+.\" because Linux allocates them one page full at a time.
 .I nr_free_inodes
 represents the number of free inodes.
+
 .I preshrink
 is nonzero when the
 .I nr_inodes
 >
 .I inode-max
-and the system needs to prune the inode list instead of allocating more.
+and the system needs to prune the inode list instead of allocating more;
+since Linux 2.4, this field is a dummy value (always zero).
 .TP
 .IR /proc/sys/fs/inotify " (since Linux 2.6.13)"
 This directory contains files

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
