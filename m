From: Omar Sandoval <osandov-nWWhXC5lh1RBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 1/2] mount.2: document MS_REC and shared subtree flags
Date: Wed, 18 May 2016 11:57:29 -0700
Message-ID: <cb66a4ad2808c6d6054e483348134d2e05405084.1463597825.git.osandov@fb.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Omar Sandoval <osandov-b10kYP2dOMg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

From: Omar Sandoval <osandov-b10kYP2dOMg@public.gmane.org>

This stuff is all documented in the kernel source tree under
Documentation/filesystems/sharedsubtree.txt, so let's document it
properly for users.

Signed-off-by: Omar Sandoval <osandov-b10kYP2dOMg@public.gmane.org>
---
 man2/mount.2 | 133 +++++++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 88 insertions(+), 45 deletions(-)

diff --git a/man2/mount.2 b/man2/mount.2
index aa6558a87cd9..419e22da800f 100644
--- a/man2/mount.2
+++ b/man2/mount.2
@@ -83,44 +83,6 @@ and various mount flags
 .\" (as defined in \fI<linux/fs.h>\fP for libc4 and libc5
 .\" and in \fI<sys/mount.h>\fP for glibc2)
 in the low order 16 bits:
-.\" FIXME 2.6.15 added flags for "shared subtree" functionality:
-.\"
-.\"	MS_PRIVATE
-.\"		All mounts are private by default. Previously shared mounts
-.\"		can be re-marked PRIVATE.
-.\"	MS_SHARED
-.\"		Mount points that are marked SHARED propagate mount events
-.\"		to one another after being cloned.
-.\"			mount --make-rshared ==> MS_SHARED | MS_REC
-.\"	MS_SLAVE
-.\"		A previously shared mount point can be marked SLAVE, meaning
-.\"		it receives propagated events, but does not propagate events.
-.\"	MS_UNBINDABLE
-.\"		mounts cannot be bound into other places, and will not be
-.\"		propagated into new subtrees	
-.\"
-.\" These settings are visible in /proc/$$/mountinfo
-.\"
-.\" These need to be documented on this page.
-.\" See:
-.\"
-.\" * Documentation/filesystems/sharedsubtree.txt
-.\"
-.\" * http://lwn.net/Articles/159077/
-.\"
-.\" * https://www.kernel.org/doc/ols/2006/ols2006v2-pages-209-222.pdf
-.\"       Shared-Subtree Concept, Implementation, and Applications in Linux
-.\"       Al Viro viro-rfM+Q5joDG/XmaaqVzeoHQ@public.gmane.org
-.\"       Ram Pai linuxram-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org
-.\"
-.\" * http://www.ibm.com/developerworks/linux/library/l-mount-namespaces/index.html
-.\"       Applying mount namespaces
-.\"
-.\"       Uncover practical applications for advanced Linux mounts features
-.\"       Serge E. Hallyn (sergeh-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org), Software Engineer, IBM
-.\"       Ram Pai (linuxram-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org), Software Engineer, IBM
-.\"       Date:  17 Sep 2007
-.\"
 .\" FIXME 2.6.25 Added MS_I_VERSION, which needs to be documented.
 .\"
 .TP
@@ -240,12 +202,34 @@ programs from this filesystem.
 .\" (This is a security feature to prevent users executing set-user-ID and
 .\" set-group-ID programs from removable disk devices.)
 .TP
+.BR MS_PRIVATE " (since Linux 2.6.15)"
+Set the mount propagation on this mountpoint to private. Mounts will not
+propagate to or from replicated subtrees.
+This flag can only be combined with
+.B MS_REC
+and
+.BR MS_SILENT .
+The
+.IR source ,
+.IR filesystemtype ,
+and
+.IR data
+arguments are ignored.
+.TP
 .B MS_RDONLY
 Mount filesystem read-only.
