From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: [PATCH] man3/getaddrinfo_a.3: New manual page
Date: Wed, 22 Apr 2009 02:53:15 +0200
Message-ID: <20090422005315.GM21271@machine.or.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This patch adds original documentation for the getaddrinfo_a(3)
glibc function and the associated suite of gai_suspend(3),
gai_error(3) and gai_cancel(3), including two example programs.

The notification facility is not demonstrated in the interactive
frontend since I judged the would-be extra machinery as too
obscuring (and producing potentially messy results if using
signal notification). Maybe a third pthread example would be due?

Please review and comment.

Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>

diff --git a/man3/gai_cancel.3 b/man3/gai_cancel.3
index e69de29..1b0f392 100644
--- a/man3/gai_cancel.3
+++ b/man3/gai_cancel.3
@@ -0,0 +1 @@
+.so man3/getaddrinfo_a.3
diff --git a/man3/gai_error.3 b/man3/gai_error.3
index e69de29..1b0f392 100644
--- a/man3/gai_error.3
+++ b/man3/gai_error.3
@@ -0,0 +1 @@
+.so man3/getaddrinfo_a.3
diff --git a/man3/gai_suspend.3 b/man3/gai_suspend.3
index e69de29..1b0f392 100644
--- a/man3/gai_suspend.3
+++ b/man3/gai_suspend.3
@@ -0,0 +1 @@
+.so man3/getaddrinfo_a.3
diff --git a/man3/getaddrinfo.3 b/man3/getaddrinfo.3
index 0917006..c02866c 100644
--- a/man3/getaddrinfo.3
+++ b/man3/getaddrinfo.3
@@ -801,6 +801,7 @@ main(int argc, char *argv[])
 .SH "SEE ALSO"
 .\" .BR getipnodebyaddr (3),
 .\" .BR getipnodebyname (3),
+.BR getaddrinfo_a (3),
 .BR gethostbyname (3),
 .BR getnameinfo (3),
 .BR inet (3),
