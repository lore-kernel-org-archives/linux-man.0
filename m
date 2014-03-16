From: xypron.glpk-Mmb7MZpHnFY@public.gmane.org
Subject: [PATCH 1/1] Man pages for the fanotify API
Date: Sun, 16 Mar 2014 16:32:39 +0100
Message-ID: <1394983959-5392-1-git-send-email-xypron.glpk@gmx.de>
References: <53233160.9000106@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53233160.9000106-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org, james.hunt-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>

Michael,

thank you for all your comments. I reflected these in the appended
revised patch.

I studied the proposal by Stephan Mueller dated 2011 but the proposed pages are
not a superset of his proposal due to some changes in the API
(e.g. FAN_READONLY_FALLBACK).

Include linux/fcntl.h is needed for O_LARGEFILE.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/fanotify_init.2 |  199 ++++++++++++++++++++
 man2/fanotify_mark.2 |  216 ++++++++++++++++++++++
 man7/fanotify.7      |  497 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 912 insertions(+)
 create mode 100644 man2/fanotify_init.2
 create mode 100644 man2/fanotify_mark.2
 create mode 100644 man7/fanotify.7

diff --git a/man2/fanotify_init.2 b/man2/fanotify_init.2
new file mode 100644
index 0000000..2847f09
--- /dev/null
+++ b/man2/fanotify_init.2
@@ -0,0 +1,199 @@
+.\" Copyright (C) 2013, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
+.\" 
+.\" %%%LICENSE_START(VERBATIM)
+.\" Permission is granted to make and distribute verbatim copies of this
+.\" manual provided the copyright notice and this permission notice are
+.\" preserved on all copies.
+.\"
+.\" Permission is granted to copy and distribute modified versions of
+.\" this manual under the conditions for verbatim copying, provided that
+.\" the entire resulting derived work is distributed under the terms of
+.\" a permission notice identical to this one.
+.\"
+.\" Since the Linux kernel and libraries are constantly changing, this
+.\" manual page may be incorrect or out-of-date.  The author(s) assume.
+.\" no responsibility for errors or omissions, or for damages resulting.
+.\" from the use of the information contained herein.  The author(s) may.
+.\" not have taken the same level of care in the production of this.
+.\" manual, which is licensed free of charge, as they might when working.
+.\" professionally.
+.\"
+.\" Formatted or processed versions of this manual, if unaccompanied by
+.\" the source, must acknowledge the copyright and authors of this work.
+.\" %%%LICENSE_END
+.TH FANOTIFY_INIT 2 2014-03-14 "Linux" "Linux Programmer's Manual"
+.SH NAME
+fanotify_init \- create and initialize fanotify group
+.SH SYNOPSIS
+.B #include <linux/fcntl.h>
+.br
+.B #include <sys/fanotify.h>
+.sp
+.BI "int fanotify_init(unsigned int " flags ", unsigned int " event_f_flags );
+.SH DESCRIPTION
+.BR fanotify_init()
+initializes a new fanotify group and returns a file descriptor for the event
+queue.
+.PP
+The file decriptor is used in calls to
+.BR fanotify_mark (2)
+to define for which files, directories, or mounts fanotify events shall be
+created.
+These events are received by reading from the file descriptor.
+Some events only inform that a file has been accessed.
+Other events allow to decide if another application may access a file.
+Decisions upon the permission to access files are made by writing to the file
+descriptor.
+An overview is provided in
+.BR fanotify (7).
+.PP
+Multiple programs may be using the fanotify interface at the same time to
+monitor the same files. 
+By indicating in
+.I flags
+which kind of operations will be executed a logical sequence can be defined
+in which events are forwarded to the listeners. The following bitmasks define
+the kind of usage.
+Only one of them may be used when calling
+.B fanotify_init()
+.TP
+.B FAN_CLASS_PRE_CONTENT
+sets a priority level which allows to receive events notifying that a file has
+been accessed and events for permission decisions before the file is accessed.
+This priority level is intended for event listeners that need to access files
+before they contain their final data.
+It is useful for hierarchical storage managers.
+.TP
+.B FAN_CLASS_CONTENT
+sets a priority level which allows to receive events notifying that a file has
+been accessed and events for permission decisions before the file is accessed.
+This priority level is intended for event listeners that need to access files
+when they already contain their final content.
+This may be used by malware detection programs.
+.TP
+.B FAN_CLASS_NOTIF
+sets a priority level which allows only to receive events notifying that a file
+has been accessed.
+Permission decisions before the file is accessed are not possible.
+.PP
+Listeners will receive events in this order of priority levels.
+The call sequence among listeners of the same priority level is undefined.
+.PP
+Calling
+.BR fanotify_init()
+requires the
+.B CAP_SYS_ADMIN
+capability.
+This constraint might be relaxed in future versions of the API.
+Hence additional local capability checks have been implemented as indicated
+below.
+.PP
+.IR flags
+defines the behavior of the file descriptor.
+It is a bitmask composed of the following values:
+.TP
+.B FAN_CLOEXEC
+sets the close-on-exec flag
+.RB ( FD_CLOEXEC )
+on the new file descriptor.
+When calling
+.BR execve (2)
+the inherited file descriptor of the child process will be closed.
+See the description of the
+.B O_CLOEXEC
+flag in
+.BR open (2).
+.TP
+.B FAN_NONBLOCK
+enables the non-blocking flag
+.RB ( O_NONBLOCK )
+for the file descriptor.
+Reading from the file descriptor will not block.
+Instead if no data is available in a call to
+.BR read (2)
+an error
+.B EAGAIN
+will occur.
+.TP
+.B FAN_CLASS_PRE_CONTENT
+see above.
+.TP
+.B FAN_CLASS_CONTENT
+see above.
+.TP
+.B FAN_CLASS_NOTIF
+see above.
+.TP
+.B FAN_UNLIMITED_QUEUE
+removes the limit of 16384 events on the size of the event queue.
+This flag requires the
+.B CAP_SYS_ADMIN
+capability.
+.TP
+.B FAN_UNLIMITED_MARKS
+removes the limiti of 8192 marks on the number of marks.
+This flag requires the
+.B CAP_SYS_ADMIN
+capability.
+.PP
+.IR event_f_flags
+defines the file flags, with which file descriptors for fanotify events shall
+be created.
+For explanations of possible values see parameter
+.I flags
+of the 
+.BR open (2)
+system call.
+Useful values are
+.TP
+.B O_RDONLY
+read only access.
+.TP
+.B O_WRONLY
+write only access.
+.TP
+.B O_RDWR
+read and write access.
+.TP
+.B O_CLOEXEC
+enable close-on-exec.
+.TP
+.B O_LARGEFILE
+support files exceeding 2 GB.
+Failing to set this flag will result in an
+.B EOVERFLOW
+error when trying to open a large file which is monitored by a fanotify group.
+.SH RETURN VALUE
+If the system
+.BR fanotify_init ()
+is successful a new file descriptor is returned.
+In case of an error \-1 is returned, and
+.I errno
+is set to indicate the error.
+.SH ERRORS
+.TP
+.B EINVAL
+An invalid value was passed in
+.IR flags .
+.B FAN_ALL_INIT_FLAGS
+defines all allowable bits.
+.TP
+.B EMFILE
+indicates the number of listeners exceeds 128.
+.TP
+.B ENOMEM
+Out of memory, the allocation of memory for the notification group failed. 
+.TP
+.B EPERM
+Operation not permitted because capability
+.B CAP_SYS_ADMIN
+is missing.
+.SH VERSIONS
+.BR fanotify_init ()
+was introduced in version 2.6.36 of the Linux kernel and enabled in version
+2.6.37.
+.SH "CONFORMING TO"
+This system call is Linux-specific.
+.SH "SEE ALSO"
+.BR fanotify_mark (2),
+.BR fanotify (7)
diff --git a/man2/fanotify_mark.2 b/man2/fanotify_mark.2
new file mode 100644
index 0000000..9439d18
--- /dev/null
+++ b/man2/fanotify_mark.2
@@ -0,0 +1,216 @@
+.\" Copyright (C) 2013,  Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
+.\" 
+.\" %%%LICENSE_START(VERBATIM)
+.\" Permission is granted to make and distribute verbatim copies of this
+.\" manual provided the copyright notice and this permission notice are
+.\" preserved on all copies.
+.\"
+.\" Permission is granted to copy and distribute modified versions of
+.\" this manual under the conditions for verbatim copying, provided that
+.\" the entire resulting derived work is distributed under the terms of
+.\" a permission notice identical to this one.
+.\"
+.\" Since the Linux kernel and libraries are constantly changing, this
+.\" manual page may be incorrect or out-of-date.  The author(s) assume.
+.\" no responsibility for errors or omissions, or for damages resulting.
+.\" from the use of the information contained herein.  The author(s) may.
+.\" not have taken the same level of care in the production of this.
+.\" manual, which is licensed free of charge, as they might when working.
+.\" professionally.
+.\"
+.\" Formatted or processed versions of this manual, if unaccompanied by
+.\" the source, must acknowledge the copyright and authors of this work.
+.\" %%%LICENSE_END
+.TH FANOTIFY_MARK 2 2014-03-14 "Linux" "Linux Programmer's Manual"
+.SH NAME
+fanotify_mark \- add, remove, or modify a fanotify mark on a filesystem
+object.
+.SH SYNOPSIS
+.nf
+.B #include <sys/fanotify.h>
+.sp
+.BI "int fanotify_mark (int " fanotify_fd ", unsigned int " flags ,
+.BI "                   uint64_t " mask ", int " dfd ,
+.BI "                   const char *" pathname );
+.fi
+.SH DESCRIPTION
+.BR fanotify_mark (2)
+adds, removes, or modifies a fanotify mark on a filesystem.
+.PP
+.I fd
+is the file descriptor returned by
+.BR fanotify_init (2).
+.PP
+.I flags
+is a bitmask describing the modification to perform.
+It is composed of the following values:
+.TP
+.B FAN_MARK_ADD
+Add the events in
+.IR mask .
+.I mask
+must be nonempty or an error
+.B EINVAL
+will occur.
+.TP
+.B FAN_MARK_REMOVE
+Remove the events in
+.IR mask .
+.I mask
+must be nonempty or an error
+.B EINVAL
+will occur.
+.TP
+.B FAN_MARK_DONT_FOLLOW
+Do not follow symbolic links.
+.TP
+.B FAN_MARK_ONLYDIR
+Fail if the path to be marked is not a directory.
+.TP
+.B FAN_MARK_MOUNT
+The path indicates a mount to be marked.
+.TP
+.B FAN_MARK_IGNORED_MASK
+Add to or remove from the ignored event mask.
+.TP
+.B FAN_MARK_IGNORED_SURV_MODIFY
+The ignored mask shall survive modify events.
+If this flag is not set the ignored mask is cleared if a modify event occurs
+for the fanotify group.
+.TP
+.B FAN_MARK_FLUSH
+Remove all events from the whole group.
+.PP
+Only one of
+.BR FAN_MARK_ADD , FAN_MARK_REMOVE ,
+or
+.B FAN_MARK_FLUSH
+can be used. Failure to do so results in an error
+.BR EINVAL .
+.PP
+.I mask
+defines which events shall be listened to.
+It is a bitmask composed of the following values:
+.TP
+.B FAN_ACCESS
+A file was accessed (read).
+.TP
+.B FAN_MODIFY
+A file was modified (write).
+.TP
+.B FAN_CLOSE_WRITE
+A writable file was closed.
+.TP
+.B FAN_CLOSE_NOWRITE
+An readonly file was closed.
+.TP
+.B FAN_OPEN
+A file was opened.
+.TP
+.B FAN_Q_OVERFLOW
+The event queue overflowed.
+.TP
+.B FAN_OPEN_PERM
+A file open permission was requested.
+.TP
+.B FAN_ACCESS_PERM
+An access permission for a file was requested.
+.TP
+.B FAN_ONDIR
+The event occurred against a directory.
+.TP
+.B FAN_EVENT_ON_CHILD
+An event for a child of a monitored directory occurred.
+.PP
+The following composed value is defined
+.TP
+.B FAN_CLOSE
+A file was closed (FAN_CLOSE_WRITE | FAN_CLOSE_NOWRITE).
+.PP
+.I dfd
+is a file descriptor.
+.IP - 2
+If 
+.I pathname
+is NULL
+.I dfd
+defines the path to be marked.
+.IP - 2
+If
+.I pathname
+is NULL and dfd takes the special value
+.B AT_FDCWD
+defined in <fcntl.h> the current working directory is to be marked.
+.IP - 2
+If
+.I pathname
+is absolute it defines the path to be marked.
+.IP - 2
+If
+.I pathname
+is relative it defines a path relative to the path indicated by the file
+descriptor in
+.I dfd
+to be marked.
+.IP - 2
+If
+.I pathname
+is relative and
+.I dfd
+takes the special value
+.B AT_FDCWD
+it defines a path relative to the current working directory to be marked.
+.PP
+.I pathname
+is an absolute or relative path to be marked.
+.SH RETURN VALUE
+If
+.BR fanotify_mark ()
+is successful 0 is returned.
+In case of an error \-1 is returned, and
+.I errno
+is set to indicate the error.
+.SH ERRORS
+.TP
+.B EBADF
+An invalid file descriptor was passed in
+.IR fanotify_fd .
+.TP
+.B EINVAL
+An invalid value was passed in
+.IR flags ,
+or
+.IR mask ,
+or
+.I fd
+was not a fanotify file descriptor.
+.TP
+.B ENOENT
+The directory indicated by
+.IR pathname
+is not valid.
+This error also occurs when trying to remove a mark from a directory or mount
+which is not marked.
+.TP
+.B ENOMEM
+Out of memory.
+.TP
+.B ENOSPC
+Too many marks.
+.TP
+.B ENOTDIR
+.I flags
+contains
+.B FAN_MARK_ONLYDIR
+and
+.I dfd
+does not point to a directory.
+.SH VERSIONS
+.BR fanotify_mark ()
+was introduced in version 2.6.36 of the Linux kernel and enabled in version
+2.6.37.
+.SH "CONFORMING TO"
+This system call is Linux-specific.
+.SH "SEE ALSO"
+.BR fanotify_init (2),
+.BR fanotify (7)
diff --git a/man7/fanotify.7 b/man7/fanotify.7
new file mode 100644
index 0000000..1174488
--- /dev/null
+++ b/man7/fanotify.7
@@ -0,0 +1,497 @@
+.\" Copyright (C) 2013, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
+.\" 
+.\" %%%LICENSE_START(VERBATIM)
+.\" Permission is granted to make and distribute verbatim copies of this
+.\" manual provided the copyright notice and this permission notice are
+.\" preserved on all copies.
+.\"
+.\" Permission is granted to copy and distribute modified versions of
+.\" this manual under the conditions for verbatim copying, provided that
+.\" the entire resulting derived work is distributed under the terms of
+.\" a permission notice identical to this one.
+.\"
+.\" Since the Linux kernel and libraries are constantly changing, this
+.\" manual page may be incorrect or out-of-date.  The author(s) assume.
+.\" no responsibility for errors or omissions, or for damages resulting.
+.\" from the use of the information contained herein.  The author(s) may.
+.\" not have taken the same level of care in the production of this.
+.\" manual, which is licensed free of charge, as they might when working.
+.\" professionally.
+.\"
+.\" Formatted or processed versions of this manual, if unaccompanied by
+.\" the source, must acknowledge the copyright and authors of this work.
+.\" %%%LICENSE_END
+.TH FANOTIFY 7 2014-03-14 "Linux" "Linux Programmer's Manual"
+.SH NAME
+fanotify \- monitoring filesystem events
+.SH DESCRIPTION
+The
+.B fanotify
+API provides notification and interception of filesystem events.
+Use cases are virus scanning and hierarchical storage management.
+
+The following system calls are used with this API:
+.BR fanotify_init (2),
+.BR fanotify_mark (2),
+.BR poll (2),
+.BR ppoll (2),
+.BR read (2),
+.BR write (2),
+and
+.BR close (2).
+.PP
+.BR fanotify_init (2)
+creates and initializes a fanotify notification group and returns a file
+descriptor referring to it.
+A fanotify notification group is an internal object of the kernel which holds a
+list of files, directories and mounts for which events shall be created when a
+file is accessed, and a list of files for which a decision is pending whether
+access shall be granted.
+.PP
+When all file descriptors referring to the group are closed, the group is
+released and the resources are freed for reuse by the kernel.
+.PP
+.BR fanotify_mark (2)
+adds a file, a directory, or a mount from the group and specifies which events
+shall be reported, or removes or modifies such an entry.
+.PP
+The fanotify file descriptor signals when data becomes available when passed to
+either of
+.BR epoll (7),
+.BR poll (2),
+.BR select (2).
+.PP
+Calling
+.BR read (2)
+for the file descriptor returned by
+.BR fanotify_init (2)
+blocks (if flag
+.B FAN_NONBLOCK
+is not set in the call to
+.BR fanotify_init (2))
+until either a file event occurs or it is interrupted by a signal
+(see
+.BR signal (7)).
+
+The return value of
+.BR read (2)
+is the length of the filled buffer or -1 in case of an error.
+In case of success the read buffer contains one or more of the following
+structures:
+
+.in +4n
+.nf
+struct fanotify_event_metadata {
+    __u32 event_len;
+    __u8 vers;
+    __u8 reserved;
+    __u16 metadata_len;
+    __aligned_u64 mask;
+    __s32 fd; 
+    __s32 pid;
+};
+.fi
+.in
+
+.TP 15
+.I event_len
+is the length of the data for the current event and the offset to the next
+event in the buffer.
+This length might be longer than the size of structure
+.I fanotify_event_metadata.
+Therefore it is recommended to use a larger buffer size when reading,
+e.g. 4096 bytes.
+.TP
+.I vers
+holds the version of the
+.B fanotify
+API. The value should be checked against
+.B FANOTIFY_METADATA_VERSION.
+.TP
+.I reserved
+is not used.
+.TP
+.I metadata_len
+is the length of the structure.
+The field was introduced to facilitate the implementation of optional headers
+per event type.
+.TP
+.I mask
+is a bitmask describing the event.
+.TP
+.I fd
+is an open file descriptor for the object being accessed or
+.B FAN_NOFD
+if a queue overflow occurred.
+The reading application is responsible for closing this file descriptor.
+.TP
+.I pid
+is the ID of the process that caused the event.
+A program listening to fanotify events can compare this pid to the pid returned
+by
+.BR getpid (2)
+to detect if the event is caused internally or is due to a file access by another
+program.
+.PP
+The bitmask in
+.I mask
+is composed of the following values:
+.TP
+.B FAN_ACCESS
+file was accessed.
+.TP
+.B FAN_OPEN
+file was opened.
+.TP
+.B FAN_MODIFY
+file was modified.
+.TP
+.B FAN_CLOSE_WRITE
+writable file closed.
+.TP
+.B FAN_CLOSE_NOWRITE
+unwritable file closed.
+.TP
+.B FAN_Q_OVERFLOW
+event queue overflowed.
+.TP
+.B FAN_ACCESS_PERM
+file accessed in perm check.
+.TP
+.B FAN_OPEN_PERM
+file open in perm check.
+.TP
+.B FAN_ONDIR
+event occurred against directory.
+.TP
+.B FAN_EVENT_ON_CHILD
+event for a child of a directory occurred.
+.PP
+To check for any close event the following bitmask may be used
+.TP
+.B FAN_CLOSE
+a file was closed 
+(FAN_CLOSE_WRITE | FAN_CLOSE_NOWRITE).
+.PP
+The following macros are provided to iterate over a buffer of
+.B fanotify
+event metadata:
+.TP
+.B FAN_EVENT_OK(meta, len)
+checks the remaining length
+.I len
+of the buffer
+.I meta
+against the length of the metadata structure and the
+.I event_len
+field of the first metadata structure in the buffer.
+.TP
+.B FAN_EVENT_NEXT(meta, len)
+lets the pointer
+.I meta
+point to the next metadata structure using the length indicated in the
+.I event_len
+field of the metadata structure and reduces the remaining length of the
+buffer
+.I len.
+.PP
+For permission events the application must
+.BR write (2)
+to the
+.B fanotify
+file descriptor a structure
+
+.in +4n
+.nf
+struct fanotify_response {
+        __s32 fd;
+        __u32 response;
+};
+.fi
+.in
+
+.TP 15
+.I fd
+is the file descriptor from structure
+.I fanotify_event_metadata.
+.TP
+.I response
+must be either
+.br
+.B FAN_ALLOW
+to allow the file operation or
+.br
+.B FAN_DENY
+to deny the file operation.
+.PP
+To end listening it is sufficient to
+.BR close (2)
+the
+.B fanotify
+file descriptor.
+The open permission events will be set to allowed, and all resources will be
+returned to the kernel.
+.PP
+File /proc/<pid>/fdinfo/<fd> contains information about fanotify marks for
+file descriptor fd of process pid. See
+.I Documentation/filesystems/proc.txt
+for details.
+.SH ERRORS
+The following errors may occur when reading from the
+.B fanotify
+file descriptor:
+.TP
+.B EAGAIN
+a nonblocking call did not return any data.
+.TP
+.B EFAULT
+the read buffer is outside your accessible address space.
+.TP
+.B EINTR
+a signal has occurred.
+.TP
+.B EINVAL
+the buffer is too short to hold the event.
+.PP
+The following errors may occur when writing to the
+.B fanotify
+file descriptor:
+.TP
+.B EFAULT
+the write buffer is outside your accessible address space.
+.TP
+.B EINVAL
+fanotify access permissions are not enabled or the value of
+.I response
+in the response structure is not valid.
+.TP
+.B ENOENT
+the file descriptor
+.I fd
+in the response structure is not valid.
+This might occur because the file was already deleted by another thread or
+process.
+.SH VERSIONS
+The
+.B fanotify
+API was introduced in version 2.6.36 of the Linux kernel and enabled in
+version 2.6.37. Fdinfo support was added in version 3.8.
+.SH "CONFORMING TO"
+The
+.B fanotify
+API is Linux-specific.
+.SH NOTES
+The notification is based on the kernel filesystem notification system
+.B fsnotify.
+.PP
+To enable the
+.B fanotify
+API the following setting in the Kernel configuration is needed:
+CONFIG_FANOTIFY=y. For permission handling
+CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y must be set.
+.SH EXAMPLE
+The following program demonstrates the usage of the
+.B fanotify
+API. It creates a thread waiting for
+.B FAN_PERM_OPEN
+and
+.B FAN_CLOSE_WRITE
+events
+for mount /home.
+If a permission event arises a
+.B FAN_ALLOW
+response is given.
+.PP
+The following output was recorded while editing file /home/user/temp/notes.
+Before the file was opened a
+.B FAN_OPEN_PERM
+event occured.
+After the file was closed a
+.B FAN_CLOSE_WRITE
+event occured.
+The example program ended when hitting the enter key.
+.SS Example output
+.nf
+Press enter key to terminate.
+Listening for events.
+FAN_OPEN_PERM: File /home/zfsdt/temp/notes
+FAN_CLOSE_WRITE: File /home/zfsdt/temp/notes
+
+Listening for events stopped.
+.fi
+.SS Program source
+.nf
+#include <linux/fcntl.h>
+#include <linux/limits.h>
+#include <errno.h>
+#include <poll.h>
+#include <pthread.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/fanotify.h>
+#include <unistd.h>
+
+#define RUNNING 1
+#define STOPPING 2
+
+static int status;
+
+// Handle available events.
+static void
+handle_events(int fd)
+{
+    const struct fanotify_event_metadata *metadata;
+    char buf[4096];
+    int len;
+    char path[PATH_MAX];
+    int path_len;
+    struct fanotify_response response;
+
+    // Loop while events can be read from fanotify file descriptor.
+    for(;;) {
+
+        // Read next events.
+        len = read(fd, (void *) &buf, sizeof (buf));
+        if (len > 0) {
+
+            // Point to the first event in the buffer.
+            metadata = (struct fanotify_event_metadata *) buf;
+
+            // Loop over all events in the buffer.
+            while (FAN_EVENT_OK(metadata, len)) {
+
+                // Check event contains a file descriptor.
+                if (metadata\->fd >= 0) {
+
+                    // Handle open permission event.
+                    if (metadata\->mask & FAN_OPEN_PERM) {
+                        printf("FAN_OPEN_PERM: ");
+                        // Allow file to be opened.
+                        response.fd = metadata\->fd;
+                        response.response = FAN_ALLOW;
+                        write(fd, &response, sizeof (
+                                  struct fanotify_response));
+                    }
+
+                    // Handle closing of writable file event.
+                    if (metadata\->mask & FAN_CLOSE_WRITE) {
+                        printf("FAN_CLOSE_WRITE: ");
+                    }
+
+                    // Determine path of the file accessed.
+                    sprintf(path, "/proc/self/fd/%d", metadata\->fd);
+                    path_len = readlink(path, path, sizeof (path) \- 1);
+
+                    // Write path.
+                    if (path_len > 0) {
+                        path[path_len] = '\\0';
+                        printf("File %s", path);
+                    }
+
+                    // Close the file descriptor of the event.
+                    close(metadata\->fd);
+                    printf("\\n");
+                }
+
+                // Forward pointer to next event.
+                metadata = FAN_EVENT_NEXT(metadata, len);
+            }
+        } else {
+
+            // No more events are available.
+            break;
+        }
+    }
+}
+
+// Worker thread.
+static void *
+run(void *data)
+{
+    int fd;
+    nfds_t nfds;
+    struct pollfd fds;
+
+    // Create the file descriptor for accessing the fanotify API.
+    fd = fanotify_init(FAN_CLOEXEC | FAN_CLASS_CONTENT | FAN_NONBLOCK,
+                       O_RDONLY | O_LARGEFILE);
+    if (fd == \-1) {
+        perror("fanotify_init");
+        return NULL;
+    }
+
+    // Mark the home mount for
+    // \- permission events before opening files
+    // \- notification events after closing a write enabled file descriptor.
+    if (fanotify_mark(fd, FAN_MARK_ADD | FAN_MARK_MOUNT,
+                      FAN_OPEN_PERM | FAN_CLOSE_WRITE, FAN_NOFD,
+                      "/home") == \-1) {
+        perror("fanotify_mark");
+        close(fd);
+        return NULL;
+    }
+
+    // Prepare for polling.
+    nfds = 1;
+    fds.fd = fd;
+    fds.events = POLLIN;
+    fds.revents = 0;
+    status = RUNNING;
+
+    // This is the loop to wait for  incoming events.
+    printf("Listening for events.\\n");
+    while (status == RUNNING) {
+        int ret;
+
+        // Poll for 1 s.
+        ret = poll(&fds, nfds, 1000);
+        if (ret > 0) {
+            if (fds.revents & POLLIN) {
+                // Events are available.
+                handle_events(fd);
+            }
+            fds.revents = 0;
+        }
+        if (ret == \-1 && errno != EINTR) {
+            perror("poll");
+            break;
+        }
+    }
+
+    // Close fanotify file descriptor.
+    close(fd);
+    printf("Listening for events stopped.\\n");
+    return NULL;
+}
+
+int
+main(int argc, char *argv[])
+{
+    pthread_attr_t attr;
+    pthread_t thread;
+    void *result;
+
+    printf("Press enter key to terminate.\\n");
+
+    // Create a worker thread for monitoring file events.
+    if (pthread_attr_init(&attr)) {
+        return EXIT_FAILURE;
+    }
+    if (pthread_create(&thread, &attr, run, NULL)) {
+        return EXIT_FAILURE;
+    }
+
+    // Wait for user input.
+    getchar();
+
+    // Terminate worker thread.
+    status = STOPPING;
+    pthread_join(thread, &result);
+    return EXIT_SUCCESS;
+}
+.fi
+.SH "SEE ALSO"
+.ad l
+.BR fanotify_init (2),
+.BR fanotify_mark (2),
+.BR inotify (7)
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
