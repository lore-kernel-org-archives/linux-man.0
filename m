From: wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org
Subject: [PATCH] msgop.2: add an example program
Date: Tue,  3 Mar 2015 17:05:04 -0500
Message-ID: <1425420304-21483-1-git-send-email-wfp5p@worldbroken.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

From: Bill Pemberton <wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org>

Signed-off-by: Bill Pemberton <wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org>
---
 man2/msgop.2 | 124 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 122 insertions(+), 2 deletions(-)

diff --git a/man2/msgop.2 b/man2/msgop.2
index d1bd2125344d..03d334f8b732 100644
--- a/man2/msgop.2
+++ b/man2/msgop.2
@@ -36,8 +36,6 @@
 .\"	Language and formatting clean-ups
 .\"	Added notes on /proc files
 .\"
-.\" FIXME Add example programs to this page.
-.\"
 .TH MSGOP 2 2015-02-21 "Linux" "Linux Programmer's Manual"
 .SH NAME
 msgrcv, msgsnd \- System V message queue operations
@@ -578,6 +576,128 @@ this error was not diagnosed by
 This bug is fixed
 .\" commit 4f87dac386cc43d5525da7a939d4b4e7edbea22c
 in Linux 3.14.
+.SH EXAMPLE
+The program below demonstrates the use of
+.BR msgsnd()
+and
+.BR msgrcv().
+
+The program is run with the \fB\-s\fP option to send a message and
+then run again with the \fB-r\fP option to receive a message.
+
+.SS Program source
+\&
+.nf
+/* msgop.c */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <time.h>
+#include <unistd.h>
+#include <errno.h>
+#include <sys/types.h>
+#include <sys/ipc.h>
+#include <sys/msg.h>
+
+struct msgbuf {
+    long mtype;
+    char mtext[80];
+};
+
+static void usage(char *prog_name, char *msg)
+{
+    if (msg != NULL)
+        fputs(msg, stderr);
+
+    fprintf(stderr, "Usage: %s [options]\\n", prog_name);
+    fprintf(stderr, "Options are:\\n");
+    fprintf(stderr, "\-s        send message using msgsnd()\\n");
+    fprintf(stderr, "\-r        read message using msgrcv()\\n");
+    fprintf(stderr, "\-t        message type (defult is 1)\\n");
+    fprintf(stderr, "\-k        message queue key (defult is 1234)\\n");
+    fprintf(stderr, "\\n\-s is assumed if neither \-s or \-r given\\n");
+    exit(EXIT_FAILURE);
+}
+
+static void send_msg(int qid, int msgtype)
+{
+    struct msgbuf msg;
+    time_t t;
+
+    msg.mtype = msgtype;
+
+    time(&t);
+    sprintf(msg.mtext, "a message at %s", ctime(&t));
+
+    if (msgsnd(qid, (void *)&msg, sizeof(msg.mtext), IPC_NOWAIT) < 0) {
+        perror("msgsnd error");
+        exit(EXIT_FAILURE);
+    } else
+        printf("sent: %s\\n", msg.mtext);
+}
+
+static void get_msg(int qid, int msgtype)
+{
+    struct msgbuf msg;
+
+    if (msgrcv
+        (qid, (void *)&msg, sizeof(msg.mtext), msgtype,
+         MSG_NOERROR | IPC_NOWAIT) < 0) {
+
+        if (errno != ENOMSG) {
+            perror("msgrcv");
+            exit(EXIT_FAILURE);
+        } else
+            printf("No message available for msgrcv()\\n");
+    } else
+        printf("messge received: %s\\n", msg.mtext);
+}
+
+int main(int argc, char *argv[])
+{
+    int qid, opt;
+    int receive = 0;
+    int msgtype = 1;
+    int msgkey = 1234;
+
+    while ((opt = getopt(argc, argv, "srt:k:")) != \-1) {
+        switch (opt) {
+        case 's':
+            receive = 0;
+            break;
+        case 'r':
+            receive = 1;
+            break;
+        case 't':
+            msgtype = atoi(optarg);
+            if (msgtype <= 0)
+                usage(argv[0], "\-t option must be greater than 0\\n");
+            break;
+        case 'k':
+            msgkey = atoi(optarg);
+            break;
+
+        default:
+            usage(argv[0], "Unrecognized option\\n");
+        }
+    }
+
+    qid = msgget(msgkey, IPC_CREAT | 0666);
+
+    if (qid < 0) {
+        perror("msgget");
+        exit(EXIT_FAILURE);
+    }
+
+    if (receive)
+        get_msg(qid, msgtype);
+    else
+        send_msg(qid, msgtype);
+
+    exit(EXIT_SUCCESS);
+}
+.fi
 .SH SEE ALSO
 .BR msgctl (2),
 .BR msgget (2),
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