diff --git a/man3/getaddrinfo_a.3 b/man3/getaddrinfo_a.3
index e69de29..c32331f 100644
--- a/man3/getaddrinfo_a.3
+++ b/man3/getaddrinfo_a.3
@@ -0,0 +1,478 @@
+.\" Copyright (c) 2009 Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
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
+.\" References: http://people.redhat.com/drepper/asynchnl.pdf,
+.\" 	http://www.imperialviolet.org/page25.html#e498
+.\"
+.TH GETADDRINFO_A 3 2009-04-08 "GNU" "Linux Programmer's Manual"
+.SH NAME
+getaddrinfo_a, gai_suspend, gai_error, gai_cancel \- asynchronous
+network address and service translation
+.SH SYNOPSIS
+.nf
+.B #define _GNU_SOURCE
+.B #include <sys/types.h>
+.B #include <sys/socket.h>
+.B #include <signal.h>
+.B #include <netdb.h>
+.sp
+.BI "int getaddrinfo_a(int " "mode" ", struct gaicb *" "list[]" ,
+.BI "                int " "ent" ", struct sigevent *" "sig" );
+.sp
+.BI "int gai_suspend(struct gaicb *" "list[]" ", int " "ent" ,
+.BI "                struct timespec *" "timeout" );
+.sp
+.BI "int gai_error(struct gaicb *" "req" );
+.sp
+.BI "int gai_cancel(struct gaicb *" "req" );
+.sp
+Link with \fI\-lanl\fP.
+.fi
+.SH DESCRIPTION
+The function
+.BR getaddrinfo_a ()
+will process in parallel the given list of requests,
+either synchronously or asynchronously
+with optional notification. The
+.I mode
+parameter can be either
+.B GAI_WAIT
+for synchronous lookup or
+.B GAI_NOWAIT
+if the function shall return immediately
+while the requests are being resolved on background;
+in that case, notifications about resolved requests
+can be sent based on the
+.I sig
+parameter (see
+.BR sigevent (7)
+for details).
+.PP
+The requests to process are given in the
+.I list
+array of
+.I ent
+entries and are fired in parallel - if any element
+of the list is NULL, this element is ignored.
+Each request is described by the
+.I gaicb
+structure that is defined as follows:
+.sp
+.in +4n
+.nf
+struct gaicb {
+    const char *ar_name;
+    const char *ar_service;
+    const struct addrinfo *ar_request;
+    struct addrinfo *ar_result;
+};
+.fi
+.in
+.PP
+The elements of this structure simply correspond
+to arguments of
+.BR getaddrinfo (3).
+Thus,
+.I ar_name
+corresponds to the
+.I node
+parameter and
+.I ar_service
+to the
+.I service
+parameter, identifying an Internet host and a service.
+The
+.I ar_request
+element represents the
+.I hints
+parameter, specifying the criteria for selecting
+the returned socket address structures.
+Finally,
+.I ar_result
+is the same as the
+.I res
+parameter; you do not need to initialize this element,
+it will be automatically set when the request
+is resolved.
+The
+.I addrinfo
+structure referenced by the last two elements is described
+along the documentation of
+.BR getaddrinfo (3).
+.PP
+The
+.BR gai_suspend ()
+routine will suspend execution of the calling thread
+until at least one of the requests (given in the
+.I list
+array of
+.I ent
+elements; NULL pointers are ignored) is completed,
+a signal is received, or the time interval specified in
+.I timeout
+elapses (if the argument is not NULL).
+No explicit indication of which request was completed
+is given - you must determine that by iterating with
+.BR gai_error ()
+over the list of requests.
+.PP
+The
+.BR gai_error ()
+function will return the status of the given request - either
+.B EAI_INPROGRESS
+if the request was not completed yet,
+0 if it was handled successfully,
+or an error code if the request could not be resolved.
+.PP
+The
+.BR gai_cancel ()
+function will cancel the given request
+.IR req .
+If the request has been cancelled successfully,
+the error status of the request will be set to
+.B EAI_CANCELLED
+and normal asynchronous notification will be performed;
+the request cannot be cancelled if it is currently being
+processed - in that case, it will be handled as if
+this function has never been called.
+If
+.I req
+is NULL, all outstanding requests the process has made
+are attempted to be cancelled.
+
+.SH "RETURN VALUE"
+.BR getaddrinfo_a ()
+returns 0 if all the requests have been enqueued successfully,
+or one of the following non-zero error codes:
+.TP
+.B EAI_AGAIN
+The resources necessary to enqueue the lookup requests were not
+available. The application may check the error status of each
+request to determine which ones failed.
+.TP
+.B EAI_MEMORY
+Out of memory.
+.PP
+.BR gai_suspend ()
+returns 0 if at least one of the listed requests has been completed.
+Otherwise, it returns one of the following non-zero error codes:
+.TP
+.B EAI_AGAIN
+The given timeout expired before any of the requests could be completed.
+.TP
+.B EAI_ALLDONE
+There were no actual requests given to the function.
+.TP
+.B EAI_INTR
+A signal has interrupted the function. Note that this interruption might
+be potentially caused by signal notification of some completed request.
+.PP
+.BR gai_error ()
+can return
+.B EAI_INPROGRESS
+for unfinished request, zero for successfully completed one
+(as described above), one of the error codes that could be returned by
+.BR getaddrinfo (3)
+or the error code
+.B EAI_CANCELLED
+if the request has been cancelled explicitly before it could be finished.
+.PP
+The
+.BR gai_cancel ()
+function can return one of these values:
+.TP
+.B EAI_CANCELLED
+The request has been cancelled successfully.
+.TP
+.B EAI_NOTCANCELLED
+The request has not been cancelled.
+.TP
+.B EAI_ALLDONE
+The request has already completed.
+.P
+The
+.BR gai_strerror (3)
+function translates these error codes to a human readable string,
+suitable for error reporting.
+.SH "CONFORMING TO"
+These functions are GNU extensions;
+they first appeared in glibc in version 2.2.3.
+.SH "NOTES"
+The interface of
+.BR getaddrinfo_a ()
+was modelled after the
+.BR lio_listio (3)
+pthreads interface.
+.SH EXAMPLE
+Two examples are provided - simple example showing just resolving
+several requests in parallel synchronously, and complex example
+showing some of the asynchronous capabilities.
+.SS Synchronous Example
+The program will simply resolve several hostnames in parallel,
+giving a speed-up compared to resolving the hostnames sequentially
+using the classical interfaces. It might be used like this:
+.in +4n
+.nf
+
+$ \fB./a.out ftp.us.kernel.org enoent.linuxfoundation.org gnu.cz\fP
+ftp.us.kernel.org: 128.30.2.36
+enoent.linuxfoundation.org: Name or service not known
+gnu.cz: 87.236.197.13
+.fi
+.in
+.PP
+This is the example source code:
+.nf
+
+#define _GNU_SOURCE
+#include <sys/types.h>
+#include <sys/socket.h>
+#include <signal.h>
+#include <netdb.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+int
+main(int argc, char *argv[])
+{
+    int i;
+
+    if (argc < 2) {
+        fprintf(stderr, "Usage: %s HOST...\\n", argv[0]);
+        exit(EXIT_FAILURE);
+    }
+
+    struct gaicb *reqs[argc - 1];
+    for (i = 0; i < argc - 1; i++) {
+        reqs[i] = alloca(sizeof(*reqs[0]));
+        memset(reqs[i], 0, sizeof(*reqs[0]));
+        reqs[i]->ar_name = argv[i + 1];
+    }
+
+    int ret;
+    ret = getaddrinfo_a(GAI_WAIT, reqs, argc - 1, NULL);
+    if (ret) {
+        fprintf(stderr, "getaddrinfo_a() failed: %s\\n",
+                gai_strerror(ret));
+        exit(EXIT_FAILURE);
+    }
+
+    for (i = 0; i < argc - 1; i++) {
+        printf("%s: ", reqs[i]->ar_name);
+        int ret = gai_error(reqs[i]);
+        if (!ret) {
+            char host[NI_MAXHOST];
+            struct addrinfo *res = reqs[i]->ar_result;
+
+            ret = getnameinfo(res->ai_addr, res->ai_addrlen,
+                    host, sizeof(host),
+                    NULL, 0, NI_NUMERICHOST);
+            if (ret != 0) {
+                fprintf(stderr, "getnameinfo() failed: %s\\n",
+                        gai_strerror(ret));
+                exit(EXIT_FAILURE);
+            }
+            puts(host);
+
+        } else {
+            puts(gai_strerror(ret));
+        }
+    }
+    exit(EXIT_SUCCESS);
+}
+.fi
+
+.SS Asynchronous Example
+This example shows a simple interactive
+.BR getaddrinfo_a ()
+frontend. The notification facility is not demonstrated.
+.PP
+An example session might go like this:
+.in +4n
+.nf
+
+$ \fB./a.out\fP
+> a ftp.us.kernel.org enoent.linuxfoundation.org gnu.cz
+> c 2
+[2] gnu.cz: Request not canceled
+> w 0 1
+[00] ftp.us.kernel.org: Finished
+> l
+[00] ftp.us.kernel.org: 216.165.129.139
+[01] enoent.linuxfoundation.org: Processing request in progress
+[02] gnu.cz: 87.236.197.13
+> l
+[00] ftp.us.kernel.org: 216.165.129.139
+[01] enoent.linuxfoundation.org: Name or service not known
+[02] gnu.cz: 87.236.197.13
+.fi
+.in
+.PP
+The program source goes as follows:
+
+\&
+.nf
+#define _GNU_SOURCE
+#include <sys/types.h>
+#include <sys/socket.h>
+#include <signal.h>
+#include <netdb.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+struct gaicb **reqs = NULL;
+int nreqs = 0;
+
+char *
+getcmd(void)
+{
+    static char buf[256];
+    fputs("> ", stdout); fflush(stdout);
+    if (!fgets(buf, sizeof(buf), stdin))
+        return NULL;
+    if (buf[strlen(buf) - 1] == '\\n')
+        buf[strlen(buf) - 1] = 0;
+    return buf;
+}
+
+/** Add requests for specified hostnames */
+void
+add_requests(void)
+{
+    int nreqs_base = nreqs;
+
+    char *host;
+    while ((host = strtok(NULL, " "))) {
+        nreqs++;
+        reqs = realloc(reqs, nreqs * sizeof(reqs[0]));
+        reqs[nreqs - 1] = calloc(1, sizeof(*reqs[0]));
+        reqs[nreqs - 1]->ar_name = strdup(host);
+    }
+
+    /* Queue nreqs_base..nreqs requests. */
+    int ret;
+    ret = getaddrinfo_a(GAI_NOWAIT, &reqs[nreqs_base],
+                        nreqs - nreqs_base, NULL);
+    if (ret) {
+        fprintf(stderr, "getaddrinfo_a() failed: %s\\n",
+                gai_strerror(ret));
+        exit(EXIT_FAILURE);
+    }
+}
+
+/** Wait until at least one of specified requests completes */
+void
+wait_requests(void)
+{
+    /* NULL elements are ignored by gai_suspend(). */
+    struct gaicb const **wait_reqs = calloc(nreqs, sizeof(*wait_reqs));
+
+    char *id;
+    while ((id = strtok(NULL, " "))) {
+        wait_reqs[atoi(id)] = reqs[atoi(id)];
+    }
+
+    int ret = gai_suspend(wait_reqs, nreqs, NULL);
+    if (ret) {
+        printf("gai_suspend(): %s\\n", gai_strerror(ret));
+        return;
+    }
+
+    int i;
+    for (i = 0; i < nreqs; i++) {
+        if (!wait_reqs[i])
+            continue;
+        ret = gai_error(reqs[i]);
+        if (ret == EAI_INPROGRESS)
+            continue;
+        printf("[%02d] %s: %s\\n", i, reqs[i]->ar_name,
+               ret == 0 ? "Finished" : gai_strerror(ret));
+    }
+}
+
+/** Cancel specified requests */
+void
+cancel_requests(void)
+{
+    char *id;
+    while ((id = strtok(NULL, " "))) {
+        int ret = gai_cancel(reqs[atoi(id)]);
+        printf("[%s] %s: %s\\n", id, reqs[atoi(id)]->ar_name,
+               gai_strerror(ret));
+    }
+}
+
+/** List all requests */
+void
+list_requests(void)
+{
+    int i;
+    for (i = 0; i < nreqs; i++) {
+        printf("[%02d] %s: ", i, reqs[i]->ar_name);
+        int ret = gai_error(reqs[i]);
+        if (!ret) {
+            char host[NI_MAXHOST];
+            struct addrinfo *res = reqs[i]->ar_result;
+
+            ret = getnameinfo(res->ai_addr, res->ai_addrlen,
+                              host, sizeof(host),
+                              NULL, 0, NI_NUMERICHOST);
+            if (ret != 0) {
+                fprintf(stderr, "getnameinfo() failed: %s\\n",
+                        gai_strerror(ret));
+                exit(EXIT_FAILURE);
+            }
+            puts(host);
+
+        } else {
+            puts(gai_strerror(ret));
+        }
+    }
+}
+
+int
+main(int argc, char *argv[])
+{
+    char *cmdline;
+
+    while ((cmdline = getcmd())) {
+        char *cmd = strtok(cmdline, " ");
+        if (!cmd) {
+            list_requests();
+        } else switch (cmd[0]) {
+            case 'a': add_requests(); break;
+            case 'w': wait_requests(); break;
+            case 'c': cancel_requests(); break;
+            case 'l': list_requests(); break;
+        }
+    }
+    exit(EXIT_SUCCESS);
+}
+.fi
+.SH "SEE ALSO"
+.BR getaddrinfo (3),
+.BR inet (3),
+.BR lio_listio (3),
+.BR hostname (7),
+.BR ip (7)
diff --git a/man3/strtok.3 b/man3/strtok.3
index dde40d8..c55e397 100644
--- a/man3/strtok.3
+++ b/man3/strtok.3
@@ -193,6 +193,11 @@ main(int argc, char *argv[])
     exit(EXIT_SUCCESS);
 } /* main */
 .fi
+.PP
+Another example program using
+.BR strtok ()
+is shown in the manual page of
+.BR getaddrinfo_a (3).
 .SH "SEE ALSO"
 .BR index (3),
 .BR memchr (3),
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
