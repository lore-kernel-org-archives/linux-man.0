From: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] chroot.2: not intended for security, document attack
Date: Sun, 14 Jun 2015 13:25:04 +0200
Message-ID: <1434281104-28129-1-git-send-email-jann@thejh.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

It is unfortunate that this discourages this use of chroot(2) without
pointing out alternative solutions - for example, OpenSSH and vsftpd
both still rely on chroot(2) for security.

Bind mounts should theoretically be usable as a replacement, but
currently, they have a similar problem (CVE-2015-2925) that hasn't
been fixed in ~6 months, so I'd rather not add it to the manpage as a
solution before a fix lands.
---
 man2/chroot.2 | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/man2/chroot.2 b/man2/chroot.2
index 4a70db4..357baba 100644
--- a/man2/chroot.2
+++ b/man2/chroot.2
@@ -73,7 +73,30 @@ capability) may call
 .BR chroot ().
 
 This call changes an ingredient in the pathname resolution process
-and does nothing else.
+and does nothing else. In particular, it is not intended to be used
+for any kind of security purpose, neither to fully sandbox a process nor
+to restrict filesystem syscalls. In the past,
+.BR chroot ()
+has been used by daemons to restrict themselves prior to passing paths
+supplied by untrusted users into syscalls like
+.BR open (2).
+However, if a folder is moved out of the chroot directory, an attacker
+can exploit that to get out of the chroot directory as well. The easiest
+way to do that is to
+.BR chdir (2)
+to the to-be-moved directory, wait for it to be moved out, then open a
+path like ../../../etc/passwd.
+
+
+.\" This is how the "slightly trickier variation" works:
+.\" https://github.com/QubesOS/qubes-secpack/blob/master/QSBs/qsb-014-2015.txt#L142
+A slightly
+trickier variation also works under some circumstances if
+.BR chdir (2)
+is not permitted. If a daemon allows a "chroot directory" to be specified,
+that usually means that if you want to prevent remote users from accessing
+files outside the chroot directory, you must ensure that folders are never
+moved out of it.
 
 This call does not change the current working directory,
 so that after the call \(aq\fI.\fP\(aq can
@@ -87,6 +110,7 @@ by doing:
 
 This call does not close open file descriptors, and such file
 descriptors may allow access to files outside the chroot tree.
+
 .SH RETURN VALUE
 On success, zero is returned.
 On error, \-1 is returned, and
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
