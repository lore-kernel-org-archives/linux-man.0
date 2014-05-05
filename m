From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 73301] Documentation misses case of link, linkat, symlink,
 symlinkat giving ENOENT for a directory with a reference only held by a
 process
Date: Mon, 05 May 2014 11:06:49 +0000
Message-ID: <bug-73301-11311-RxuX4CdZ8r@https.bugzilla.kernel.org/>
References: <bug-73301-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-73301-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=73301

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #4 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I've applied the patches below.

diff --git a/man2/link.2 b/man2/link.2
index d5a697d..df2b9e2 100644
--- a/man2/link.2
+++ b/man2/link.2
@@ -291,6 +291,17 @@ file corresponding to a file descriptor created with
 See
 .BR open (2).
 .TP
+.B ENOENT
+.I oldpath
+is a relative pathname and
+.I olddirfd
+refers to a directory that has been deleted,
+or
+.I newpath
+is a relative pathname and
+.I newdirfd
+refers to a directory that has been deleted.
+.TP
 .B ENOTDIR
 .I oldpath
 is relative and

diff --git a/man2/symlink.2 b/man2/symlink.2
index a6cf6a7..8bd067f 100644
--- a/man2/symlink.2
+++ b/man2/symlink.2
@@ -210,6 +210,12 @@ The following additional errors can occur for
 .I newdirfd
 is not a valid file descriptor.
 .TP
+.B ENOENT
+.I linkpath
+is a relative pathname and
+.IR newdirfd
+refers to a directory that has been deleted.
+.TP
 .B ENOTDIR
 .I linkpath
 is relative and

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
