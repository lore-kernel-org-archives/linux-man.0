From: Xypron <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 1/1] Documentation of the fanotify interface.
Date: Sun, 25 Nov 2012 21:41:33 +0100
Message-ID: <50B2827D.7070004@gmx.de>
References: <1353790354-14452-1-git-send-email-xypron.glpk@gmx.de> <CAKgNAkjmj5kOvkfWGTGH-GE=fak+C2_3PComW3im-tW3i5w6Xw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjmj5kOvkfWGTGH-GE=fak+C2_3PComW3im-tW3i5w6Xw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>, James Hunt <james.hunt-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Michael,

thank you for reviewing my patch.

The most versatile test program for the fanotify API I have seen so far
is by Eric:
http://git.infradead.org/users/eparis/fanotify-example.git

For polling the following example exists:
http://www.lanedo.com/~aleksander/fanotify/fanotify-example.c

Another program is
https://launchpad.net/fatrace

I have corrected some obvious misspells and formatting issues in
fanotify (7) and uploaded my suggestion for the fanotify manpages to
http://git.xypron.de/?p=fanotify-manpages.git

Could you, please, indicate if the scope of the page is right. Is there
any information that you would prefer to be in section 2 man pages. Or
is there information in the section 2 man pages that should be moved to 7?

An example would make sense. But what length of example is allowable in
a man page? I guess a complete example will have 100 or more lines.

Should alternative APIs like inotify and dnotify be mentioned in
SEE ALSO?

My understanding is that you would prefer the verbatim license as in
man3/get_nprocs_conf.3 to any other license.

Best regards

Heinrich Schuchardt


--- /dev/null	2012-11-25 19:56:52.352390081 +0100
+++ man7/fanotify.7	2012-11-25 21:28:49.191649737 +0100
@@ -0,0 +1,217 @@
+.\" Copyright (C) 2012 Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
+.\"
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
+.\"
+.TH FANOTIFY 7 2012-11-23 "Linux" "Linux Programmer's Manual"
+.SH NAME
+fanotify \- monitoring file system events
+.SH DESCRIPTION
+The
+.I fanotify
+API provides notification, and interception of file system events. Use
cases
+are virus scanning and hierarchical storage management.
+
+The following system calls are used with this API:
+.BR fanotify_init (2)
+.BR fanotify_mark (2),
+.BR poll (2),
+.BR ppoll (2),
+.BR read (2),
+.BR write (2),
+and
+.BR close (2).
+.PP
+.BR fanotify_init (2)
+creates and initializes a
+.B fanotify
+group and returns a file descriptor referring to it.
+.br
+.BR fanotify_mark (2)
+adds or removes a file, a directory, or a mount from the notification
group.
+.PP
+When all file descriptors referring to the fanotify group are close the
+notification group is released and the resources are freed for reuse by the
+kernel.
+.PP
+An application first calls
+.BR fanotify_init (2)
+to receive a file descriptor. It uses
+.BR fanotify_mark (2)
+to define for which files, directories, or mounts events shall be created.
+.PP
+Calling
+.BR poll (2)
+or
+.BR ppoll (2)
+will lock until either a file event occurs or it is interrupted by a signal
+(see
+.BR signal (7)).
+If events are able to be read this will be advertised in the returned
events
+mask as
+.B POLLIN
+and if compiled with
+.B _XOPEN_SOURCE
+as
+.B POLLRDNORM.
+.PP
+Calling
+.BR read (2)
+for the file descriptor returned by fanotify will block until either a file
+event occurs or it is interrupted by a signal (see
+.BR signal (7)).
+.BR read (2)
+will return the length of the filled buffer or -1 in case of an error. The
+following errors may occur:
+.TP
+.B EINTR
+a signal has occured.
+.TP
+.B EFAULT
+the read buffer is outside your accessible address space.
+.TP
+.B EAGAIN
+a nonblocking call did not return any data.
+.HP 0
+Each successful call to
+.BR read (2)
+returns a buffer containing one or more of the following structures:
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
+is the length of the structure in as returned by sizeof.
+.TP
+.I vers
+holds the version of the fanotify API generated the structure
+.TP
+.I reserved
+is not used
+.TP
+.I metadata_len
+is the length of the structure. The field was introduced to facilitate the
+implementation of optional headers per event type.
+.TP
+.I mask
+is a bitmask describing the event.
+.TP
+.I fd
+is an open file descriptor for the object being accessed or
+.B FAN_NOFD
+if an queue overflow occured.
+.TP
+.I pid
+is the ID of the process that caused the event.
+.PP
+The bitmask in
+.I mask
+is composed of thefollowing values:
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
+.B FAN_CLOSE
+a file was closed (FAN_CLOSE_WRITE | FAN_CLOSE_NOWRITE).
+.TP
+.B FAN_CLOSE_WRITE
+writtable file closed.
+.TP
+.B FAN_CLOSE_NOWRITE
+unwrittable file closed.
+.TP
+.B FAN_Q_OVERFLOW
+event queued overflowed.
+.TP
+.B FAN_ACCESS_PERM
+file accessed in perm check.
+.TP
+.B FAN_OPEN_PERM
+File open in perm check.
+.TP
+.B FAN_ONDIR
+event occurred against directory.
+.TP
+.B FAN_EVENT_ON_CHILD
+an event for child of a directory occured.
+.PP
+For permission events the application must write to the fanotify file
+descriptor a structure
+.in +4n
+.nf
+struct fanotify_response {
+        __s32 fd;
+        __u32 response;
+};
+.fi
+.in
+.TP 15
+.I fd
+is the file descriptor from structure
+.I fanotify_event_metadata.
+.TP
+.I response
+must be either of
+.br
+.B FAN_ALLOW
+to allow the file operation or
+.br
+.B FAN_DENY
+to deny the file operation.
+.PP
+To end listening it is sufficient to
+.B close (2)
+the fanotify file descriptor. The open permission events will be set to
+allowed, and all resources will be returned to the kernel.
+.SH VERSIONS
+The
+.B fanotify
+API was introduced in version 2.6.36 of the Linux kernel and
+enabled in version 2.6.37.
+.SH "CONFORMING TO"
+This system call is Linux-specific.
+.SH NOTES
+The notification is based on the kernel filesystem notification system
+.B fsnotify.
+.SH "SEE ALSO"
+.ad l
+.nh
+.BR fanotify_init (2),
+.BR fanotify_mark (2)
+.BR dnotify (7),
+.BR inotify (7),
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
