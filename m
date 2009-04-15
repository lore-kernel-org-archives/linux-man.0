From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: [PATCH] Document struct sigevent in sigevent(7)
Date: Wed, 15 Apr 2009 13:14:42 +0200
Message-ID: <20090415111442.GN8940@machine.or.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The sigevent structure is used as a common interface for several
asynchronous pthreads functions; also, getaddrinfo_a() uses it
and in the future, other library functions might.

Currently, it is completely non-descript in some cases, plus
there are two competing descriptions in timer_create(2) and
mq_notify(3) (the former appears to be based on the latter).
This patch attempts to unify the descriptions in a single
manual page and networks it to the rest, so that I do not
have to add yet another description for the getaddrinfo_a(3)
manual page (currently in the works).

P.S.: There are two unresolved issues with this patch - the
timer_create(2) requirement of real-time signal requirements
is somewhat confusing and it seems that SIGEV_THREAD_ID can
be or'd with SIGEV_SIGNAL or not. I did not have time to research
this so far, so I decided to rather send it in and see if someone
knows about this off the top of their head.

Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>

diff --git a/man2/timer_create.2 b/man2/timer_create.2
index 92178e0..8f7c4d2 100644
--- a/man2/timer_create.2
+++ b/man2/timer_create.2
@@ -88,92 +88,21 @@ or
 The
 .I evp
 argument points to a
-.I sigevent
+.IR sigevent (7)
 structure that specifies how the caller
 should be notified when the timer expires.
-This structure is defined something like the following:
-
-.in +4n
-.nf
-union sigval {
-    int   sival_int;
-    void *sival_ptr;
-};
-
-struct sigevent {
-    int          sigev_notify;    /* Notification method */
-    int          sigev_signo;     /* Timer expiration signal */
-    union sigval sigev_value;     /* Value accompanying signal or
-                                     passed to thread function */
-    void       (*sigev_notify_function) (union sigval);
-                   /* Function used for thread
-                      notifications (SIGEV_THREAD) */
-    void        *sigev_notify_attributes;
-                   /* Attributes for notification thread
-                      (SIGEV_THREAD) */
-    pid_t        sigev_notify_thread_id;
-                   /* ID of thread to signal (SIGEV_THREAD_ID) */
-};
-.fi
-.in
-
-Some of these fields may be defined as part of a union:
-a program should only employ those fields relevant
-to the value specified in
-.IR sigev_notify .
-This field can have the following values:
-.TP
-.BR SIGEV_NONE
-Don't asynchronously notify when the timer expires.
-Progress of the timer can be monitored using
+In case its
+.I sigev_notify
+field is set to
+.BR SIGEV_NONE ,
+the progress of the timer can be monitored using
 .BR timer_gettime (2).
-.TP
+If the
 .BR SIGEV_SIGNAL
-Upon timer expiration, generate the signal
-.I sigev_signo
-for the process.
-If
-.I sigev_signo
-is a real-time signal,
-then it will be accompanied by the data specified in
-.IR sigev_value
-(like the signal-accompanying data for
-.BR sigqueue (2)).
-At any point in time,
+notification is used, at any point in time
 at most one signal is queued to the process for a given timer; see
 .BR timer_getoverrun (2)
 for more details.