-.\"
-.\" FIXME Document MS_REC, available since 2.4.11.
-.\" This flag has meaning in conjunction with MS_BIND and
-.\" also with the shared subtree flags.
+.TP
+.BR MS_REC " (since Linux 2.4.11)"
+When passed together with
+.BR MS_BIND ,
+recursively bind mount all mountpoints underneath the source subtree.
+When passed together with a shared subtree flag (one of
+.BR MS_PRIVATE ,
+.BR MS_SHARED ,
+.BR MS_SLAVE ", or"
+.BR MS_UNBINDABLE ),
+recursively apply the shared subtree setting to all mountpoints
+underneath the target subtree.
 .TP
 .BR MS_RELATIME " (since Linux 2.6.20)"
 When a file on this filesystem is accessed,
@@ -306,6 +290,21 @@ and, additionally, before kernel 2.4.10, the following could also be changed:
 .BR MS_NODEV ,
 .BR MS_NOEXEC .
 .TP
+.BR MS_SHARED " (since Linux 2.6.15)"
+Set the mount propagation on this mountpoint to shared.
+Mounts will be propagated to and from replicated subtrees
+(i.e., all replicas will continue to be the same).
+This flag can only be combined with
+.B MS_REC
+and
+.BR MS_SILENT .
+The
+.IR source ,
+.IR filesystemtype ,
+and
+.IR data
+arguments are ignored.
+.TP
 .BR MS_SILENT " (since Linux 2.6.17)"
 Suppress the display of certain
 .RI ( printk ())
@@ -314,6 +313,28 @@ This flag supersedes the misnamed and obsolete
 .BR MS_VERBOSE
 flag (available since Linux 2.4.12), which has the same meaning.
 .TP
+.BR MS_SLAVE " (since Linux 2.6.15)"
+Make this mountpoint a slave of its source mountpoint, referred to as
+its master.
+Mounts made underneath the master subtree will be propagated to this
+subtree, but mounts made underneath this subtree will not be propagated
+back to the master.
+Note that a slave mountpoint can still have either private propagation
+(see
+.BR MS_PRIVATE )
+or shared propagation (see
+.BR MS_SHARED ).
+This flag can only be combined with
+.B MS_REC
+and
+.BR MS_SILENT .
+The
+.IR source ,
+.IR filesystemtype ,
+and
+.IR data
+arguments are ignored.
+.TP
 .BR MS_STRICTATIME " (since Linux 2.6.30)"
 Always update the last access time (atime) when files on this
 filesystem are accessed.
@@ -331,6 +352,21 @@ the
 flag to
 .BR open (2)
 was specified for all file opens to this filesystem).
+.TP
+.BR MS_UNBINDABLE " (since Linux 2.6.15)"
+Set the mount propagation on this mountpoint to private (see
+.BR MS_PRIVATE )
+and disallow bind mounts with this mountpoint as the source.
+This flag can only be combined with
+.B MS_REC
+and
+.BR MS_SILENT .
+The
+.IR source ,
+.IR filesystemtype ,
+and
+.IR data
+arguments are ignored.
 .PP
 From Linux 2.4 onward, the
 .BR MS_NODEV ", " MS_NOEXEC ", and " MS_NOSUID
@@ -408,6 +444,11 @@ Or, a move
 was attempted, but
 .I source
 was not a mount point, or was \(aq/\(aq.
+Or, more than one shared subtree flag was given.
+Or, a shared subtree flag was combined with a flag other than
+.B MS_REC
+or
+.BR MS_SILENT .
 .TP
 .B ELOOP
 Too many links encountered during pathname resolution.
@@ -457,11 +498,13 @@ The definitions of
 .BR MS_MOVE ,
 .BR MS_REC ,
 .BR MS_RELATIME ,
+.BR MS_STRICTATIME ,
+.BR MS_PRIVATE ,
+.BR MS_SHARED ,
+.BR MS_SLAVE ,
 and
-.BR MS_STRICTATIME
+.BR MS_UNBINDABLE
 were added to glibc headers in version 2.12.
-.\" FIXME . Definitions of the so-far-undocumented MS_UNBINDABLE, MS_PRIVATE,
-.\" MS_SHARED, and MS_SLAVE were (also) only added to glibc headers in 2.12.
 .SH CONFORMING TO
 This function is Linux-specific and should not be used in
 programs intended to be portable.
-- 
2.8.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
