From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Document struct sigevent in sigevent(7)
Date: Sun, 19 Sep 2010 18:31:58 +0200
Message-ID: <AANLkTi=NNNrLAEDy-rEoPuqxyhHWj_py2QdUMmsjhyUb@mail.gmail.com>
References: <20090415111442.GN8940@machine.or.cz> <AANLkTin1o4JQ98zmsox6Qg9R5oaPCswieATTd98rCSjY@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTin1o4JQ98zmsox6Qg9R5oaPCswieATTd98rCSjY-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Petr,

The corresponding patch elsewhere in the set would then be as below.
Again, comments welcome.

Cheers,

Michael


diff --git a/man2/timer_create.2 b/man2/timer_create.2
index f5b8847..93af539 100644
--- a/man2/timer_create.2
+++ b/man2/timer_create.2
@@ -20,7 +20,7 @@
 .\"
 .\" Formatted or processed versions of this manual, if unaccompanied by
 .\" the source, must acknowledge the copyright and authors of this work.
-.TH TIMER_CREATE 2 2009-02-20 Linux "Linux Programmer's Manual"
+.TH TIMER_CREATE 2 2010-09-19 Linux "Linux Programmer's Manual"
 .SH NAME
 timer_create \- create a POSIX per-process timer
 .SH SYNOPSIS
@@ -90,37 +90,12 @@ argument points to a
 .I sigevent
 structure that specifies how the caller
 should be notified when the timer expires.
-This structure is defined something like the following:
+For the definition and general details of this structure, see
+.BR sigevent (7).

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
+The
+.I evp.sigev_notify
+field can have the following values:
 .TP
 .BR SIGEV_NONE
 Don't asynchronously notify when the timer expires.
@@ -131,13 +106,15 @@ Progress of the timer can be monitored using
 Upon timer expiration, generate the signal
 .I sigev_signo
 for the process.
-If
-.I sigev_signo
-is a real-time signal,
-then it will be accompanied by the data specified in
-.IR sigev_value
-(like the signal-accompanying data for
-.BR sigqueue (2)).
+See
+.BR sigevent (7)
+for general details.
+The
+.I si_code
+field of the
+.I siginfo_t
+structure will be set to
+.BR SI_TIMER .
 At any point in time,
 at most one signal is queued to the process for a given timer; see
 .BR timer_getoverrun (2)
@@ -147,18 +124,9 @@ for more details.
 Upon timer expiration, invoke
 .I sigev_notify_function
 as if it were the start function of a new thread.
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
-.BR pthread_attr_init (3)).
+See
+.BR sigevent (7)
+for details.
 .TP
 .BR SIGEV_THREAD_ID " (Linux-specific)"
 As for
@@ -430,5 +398,6 @@ main(int argc, char *argv[])
 .BR clock_getcpuclockid (3),
 .BR pthread_getcpuclockid (3),
 .BR pthreads (7),
+.BR sigevent (7),
 .BR signal (7),
 .BR time (7)
diff --git a/man3/aio_fsync.3 b/man3/aio_fsync.3
index cd9afc9..949d02d 100644
--- a/man3/aio_fsync.3
+++ b/man3/aio_fsync.3
@@ -20,7 +20,7 @@
 .\" Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111,
 .\" USA.
 .\"
-.TH AIO_FSYNC 3 2003-11-14  "" "Linux Programmer's Manual"
+.TH AIO_FSYNC 3 2010-09-19  "" "Linux Programmer's Manual"
 .SH NAME
 aio_fsync \- asynchronous file synchronization
 .SH SYNOPSIS
@@ -58,8 +58,12 @@ the only field in the structure pointed to by
 .I aiocbp
 that is used by this call is the
 .I aio_sigevent
-field (a \fIstruct sigevent\fP) that indicates the desired type of
-asynchronous notification at completion.
+field (a
+.I sigevent
+structure, described in
+.BR sigevent (7)),
+which indicates the desired type of asynchronous notification at completion.
+,\" FIXME more sigevent details are probably needed here.
 All other fields are ignored.
 .SH "RETURN VALUE"
 On success (the sync request was successfully queued)