-.TP
-.BR SIGEV_THREAD
-Upon timer expiration, invoke
-.I sigev_notify_function
-as if it were the start function of a new thread.
-(Among the implementation possibilities here are that
-each timer notification could result in the creation of a new thread,
-or that a single thread is created to receive all notifications.)
-The function is invoked with
-.I sigev_value
-as its sole argument.
-If
-.I sigev_notify_attributes
-is not NULL, it should point to a
-.I pthread_attr_t
-structure that defines attributes for the new thread (see
-.BR pthread_attr_init (3).
-.TP
-.BR SIGEV_THREAD_ID " (Linux-specific)"
-As for
-.BR SIGEV_SIGNAL ,
-but the signal is targeted at the thread whose ID is given in
-.IR sigev_notify_thread_id ,
-which must be a thread in the same process as the caller.
-The
-.IR sigev_notify_thread_id
-field specifies a kernel thread ID, that is, the value returned by
-.BR clone (2)
-or
-.BR gettid (2).
-This flag is only intended for use by threading libraries.
 .PP
 Specifying
 .I evp
@@ -431,4 +360,5 @@ main(int argc, char *argv[])
 .BR pthread_getcpuclockid (3),
 .BR pthreads (7),
 .BR signal (7),
+.BR sigevent (7),
 .BR time (7)
diff --git a/man3/aio_fsync.3 b/man3/aio_fsync.3
index cd9afc9..8babcd1 100644
--- a/man3/aio_fsync.3
+++ b/man3/aio_fsync.3
@@ -58,7 +58,9 @@ the only field in the structure pointed to by
 .I aiocbp
 that is used by this call is the
 .I aio_sigevent
-field (a \fIstruct sigevent\fP) that indicates the desired type of
+field (pointer to a
+.IR sigevent (7)
+structure) that indicates the desired type of
 asynchronous notification at completion.
 All other fields are ignored.
 .SH "RETURN VALUE"
@@ -91,4 +93,5 @@ POSIX.1-2001.
 .BR aio_read (3),
 .BR aio_return (3),
 .BR aio_suspend (3),
-.BR aio_write (3)
+.BR aio_write (3),
+.BR sigevent (7)
diff --git a/man3/mq_notify.3 b/man3/mq_notify.3
index 1b5df1a..a499bf8 100644
--- a/man3/mq_notify.3
+++ b/man3/mq_notify.3
@@ -44,90 +44,12 @@ the empty message queue referred to by the descriptor
 The
 .I notification
 argument is a pointer to a
-.I sigevent
-structure that is defined something like the following:
-.in +4n
-.nf
-
-union sigval {          /* Data passed with notification */
-    int     sival_int;         /* Integer value */
-    void   *sival_ptr;         /* Pointer value */
-};
-
-struct sigevent {
-    int          sigev_notify; /* Notification method */
-    int          sigev_signo;  /* Notification signal */
-    union sigval sigev_value;  /* Data passed with
-                                  notification */
-    void       (*sigev_notify_function) (union sigval);
-                               /* Function for thread
-                                  notification */
-    void        *sigev_notify_attributes;
-                               /* Thread function attributes */
-};
-.fi
-.in
-.PP
-If
+.IR sigevent (7)
+structure.  If
 .I notification
 is a non-NULL pointer, then
 .BR mq_notify ()
 registers the calling process to receive message notification.
-The
-.I sigev_notify
-field of the
-.I sigevent
-to which
-.I notification
-points specifies how notification is to be performed.
-This field has one of the following values:
-.TP
-.B SIGEV_NONE
-A "null" notification: the calling process is registered as the target
-for notification, but when a message arrives, no notification is sent.
-.\" When is SIGEV_NONE useful?
-.TP
-.B SIGEV_SIGNAL
-Notify the process by sending the signal specified in
-.IR sigev_signo .
-If the signal is caught with a signal handler that
-was registered using the
-.BR sigaction (2)
-.B SA_SIGINFO
-flag, then the following fields are set in the
-.I siginfo_t
-structure that is passed as the second argument of the handler:
-.I si_code
-is set to
-.BR SI_MESGQ ;
-.I si_signo
-is set to the signal number;
-.I si_value
-is set to the value specified in
-.IR notification\->sigev_value ;
-.\" I don't know of other implementations that set
-.\" si_pid and si_uid -- MTK
-.I si_pid
-is set to the PID of the process that sent the message; and
-.I si_uid
-is set to the real user ID of the sending process.
-The same information is available if the signal is accepted using
-.BR sigwaitinfo (2).
-.TP
-.B SIGEV_THREAD
-Deliver notification by invoking
-.I notification\->sigev_notify_function
-as the start function of a new thread.
-The function is invoked with
-.I notification\->sigev_value
-as its sole argument.
-If
-.I notification\->sigev_notify_attributes
-is not NULL, then it should point to a
-.I pthread_attr_t
-structure that defines attributes for the thread (see
-.BR pthread_attr_init (3)).
-.PP
 Only one process can be registered to receive notification
 from a message queue.
 
@@ -266,4 +188,5 @@ main(int argc, char *argv[])
 .BR mq_receive (3),
 .BR mq_send (3),
 .BR mq_unlink (3),
-.BR mq_overview (7)
+.BR mq_overview (7),
+.BR sigevent (7)
diff --git a/man7/sigevent.7 b/man7/sigevent.7
index e69de29..0434440 100644
--- a/man7/sigevent.7
+++ b/man7/sigevent.7
@@ -0,0 +1,137 @@
+.\" Copyright (C) 2006 Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+.\" Copyright (C) 2009 Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
+.\"
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
+.\"
+.TH SIGEVENT 3 2009-04-08 "GNU" "Linux Programmer's Manual"
+.SH NAME
+struct sigevent \- structure for notification from asynchronous routines
+.SH SYNOPSIS
+.nf
+
+union sigval {          /* Data passed with notification */
+    int     sival_int;         /* Integer value */
+    void   *sival_ptr;         /* Pointer value */
+};
+
+struct sigevent {
+    int          sigev_notify; /* Notification method */
+    int          sigev_signo;  /* Notification signal */
+    union sigval sigev_value;  /* Data passed with
+                                  notification */
+    void       (*sigev_notify_function) (union sigval);
+                   /* Function used for thread
+                      notification (SIGEV_THREAD) */
+    void        *sigev_notify_attributes;
+                   /* Attributes for notification thread
+                      (SIGEV_THREAD) */
+    pid_t        sigev_notify_thread_id;
+                   /* ID of thread to signal (SIGEV_THREAD_ID) */
+};
+.fi
+.SH DESCRIPTION
+.PP
+This structure is used by various modern asynchronous routines
+(mainly, but not exclusively, those of POSIX threads API),
+to describe the way a process wishes to be notified about
+the progress of the routine.
+.PP
+Some of these fields may be defined as part of a union:
+a program should only employ those fields relevant
+to the value specified in
+.IR sigev_notify .
+.PP
+The
+.I sigev_notify
+field specifies how notification is to be performed.
+This field can have one of the following values:
+.TP
+.BR SIGEV_NONE
+A "null" notification: the calling process is registered as the target
+for notification, but when a message arrives, no notification is sent.
+.TP
+.BR SIGEV_SIGNAL
+Notify the process by sending the signal specified in
+.IR sigev_signo .
+If the signal is caught with a signal handler that
+was registered using the
+.BR sigaction (2)
+.B SA_SIGINFO
+flag, then the following fields are set in the
+.I siginfo_t
+structure that is passed as the second argument of the handler:
+.\" Does this happen only for real-time signals? Or only in case of timer_create()?
+.I si_code
+is set appropriately based on the called routine;
+.I si_signo
+is set to the signal number;
+.I si_value
+is set to the value specified in
+.IR sigev_value ;
+.\" I don't know of other implementations that set
+.\" si_pid and si_uid -- MTK
+.I si_pid
+is set to the PID of the process that sent the message; and
+.I si_uid
+is set to the real user ID of the sending process.
+The same information is available if the signal is accepted using
+.BR sigwaitinfo (2).
+.TP
+.BR SIGEV_THREAD
+Deliver the notification by invoking
+.I sigev_notify_function
+as if it were the start function of a new thread.
+(Among the implementation possibilities here are that
+each timer notification could result in the creation of a new thread,
+or that a single thread is created to receive all notifications.)
+The function is invoked with
+.I sigev_value
+as its sole argument.
+If
+.I sigev_notify_attributes
+is not NULL, it should point to a
+.I pthread_attr_t
+structure that defines attributes for the new thread (see
+.BR pthread_attr_init (3)).
+.TP
+.\" | SIGEV_SIGNAL vs not?
+.BR SIGEV_THREAD_ID " (Linux-specific)"
+As for
+.BR SIGEV_SIGNAL ,
+but the signal is targeted at the thread whose ID is given in
+.IR sigev_notify_thread_id ,
+which must be a thread in the same process as the caller.
+The
+.IR sigev_notify_thread_id
+field specifies a kernel thread ID, that is, the value returned by
+.BR clone (2)
+or
+.BR gettid (2).
+This value is only intended for use by threading libraries.
+.SH CONFORMING TO
+POSIX.1-2001.
+.SH "SEE ALSO"
+.BR mq_notify (3),
+.BR timer_create (2),
+.BR aio_fsync (3),
+.BR lio_listio (3),
+.BR getaddrinfo_a (3),
+.BR pthreads (7)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
