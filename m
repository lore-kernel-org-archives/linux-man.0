From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH] unix.7: add example
Date: Tue,  5 Jan 2016 16:17:13 +0100
Message-ID: <1452007033-26166-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

A complete example demonstrating the usage of sockets for local interprocess
communication is added.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man7/unix.7 | 261 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 257 insertions(+), 4 deletions(-)

diff --git a/man7/unix.7 b/man7/unix.7
index e6e311f..dd630ba 100644
--- a/man7/unix.7
+++ b/man7/unix.7
@@ -1,5 +1,6 @@
-.\" This man page is Copyright (C) 1999 Andi Kleen <ak-h9bWGtP8wOw@public.gmane.org>.
-.\" and Copyright (C) 2008-2014, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+.\" This man page is Copyright (C) 1999 Andi Kleen <ak-h9bWGtP8wOw@public.gmane.org>,
+.\" Copyright (C) 2008-2014, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,
+.\" and Copyright (C) 2016, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
 .\"
 .\" %%%LICENSE_START(VERBATIM_ONE_PARA)
 .\" and Copyright (C) 2008, 2012 Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
@@ -618,9 +619,261 @@ that the applications that
 pathname sockets follow the rules outlined above under
 .IR "Pathname sockets" .
 .SH EXAMPLE
-See
-.BR bind (2).
+The following code demonstrates the usage of sockets for local interprocess
+communication.
+It comprises two programs.
+The server program waits for a connection from the client program.
+The client sends all of its command line arguments.
+The server treats them as integers and adds them up.
+The client sends the command string END.
+The server returns the result.
+The client prints the sum of the received integers and exits.
+The server waits for the next client to connect.
+To stop the server the client is called with the command line argument
+DOWN.
+.PP
+The following output was recorded while running the server in the background
+and repeatedly calling the client.
+Execution of the server program ended when receiving the DOWN command.
+.SS Example output
+.in +4n
+.nf
+$ ./server &
+[1] 25887
+$ ./client 3 4
+Result = 7
+$ ./client 11 \-5
+Result = 6
+$ ./client DOWN
+Result = 0
+[1]+  Done                    ./server
+$
+.fi
+.in
+.SS Program source
+.nf
+/*
+ * File connection.h
+ */
+
+#define SOCKET_NAME "/tmp/9Lq7BNBnBycd6nxy.socket"
+#define BUFFER_SIZE 12
+
+/*
+ * File server.c
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/socket.h>
+#include <sys/un.h>
+#include <unistd.h>
+#include "connection.h"
+
+int
+main(int argc, char *argv)
+{
+    struct sockaddr_un name;
+    int down = 0;
+    int ret;
+    int sock;
+    int sock2;
+    int result;
+    char buf[BUFFER_SIZE];
+
+    /*
+     * In case the program exited inadvertently on the last run
+     * remove the socket.
+     */
+
+    unlink(SOCKET_NAME);
+
+    /* Create local socket. */
+
+    sock = socket(PF_LOCAL, SOCK_SEQPACKET, 0);
+    if (sock == \-1) {
+        perror("socket");
+        exit(EXIT_FAILURE);
+    }
+
+    /* Bind socket to socket name. */
+
+    name.sun_family = AF_UNIX;
+    strcpy (name.sun_path, SOCKET_NAME);
+    ret = bind(sock, (const struct sockaddr *) &name,
+               sizeof(struct sockaddr_un));
+    if (ret == \-1) {
+        perror("bind");
+        exit(EXIT_FAILURE);
+    }
+
+    /*
+     * Prepare for accepting connections. The backlog size is set to 2. So
+     * while one request is being processed other requests can be waiting.
+     */
+
+    ret = listen(sock, 2);
+    if (ret == \-1) {
+        perror("listen");
+        exit(EXIT_FAILURE);
+    }
+
+    /* This is the main loop for handling connections. */
+
+    for (;;) {
+
+
+        /* Wait for incoming connection. */
+
+        sock2 = accept(sock, NULL, NULL);
+        if (ret == \-1) {
+            perror("accept");
+            exit(EXIT_FAILURE);
+        }
+
+        result = 0;
+        for(;;) {
+
+            /* Wait for next datagram. */
+
+            ret = recv(sock2, buf, BUFFER_SIZE, 0);
+            if (ret == \-1) {
+                perror("recv");
+                exit(EXIT_FAILURE);
+            }
+
+            /* Ensure buffer is 0\-terminated. */
+
+            buf[BUFFER_SIZE \- 1] = 0;
+
+            /* Handle commands. */
+
+            if (!strncmp(buf, "DOWN", BUFFER_SIZE)) {
+                down = 1;
+                break;
+            }
+
+            if (!strncmp(buf, "END", BUFFER_SIZE)) {
+                break;
+            }
+
+            /* Add received summand. */
 
+            result += atoi(buf);
+        }
+
+        /* Send result. */
+
+        sprintf(buf, "%d", result);
+        ret = send(sock2, buf, BUFFER_SIZE, 0);
+
+        if (ret == \-1) {
+            perror("send");
+            exit(EXIT_FAILURE);
+        }
+
+        /* Close socket. */
+
+        close(sock2);
+
+        /* Quit on DOWN command. */
+
+        if (down) {
+            break;
+        }
+    }
+
+    close(sock);
+
+    /* Unlink the socket. */
+
+    unlink(SOCKET_NAME);
+
+    exit(EXIT_SUCCESS);
+}
+
+/*
+ * File client.c
+ */
+
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/socket.h>
+#include <sys/un.h>
+#include <unistd.h>
+#include "connection.h"
+
+int
+main(int argc, char *argv[])
+{
+    struct sockaddr_un name;
+    int i;
+    int ret;
+    int sock;
+    char buf[BUFFER_SIZE];
+
+    /* Create local socket. */
+
+    sock = socket(PF_LOCAL, SOCK_SEQPACKET, 0);
+    if (sock == \-1) {
+        perror("socket");
+        exit(EXIT_FAILURE);
+    }
+
+    /* Connect socket to socket name. */
+
+    name.sun_family = AF_UNIX;
+    strcpy (name.sun_path, SOCKET_NAME);
+    ret = connect (sock, (const struct sockaddr *) &name,
+                   sizeof(struct sockaddr_un));
+    if (ret == \-1) {
+        fprintf(stderr, "The server is down.\\n");
+        exit(EXIT_FAILURE);
+    }
+
+    /* Send arguments. */
+
+    for (i = 1; i < argc; ++i) {
+        ret = send(sock, argv[i], strlen(argv[i]) + 1, 0);
+        if (ret == \-1) {
+            perror("send");
+            break;
+        }
+    }
+
+    /* Request result. */
+
+    strcpy (buf, "END");
+    ret = send(sock, buf, strlen(buf) + 1, 0);
+    if (ret == \-1) {
+        perror("send");
+        exit(EXIT_FAILURE);
+    }
+
+
+    /* Receive result. */
+
+    ret = recv(sock, buf, BUFFER_SIZE, 0);
+    if (ret == \-1) {
+        perror("recv");
+        exit(EXIT_FAILURE);
+    }
+
+    buf[BUFFER_SIZE \- 1] = 0;
+
+    printf("Result = %s\\n", buf);
+
+    /* Close socket. */
+
+    close(sock);
+
+    exit(EXIT_SUCCESS);
+}
+.fi
+.PP
 For an example of the use of
 .BR SCM_RIGHTS
 see
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