@@ -91,4 +95,5 @@ POSIX.1-2001.
 .BR aio_read (3),
 .BR aio_return (3),
 .BR aio_suspend (3),
-.BR aio_write (3)
+.BR aio_write (3),
+.BR sigevent (7)
diff --git a/man3/mq_notify.3 b/man3/mq_notify.3
index fba2d8f..f387f42 100644
--- a/man3/mq_notify.3
+++ b/man3/mq_notify.3
@@ -23,7 +23,7 @@
 .\" Formatted or processed versions of this manual, if unaccompanied by
 .\" the source, must acknowledge the copyright and authors of this work.
 .\"
-.TH MQ_NOTIFY 3 2010-08-29 "Linux" "Linux Programmer's Manual"
+.TH MQ_NOTIFY 3 2010-09-19 "Linux" "Linux Programmer's Manual"
 .SH NAME
 mq_notify \- register for notification when a message is available
 .SH SYNOPSIS
@@ -45,28 +45,9 @@ The
 .I notification
 argument is a pointer to a
 .I sigevent
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
+structure.
+For the definition and general details of this structure, see
+.BR sigevent (7).
 .PP
 If
 .I notification
@@ -77,7 +58,7 @@ The
 .I sigev_notify
 field of the
 .I sigevent
-to which
+structure to which
 .I notification
 points specifies how notification is to be performed.
 This field has one of the following values:
@@ -90,43 +71,30 @@ for notification, but when a message arrives, no
notification is sent.
 .B SIGEV_SIGNAL
 Notify the process by sending the signal specified in
 .IR sigev_signo .
-If the signal is caught with a signal handler that
-was registered using the
-.BR sigaction (2)
-.B SA_SIGINFO
-flag, then the following fields are set in the
-.I siginfo_t
-structure that is passed as the second argument of the handler:
+See
+.BR sigevent (7)
+for general details.
+The
 .I si_code
-is set to
-.BR SI_MESGQ ;
-.I si_signo
-is set to the signal number;
-.I si_value
-is set to the value specified in
-.IR notification\->sigev_value ;
+field of the
+.I siginfo_t
+structure will be set to
+.BR SI_MESGQ .
+In addition,
 .\" I don't know of other implementations that set
 .\" si_pid and si_uid -- MTK
 .I si_pid
-is set to the PID of the process that sent the message; and
+will be set to the PID of the process that sent the message, and
 .I si_uid
-is set to the real user ID of the sending process.
-The same information is available if the signal is accepted using
-.BR sigwaitinfo (2).
+will be set to the real user ID of the sending process.
 .TP
 .B SIGEV_THREAD
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
+Upon message delivery, invoke
+.I sigev_notify_function
+as if it were the start function of a new thread.
+See
+.BR sigevent (7)
+for details.
 .PP
 Only one process can be registered to receive notification
 from a message queue.
@@ -279,4 +247,5 @@ main(int argc, char *argv[])
 .BR mq_receive (3),
 .BR mq_send (3),
 .BR mq_unlink (3),
-.BR mq_overview (7)
+.BR mq_overview (7),
+.BR sigevent (7)
diff --git a/man7/signal.7 b/man7/signal.7
index d67c893..8c418f8 100644
--- a/man7/signal.7
+++ b/man7/signal.7
@@ -41,7 +41,7 @@
 .\"     Added section on stop/cont signals interrupting syscalls.
 .\" 2008-10-05, mtk: various additions
 .\"
-.TH SIGNAL 7  2010-06-12 "Linux" "Linux Programmer's Manual"
+.TH SIGNAL 7  2010-09-19 "Linux" "Linux Programmer's Manual"
 .SH NAME
 signal \- overview of signals
 .SH DESCRIPTION
@@ -873,4 +873,5 @@ signal 29 is
 .BR sysv_signal (3),
 .BR core (5),
 .BR proc (5),
-.BR pthreads (7)
+.BR pthreads (7),
+.BR sigevent (7)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
