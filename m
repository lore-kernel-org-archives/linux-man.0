From: Juan Manuel Torres Palma <j.m.torrespalma-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] thrd_create.3: Add entry for thrd_create function
Date: Tue,  8 Sep 2015 07:46:02 +0900
Message-ID: <1441665962-14853-1-git-send-email-j.m.torrespalma@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This patch adds a new entry for thrd_create function, belonging
to ISO C11 threads.h API. More than a patch, I see it as a RFC
so someone can tell me if I'm going in the right direction.

My patchset for C11 threads.h is still pending of revision
on glibc, but I have already started working on documentation
for man-pages.

Most of the work in this file is based in pthread_create.3, that was
written by Michael Kerrisk. Please, let me know if I should mention
you on the copyright header.

Signed-off-by: Juan Manuel Torres Palma <j.m.torrespalma-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man3/thrd_create.3 | 104 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 man3/thrd_create.3

diff --git a/man3/thrd_create.3 b/man3/thrd_create.3
new file mode 100644
index 0000000..1e8eb53
--- /dev/null
+++ b/man3/thrd_create.3
@@ -0,0 +1,104 @@
+.\" Copyright (c) 2015 Juan Manuel Torres Palma <j.m.torrespalma-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+.\"
+.\" %%%LICENSE_START(VERBATIM)
+.\" Permission is granted to make and distribute verbatim copies of this
+.\" manual provided the copyright notice and this permission notice are
+.\" preserved on all copies.
+.\"
+.\" Permission is granted to copy and distribute modified versions of this
+.\" manual under the conditions for verbatim copying, provided that the
+.\" entire resulting derived work is distributed under the terms of a
+.\" permission notice identical to this one.
+.\"
+.\" Since the Linux kernel and libraries are constantly changing, this
+.\" manual page may be incorrect or out-of-date.  The author(s) assume no
+.\" responsibility for errors or omissions, or for damages resulting from
+.\" the use of the information contained herein.  The author(s) may not
+.\" have taken the same level of care in the production of this manual,
+.\" which is licensed free of charge, as they might when working
+.\" professionally.
+.\"
+.\" Formatted or processed versions of this manual, if unaccompanied by
+.\" the source, must acknowledge the copyright and authors of this work.
+.\" %%%LICENSE_END
+.\"
+.TH THRD_CREATE 3 2015-07-23 "Linux" "Linux Programmer's Manual"
+.SH NAME
+thrd_create \- create a new thread
+.SH SYNOPSIS
+.nf
+.B #include <threads.h>
+
+.BI "int thrd_create(thrd_t *" thread ", thrd_start_t " func ", void *" arg );
+.fi
+.sp
+Compile and link with \fI\-lpthread\fP or \fI\-pthread\fP.
+.SH DESCRIPTION
+Create a new thread that executes
+.IR func ();
+being
+.IR arg
+the argument passed to
+.IR func ().
+
+The new thread could finish in any of the following ways:
+.IP * 2
+By calling
+.BR thrd_exit (3).
+.IP *
+By reaching a
+.I return
+statement. This is equivalent to calling
+.BR thrd_exit (3),
+returning the value specified in the
+.I return
+statement.
+.IP *
+Any of the threads in the process calls
+.BR exit (3),
+or the main thread performs a return from
+.IR main ().
+This causes the termination of all threads in the process.
+
+When called, a successful call to
+.BR thrd_create (),
+if successful, the ID of the new thread in the buffer pointed to by
+.IR thread ;
+this identifier is used to refer to the thread
+in subsequent calls to other thread functions.
+
+.SS Linux-specific details
+The
+.IR <threads.h>
+API is implemented on top of
+.IR <pthread.h>
+functions, so most of the documentation found for
+.IR <pthread.h>
+is applicable for
+.IR <threads.h>
+too.
+.SH RETURN VALUE
+.TP
+.B thrd_success
+Indicates that new thread has been created successfully.
+.TP
+.B thrd_nomem
+The new thread could not be spawned because there was not
+sufficient memory to allocate resources.
+.TP
+.B thrd_error
+Any other error occurred and the new thread could not be created.
+.SH ERRORS
+All the errors caused by
+.IR <threads.h>
+functions are notified via return values. Check
+.B RETURN VALUE
+section for more details.
+.SH CONFORMING TO
+ISO/IEC 9899:2011, C11.
+.SH SEE ALSO
+.ad l
+.nh
+.BR thrd_exit (3),
+.BR thrd_join (3),
+.BR thrd_current (3)
-- 
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
