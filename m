From: xypron.glpk-Mmb7MZpHnFY@public.gmane.org
Subject: [PATCH 1/1] Manpages for the fanotify API
Date: Sun,  6 Apr 2014 02:01:45 +0200
Message-ID: <1396742505-4823-1-git-send-email-xypron.glpk@gmx.de>
References: <5330A257.9080100@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5330A257.9080100-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, jack-AlSwsSmVLrQ@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>

Missing man pages for the fanotify API are provided.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/fanotify_init.2 |  201 ++++++++++++++++++
 man2/fanotify_mark.2 |  260 +++++++++++++++++++++++
 man7/fanotify.7      |  576 ++++++++++++++++++++++++++++++++++++++++++++++++++
 man7/inotify.7       |    1 +
 4 files changed, 1038 insertions(+)
 create mode 100644 man2/fanotify_init.2
 create mode 100644 man2/fanotify_mark.2
 create mode 100644 man7/fanotify.7

diff --git a/man2/fanotify_init.2 b/man2/fanotify_init.2
new file mode 100644
index 0000000..a27de6c
--- /dev/null
+++ b/man2/fanotify_init.2
@@ -0,0 +1,201 @@
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
+.TH FANOTIFY_INIT 2 2014-03-22 "Linux" "Linux Programmer's Manual"
+.SH NAME
+fanotify_init \- create and initialize fanotify group
+.SH SYNOPSIS
+.B #include <fcntl.h>
+.br
+.B #include <sys/fanotify.h>
+.sp
+.BI "int fanotify_init(unsigned int " flags ", unsigned int " event_f_flags );
+.SH DESCRIPTION
+For an overview of the fanotify API, see
+.BR fanotify (7).
+.PP
+.BR fanotify_init ()
+initializes a new fanotify group and returns a file descriptor for the event
+queue associated with the group.
+.PP
+The file descriptor is used in calls to
+.BR fanotify_mark (2)
+to specify the files, directories, and mounts fanotify events shall be created.
+These events are received by reading from the file descriptor.
+Some events are only informative, indicating that a file has been accessed.
+Other events can be used to control if another application may access a file,
+or directory.
+Permission to access file system objects is granted by writing to the file
+descriptor.
+.PP
+Multiple programs may be using the fanotify interface at the same time to
+monitor the same files. 
+In the current implementation the number of fanotify groups per user is limited
+to 128.
+This limit cannot be overridden.
+.PP
+Calling
+.BR fanotify_init()
+requires the
+.B CAP_SYS_ADMIN
+capability.
+This constraint might be relaxed in future versions of the API.
+Therefore additional local capability checks have been implemented as indicated
+below.
+.PP
+The
+.I flags
+argument contains a multi-bit field defining the usage type of the listening
+application and further single bit fields specifying the behavior of the file
+descriptor.
+.PP
+The usage type indicates, which kind of operations will be executed.
+Only one of the following values may be used when calling
+.BR fanotify_init ().
+.TP
+.B FAN_CLASS_PRE_CONTENT
+This value allows the receipt of events notifying that a file has been
+accessed and events for permission decisions if a file may be accessed.
+It is intended for event listeners that need to access files before they
+contain their final data.
+This may be used hierarchical storage managers.
+.TP
+.B FAN_CLASS_CONTENT
+This value allows the receipt of events notifying that a file has been
+accessed and events for permission decisions if a file may be accessed.
+It is intended for event listeners that need to access files when they already
+contain their final content.
+This may be used by malware detection programs.
+.TP
+.B FAN_CLASS_NOTIF
+This is the default value.
+It only allows the receipt of events notifying that a file has been accessed.
+Permission decisions before the file is accessed are not possible.
+.PP
+Listeners with different values will receive events in the sequence
+.BR FAN_CLASS_PRE_CONTENT ,
+.BR FAN_CLASS_CONTENT ,
+.BR FAN_CLASS_NOTIF .
+The call sequence among listeners of the same value is undefined.
+.PP
+The following bit mask values can be set additionally in
+.IR flags .
+.TP
+.B FAN_CLOEXEC
+This flag sets the close-on-exec flag
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
+This flag enables the non-blocking flag
+.RB ( O_NONBLOCK )
+for the file descriptor.
+Reading from the file descriptor will not block.
+Instead, if no data is available in a call to
+.BR read (2)
+the error
+.B EAGAIN
+will occur.
+.TP
+.B FAN_UNLIMITED_QUEUE
+This flag removes the limit of 16384 events on the size of the event queue.
+It requires the
+.B CAP_SYS_ADMIN
+capability.
+.TP
+.B FAN_UNLIMITED_MARKS
+This flag removes the limit of 8192 marks on the number of marks.
+It requires the
+.B CAP_SYS_ADMIN
+capability.
+.PP
+The argument
+.I event_f_flags
+defines the file flags, with which file descriptors for fanotify events shall
+be created.
+For explanations of possible values, see argument
+.I flags
+of the 
+.BR open (2)
+system call.
+Useful values are:
+.TP
+.B O_RDONLY
+This value allows only read access.
+.TP
+.B O_WRONLY
+This value allows only write access.
+.TP
+.B O_RDWR
+This value allows read and write access.
+.TP
+.B O_CLOEXEC
+This flag enables close-on-exec.
+.TP
+.B O_LARGEFILE
+This flag enables support files exceeding 2 GB.
+Failing to set this flag will result in an
+.B EOVERFLOW
+error when trying to open a large file which is monitored by a fanotify group
+on a 32-bit system.
+.SH RETURN VALUE
+On success,
+.BR fanotify_init ()
+returns a new file descriptor.
+In case of an error, \-1 is returned, and
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
+The number of fanotify groups of the user exceeds 128.
+.TP
+.B ENOMEM
+The allocation of memory for the notification group failed. 
+.TP
+.B EPERM
+The operation is not permitted because capability
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
index 0000000..73cebef
--- /dev/null
+++ b/man2/fanotify_mark.2
@@ -0,0 +1,260 @@
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
+.TH FANOTIFY_MARK 2 2014-03-22 "Linux" "Linux Programmer's Manual"
+.SH NAME
+fanotify_mark \- add, remove, or modify a fanotify mark on a filesystem
+object
+.SH SYNOPSIS
+.nf
+.B #include <sys/fanotify.h>
+.sp
+.BI "int fanotify_mark(int " fanotify_fd ", unsigned int " flags ,
+.BI "                  uint64_t " mask ", int " dirfd ,
+.BI "                  const char *" pathname );
+.fi
+.SH DESCRIPTION
+For an overview of the fanotify API, see
+.BR fanotify (7).
+.PP
+.BR fanotify_mark (2)
+adds, removes, or modifies a fanotify mark on a filesystem.
+.PP
+Read access is needed for the file system object to be marked.
+.PP
+The
+.I fanotify_fd
+argument is the file descriptor returned by
+.BR fanotify_init (2).
+.PP
+.I flags
+is a bit mask describing the modification to perform.
+It must include one of the following values:
+.TP
+.B FAN_MARK_ADD
+The events in argument
+.I mask
+will be added to the mark mask (or to the ignore mask).
+.I mask
+must be nonempty or the error
+.B EINVAL
+will occur.
+.TP
+.B FAN_MARK_REMOVE
+The events in paramter
+.I mask
+will be removed from the mark mask (or from the ignore mask).
+.I mask
+must be nonempty or the error
+.TP
+.B FAN_MARK_FLUSH
+Remove all marks from the whole fanotify group.
+If
+.I mask
+contains
+.B FAN_MARK_MOUNT
+all marks for mounts are removed from the group.
+Otherwise all marks for directories and files are removed.
+.PP
+If none of the values above is specified, or more than one is specified, the
+call fails with the error
+.BR EINVAL .
+.PP
+In addition
+.I flags
+may contain zero or more of the following:
+.TP
+.B FAN_MARK_DONT_FOLLOW
+Symbolic links shall not be followed.
+.TP
+.B FAN_MARK_ONLYDIR
+If the the file system object to be marked is not a directory, the error
+.B ENOTDIR
+shall be raised.
+.TP
+.B FAN_MARK_MOUNT
+The path indicates a mount point to be marked.
+If the path is not itself a mount point the mount point containing the path
+will be marked.
+All directories, subdirectories, and the contained files of the mount point
+will be monitored.
+.TP
+.B FAN_MARK_IGNORED_MASK
+The events in argument
+.I mask
+shall be added to or removed from the ignore mask.
+.TP
+.B FAN_MARK_IGNORED_SURV_MODIFY
+The ignore mask shall survive modify events.
+If this flag is not set, the ignore mask is cleared, if a modify event occurs
+for the fanotify group.
+.PP
+.I mask
+defines which events shall be listened to (or which shall be ignored).
+It is a bit mask composed of the following values:
+.TP
+.B FAN_ACCESS
+Create an event, when a file is accessed (read).
+.TP
+.B FAN_MODIFY
+Create an event, when a file is modified (write).
+.TP
+.B FAN_CLOSE_WRITE
+Create an event, when a writeable file is closed.
+.TP
+.B FAN_CLOSE_NOWRITE
+Create an event, when a readonly file is closed.
+.TP
+.B FAN_OPEN
+Create an event, when a file is opened.
+.TP
+.B FAN_OPEN_PERM
+Create an event, when a permission to open a file is requested.
+.TP
+.B FAN_ACCESS_PERM
+Create an event, when a permission to execute a file or list a directory is
+requested.
+.TP
+.B FAN_ONDIR
+Events for directories shall be created.
+.TP
+.B FAN_EVENT_ON_CHILD
+Events for the immediate children of marked directories shall be created.
+This does not cover the members of subdirectories.
+To monitor complete directory trees it is necessary to mark the relevant
+mount.
+.PP
+The following composed value is defined
+.TP
+.B FAN_CLOSE
+A file is closed (FAN_CLOSE_WRITE | FAN_CLOSE_NOWRITE).
+.PP
+The file system object to be marked is determined by the file descriptor
+.I dirfd
+and the pathname specified in
+.IR pathname :
+.IP * 3
+If 
+.I pathname
+is NULL,
+.I dirfd
+defines the file system object to be marked.
+.IP *
+If
+.I pathname
+is NULL, and
+.I dirfd
+takes the special value
+.BR AT_FDCWD ,
+the current working directory is to be marked.
+.IP *
+If
+.I pathname
+is absolute it defines the file system object to be marked, and
+.I dirfd
+is ignored.
+.IP *
+If
+.I pathname
+is relative, it defines a file system object relative to the directory
+indicated by the file descriptor in
+.I dirfd
+to be marked.
+.IP *
+If
+.I pathname
+is relative and
+.I dirfd
+takes the special value
+.BR AT_FDCWD ,
+.I pathname
+defines a file system object relative to the current working directory to be
+marked.
+.SH RETURN VALUE
+On success
+.BR fanotify_mark ()
+returns 0.
+In case of an error, \-1 is returned, and
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
+.IR flags
+or
+.IR mask ,
+or
+.I fanotify_fd
+was not a fanotify file descriptor.
+.TP
+.B ENOENT
+The file system object indicated by
+.IR dirfd
+and
+.IR pathname
+does not exist.
+This error also occurs when trying to remove a mark from an object which is not
+marked.
+.TP
+.B ENOMEM
+The necessary memory could not be allocated.
+.TP
+.B ENOSPC
+The number of marks exceeds the limit of 8192 and
+.B FAN_UNLIMITED_MARKS
+was not specified in the call to
+.BR fanotify_init (2).
+.TP
+.B ENOTDIR
+.I flags
+contains
+.BR FAN_MARK_ONLYDIR ,
+and
+.I dirfd
+and
+.I pathname
+do not specify a directory.
+.SH VERSIONS
+.BR fanotify_mark ()
+was introduced in version 2.6.36 of the Linux kernel and enabled in version
+2.6.37.
+.SH "CONFORMING TO"
+This system call is Linux-specific.
+.SH "BUGS"
+Up to Kernel 3.14
+.I dfd
+and
+.I pathname
+must indicate a valid path, if
+.I flags
+contains
+.B FAN_MARK_FLUSH.
+This path is not used.
+.SH "SEE ALSO"
+.BR fanotify_init (2),
+.BR fanotify (7)
diff --git a/man7/fanotify.7 b/man7/fanotify.7
new file mode 100644
index 0000000..7abc4d2
--- /dev/null
+++ b/man7/fanotify.7
@@ -0,0 +1,576 @@
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
+.TH FANOTIFY 7 2014-03-24 "Linux" "Linux Programmer's Manual"
+.SH NAME
+fanotify \- monitoring filesystem events
+.SH DESCRIPTION
+The
+.B fanotify
+API provides notification and interception of filesystem events.
+Use cases are virus scanning and hierarchical storage management.
+Currently only a limited set of events is supported.
+Up to now there is no support for create, delete, and move events.
+
+Additinal capabilities compared to the
+.IR inotify (7)
+API are monitoring of complete mounts, access permission decisions, and the
+possibility to read or modify files before access by other applications.
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
+.PP
+A fanotify notification group is an internal object of the kernel which holds a
+list of files, directories and mount points for which events shall be created.
+.PP
+For each entry in a fanotify notification group, two bit masks exist.
+One mask (the mark mask) defines for which file activities an event shall be
+created.
+Another mask (the ignore mask) defines for which activities no event shall be
+created.
+Having these two types of masks allows that a mount point or directory is
+marked for receiving events, while at the same time ignoring events for
+specified contained file system objects.
+.PP
+A possible usage of the ignore mask is for a file cache.
+Events of interest for a file cache are modification of a file and closing
+of the same. Hence the cached directory or mount point is to be marked to
+receive these events.
+After receiving the first event informing that a file has been modified, the
+corresponding cache entry will be invalidated.
+No further modification events for this file are of interest until the file is
+closed.
+Hence the modify event can be added to the ignore mask.
+Upon receiving the closed event, the modify event can be removed from the
+ignore mask and the file cache entry can be updated.
+.PP
+The entries in the fanotify notification groups refer to files and directories
+via their inode number and to mounts via their mount id.
+If files or directories are renamed or moved the respective entries survive.
+If files or directories are deleted or mounts are unmounted the corresponding
+entries are deleted.
+.PP
+Two types of events exist.
+Notification events are only informative and require no action to be taken by
+the receiving application except for closing the file descriptor passed in the
+event.
+Permission events are requests to the receiving application to decide whether
+permission for a file access shall be granted.
+For these events, the recipient has to write a response which decides whether
+access is granted or not.
+.PP
+When all file descriptors referring to the fanotify notification group are
+closed, the fanotify group is released and the resources are freed for reuse by
+the kernel.
+.PP
+.BR fanotify_mark (2)
+adds a file, a directory, or a mount to the group and specifies which events
+shall be reported (or ignored), or removes or modifies such an entry.
+.PP
+When a fanotify event occurs, the fanotify file descriptor indicates as
+readable when passed to
+.BR epoll (7),
+.BR poll (2),
+or
+.BR select (2).
+.PP
+Calling
+.BR read (2)
+for the file descriptor returned by
+.BR fanotify_init (2)
+blocks (if the flag
+.B FAN_NONBLOCK
+is not specified in the call to
+.BR fanotify_init (2)),
+until either a file event occurs or it is interrupted by a signal
+(see
+.BR signal (7)).
+
+The return value of
+.BR read (2)
+is the length of the filled buffer or \-1 in case of an error.
+In case of success, the read buffer contains one or more of the following
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
+This is the length of the data for the current event and the offset to the next
+event in the buffer.
+This length might be longer than the size of structure
+.I fanotify_event_metadata.
+Therefore, it is recommended to use a larger buffer size when reading,
+for example 4096 bytes.
+.TP
+.I vers
+This field holds a version number for the structures.
+It must be compared to
+.B FANOTIFY_METADATA_VERSION
+to verify that the structures at runtime match the structures at compile
+time.
+In case of a mismatch, the fanotify file descriptor has to be closed.
+.TP
+.I reserved
+This field is not used.
+.TP
+.I metadata_len
+This is the length of the structure.
+The field was introduced to facilitate the implementation of optional headers
+per event type.
+Non exist yet.
+.TP
+.I mask
+This is a bit mask describing the event.
+.TP
+.I fd
+This is an open file descriptor for the object being accessed or
+.B FAN_NOFD
+if a queue overflow occurred.
+The file descriptor can be used to access the contents of the monitored file or
+directory.
+It has flag
+.B FMODE_NONOTIFY
+set (see
+.BR fcntl (2)).
+This flag suppresses fanotify event generation.
+Hence when the receiver of the fanotify event accesses the notified file or
+directory using this file descriptor no additional events will be created.
+The reading application is responsible for closing the file descriptor.
+.TP
+.I pid
+This is the ID of the process that caused the event.
+A program listening to fanotify events can compare this PID to the PID returned
+by
+.BR getpid (2),
+to detect, if the event is caused by the listener itself, or is due to a file
+access by another program.
+.PP
+The bit mask in
+.I mask
+signals which events have occured for a single file system object.
+More than one of the following flags can be set at once in the bit mask.
+.TP
+.B FAN_ACCESS
+A file was accessed.
+.TP
+.B FAN_OPEN
+A file was opened.
+.TP
+.B FAN_MODIFY
+A file was modified.
+.TP
+.B FAN_CLOSE_WRITE
+A writable file was closed.
+.TP
+.B FAN_CLOSE_NOWRITE
+A read-only file was closed.
+.TP
+.B FAN_Q_OVERFLOW
+The event queue exceeded the limit of 16384 entries.
+This limit can be overriden in the call to
+.BR fanotify_init (2)
+by setting flag
+.BR FAN_UNLIMITED_QUEUE .
+.TP
+.B FAN_ACCESS_PERM
+An application wants to execute a file or list a directory.
+A decision has to be taken, if the permission to access the file system object
+shall be granted.
+.TP
+.B FAN_OPEN_PERM
+An application wants to open a file or directory.
+A decision has to be taken, if the permission to open the file system object
+shall be granted.
+.PP
+To check for any close event, the following bit mask may be used:
+.TP
+.B FAN_CLOSE
+A file was closed 
+(FAN_CLOSE_WRITE | FAN_CLOSE_NOWRITE).
+.PP
+The following macros are provided to iterate over a buffer with fanotify
+event metadata returned by
+.IR read (2)
+from a fanotify file descriptor.
+.TP
+.B FAN_EVENT_OK(meta, len)
+This macro checks the remaining length
+.I len
+of the buffer
+.I meta
+against the length of the metadata structure and the
+.I event_len
+field of the first metadata structure in the buffer.
+.TP
+.B FAN_EVENT_NEXT(meta, len)
+This macro sets the pointer
+.I meta
+to the next metadata structure using the length indicated in the
+.I event_len
+field of the metadata structure and reduces the remaining length of the
+buffer
+.I len.
+.PP
+For permission events, the application must
+.BR write (2)
+a structure of the following form to the 
+.B fanotify
+file descriptor:
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
+This is the file descriptor from the structure
+.IR fanotify_event_metadata.
+.TP
+.I response
+This field indicates whether or not the permission is to be granted.
+Its value must be either
+.B FAN_ALLOW
+to allow the file operation or
+.B FAN_DENY
+to deny the file operation.
+.PP
+If access has been denied the requesting application call will receive an
+error
+.BR EPERM .
+.PP
+To end listening, it is sufficient to
+.BR close (2)
+the fanotify file descriptor.
+The outstanding permission events will be set to allowed, and all resources
+will be returned to the kernel.
+.PP
+The file 
+.I /proc/<pid>/fdinfo/<fd>
+contains information about fanotify marks for file descriptor fd of process
+pid.
+See
+.I Documentation/filesystems/proc.txt
+for details.
+.SH ERRORS
+In addition to the usual errors for
+.IR read (2),
+the following errors can occur when reading from the fanotify file descriptor:
+.TP
+.B EINVAL
+The buffer is too short to hold the event.
+.TP
+.B EMFILE
+Too many files are open.
+.TP
+.B ETXTBSY
+A write enabled file descriptor shall be created for a file that is executing.
+This occurs if
+.IR fanotify_init (2)
+was called with
+.B O_RDWR
+or
+.B O_WRONLY
+and an event for a monitored file, which is executed, is read.
+.PP
+In addition to the usual errors for
+.IR write (2),
+the following errors can occur when writing to the fanotify file descriptor:
+.TP
+.B EINVAL
+Fanotify access permissions are not enabled in the Kernel configuration or the
+value of
+.I response
+in the response structure is not valid.
+.TP
+.B ENOENT
+The file descriptor
+.I fd
+in the response structure is not valid.
+This might occur because the file was already deleted by another thread or
+process.
+.SH VERSIONS
+The fanotify API was introduced in version 2.6.36 of the Linux kernel and
+enabled in version 2.6.37.
+Fdinfo support was added in version 3.8.
+.SH "CONFORMING TO"
+The fanotify API is Linux-specific.
+.SH NOTES
+The notification is based on the kernel filesystem notification system
+.B fsnotify.
+.PP
+To enable the fanotify API the following setting in the Kernel configuration is
+needed:
+CONFIG_FANOTIFY=y. For permission handling
+CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y must be set.
+.SH EXAMPLE
+The following program demonstrates the usage of the
+.B fanotify
+API.
+It marks the mount passed as argument and waits for events of type
+.B FAN_PERM_OPEN
+and
+.BR FAN_CLOSE_WRITE .
+When a permission event occurs, a
+.B FAN_ALLOW
+response is given.
+.PP
+The following output was recorded while editing file 
+.IR /home/user/temp/notes .
+Before the file was opened a
+.B FAN_OPEN_PERM
+event occurred.
+After the file was closed a
+.B FAN_CLOSE_WRITE
+event occurred.
+The example program ended when hitting the enter key.
+.SS Example output
+.in +4n
+.nf
+#define _GNU_SOURCE // needed for O_LARGEFILE
+#include <errno.h>
+#include <fcntl.h>
+#include <limits.h>
+#include <poll.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/fanotify.h>
+#include <unistd.h>
+
+/* Read all available fanotify events from the file descriptor 'fd' */
+
+int
+handle_events(int fd)
+{
+    const struct fanotify_event_metadata *metadata;
+    char buf[4096];
+    ssize_t len;
+    char path[PATH_MAX];
+    ssize_t path_len;
+    char procfd_path[PATH_MAX];
+    struct fanotify_response response;
+
+    /* Loop while events can be read from fanotify file descriptor. */
+
+    for(;;) {
+
+        /* Read some events. */
+
+        len = read(fd, (void *) &buf, sizeof(buf));
+        if (len == \-1 && errno != EINTR) {
+            perror("read");
+            return EXIT_FAILURE;
+        }
+
+        /* Check if end of available data reached. */
+
+        if (len == 0)
+            break;
+
+        /* Point to the first event in the buffer. */
+
+        metadata = (struct fanotify_event_metadata *) buf;
+
+        /* Loop over all events in the buffer. */
+
+        while (FAN_EVENT_OK(metadata, len)) {
+
+            /* Assert that run time and compile time structures match. */
+
+            if (metadata\->vers != FANOTIFY_METADATA_VERSION) {
+                fprintf(stderr, "Mismatch of fanotify metadata version.\\n");
+                return EXIT_FAILURE;
+            }
+
+            /* Check that the event contains a file descriptor. */
+
+            if (metadata\->fd >= 0) {
+
+                /* Handle open permission event. */
+
+                if (metadata\->mask & FAN_OPEN_PERM) {
+                    printf("FAN_OPEN_PERM: ");
+
+                    /* Allow file to be opened. */
+
+                    response.fd = metadata\->fd;
+                    response.response = FAN_ALLOW;
+                    write(fd, &response, sizeof(
+                              struct fanotify_response));
+                }
+
+                /* Handle closing of writable file event. */
+
+                if (metadata\->mask & FAN_CLOSE_WRITE) {
+                    printf("FAN_CLOSE_WRITE: ");
+                }
+
+                /* Determine path of the file accessed. */
+
+                snprintf(procfd_path, sizeof(procfd_path),
+                         "/proc/self/fd/%d", metadata\->fd);
+                path_len = readlink(procfd_path, path, sizeof(path) \- 1);
+                if (path_len == \-1) {
+                    perror("readlink");
+                    return EXIT_FAILURE;
+                }
+
+                path[path_len] = '\\0';
+                printf("File %s", path);
+
+                /* Close the file descriptor of the event. */
+
+                close(metadata\->fd);
+                printf("\\n");
+            }
+
+            /* Forward pointer to next event. */
+
+            metadata = FAN_EVENT_NEXT(metadata, len);
+        }
+    }
+    return EXIT_SUCCESS;
+}
+
+int
+main(int argc, char *argv[])
+{
+    char buf;
+    int fd, poll_num, ret;
+    nfds_t nfds;
+    struct pollfd fds[2];
+    ret = EXIT_SUCCESS;
+
+    /* Check mount point is supplied. */
+
+    if (argc != 2) {
+        printf("Usage: %s MOUNT\\n", argv[0]);
+        return EXIT_FAILURE;
+    }
+
+    printf("Press enter key to terminate.\\n");
+
+    /* Create the file descriptor for accessing the fanotify API. */
+
+    fd = fanotify_init(FAN_CLOEXEC | FAN_CLASS_CONTENT | FAN_NONBLOCK,
+                       O_RDONLY | O_LARGEFILE);
+    if (fd == \-1) {
+        perror("fanotify_init");
+        return EXIT_FAILURE;
+    }
+
+    /* Mark the mount for
+       \- permission events before opening files
+       \- notification events after closing a write enabled file descriptor. */
+
+    if (fanotify_mark(fd, FAN_MARK_ADD | FAN_MARK_MOUNT,
+                      FAN_OPEN_PERM | FAN_CLOSE_WRITE, \-1,
+                      argv[1]) == \-1) {
+        perror("fanotify_mark");
+        close(fd);
+        return EXIT_FAILURE;
+    }
+
+    /* Prepare for polling. */
+
+    nfds = 2;
+
+    /* Console input. */
+
+    fds[0].fd = STDIN_FILENO;
+    fds[0].events = POLLIN;
+    fds[0].revents = 0;
+
+    /* Fanotify input. */
+
+    fds[1].fd = fd;
+    fds[1].events = POLLIN;
+    fds[1].revents = 0;
+
+    /* This is the loop to wait for incoming events. */
+
+    printf("Listening for events.\\n");
+    while (ret == EXIT_SUCCESS) {
+        poll_num = poll(fds, nfds, \-1);
+        if (poll_num > 0) {
+            if (fds[0].revents & POLLIN) {
+
+                /* Console input is available. Empty stdin and quit. */
+
+                while(read(STDIN_FILENO, &buf, 1) > 0 && buf != '\\n')
+                    continue;
+                break;
+            }
+            if (fds[1].revents & POLLIN) {
+
+                /* Fanotify events are available. */
+
+                ret = handle_events(fd);
+                fds[1].revents = 0;
+            }
+        } else if (poll_num == \-1 && errno != EINTR) {
+            perror("poll");
+            ret = EXIT_FAILURE;
+        }
+    }
+
+    /* Close fanotify file descriptor. */
+
+    close(fd);
+    printf("Listening for events stopped.\\n");
+    return ret;
+}
+.fi
+.SH "SEE ALSO"
+.ad l
+.BR fanotify_init (2),
+.BR fanotify_mark (2),
+.BR inotify (7)
diff --git a/man7/inotify.7 b/man7/inotify.7
index e1cabe2..f9605ef 100644
--- a/man7/inotify.7
+++ b/man7/inotify.7
@@ -505,6 +505,7 @@ instead checked if the most recent event could be coalesced with the
 .I oldest
 unread event.
 .SH SEE ALSO
+.BR fanotify (7),
 .BR inotifywait (1),
 .BR inotifywatch (1),
 .BR inotify_add_watch (2),
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
