From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1 v4] inotify.7: add example
Date: Sat, 24 May 2014 22:02:13 +0200
Message-ID: <1400961733-17356-1-git-send-email-xypron.glpk@gmx.de>
References: <537F077A.8040309@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <537F077A.8040309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: John McCutchan <john-jueV0HHMeujJJrXXpGQQMAC/G2K4zDHf@public.gmane.org>, Robert Love <rlove-L7G0xEPcOZbYtjvyW6yDsg@public.gmane.org>, Eric Paris <eparis-FjpueFixGhCM4zKIHC2jIg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This fourth version of the patch considers comments by Michael Kerrisk
concerning

* Alignment of inotify read buffer:
  avoid warning with gcc -Wpedantic.

* In the usage description of the example replace DIRECTORY by PATH.
  The example code can be used to watch both files and directories.

***

An example for the usage of the inotify API is provided.

It shows the usage of inotify_init1(2),inotify_add_watch(2) as well as
polling and reading from the inotify file descriptor.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man7/inotify.7 | 228 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 227 insertions(+), 1 deletion(-)

diff --git a/man7/inotify.7 b/man7/inotify.7
index 8e848b2..55e5cab 100644
--- a/man7/inotify.7
+++ b/man7/inotify.7
@@ -1,5 +1,6 @@
 '\" t
 .\" Copyright (C) 2006, 2014 Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+.\" Copyright (C) 2014 Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
 .\"
 .\" %%%LICENSE_START(VERBATIM)
 .\" Permission is granted to make and distribute verbatim copies of this
@@ -23,7 +24,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH INOTIFY 7 2014-05-08 "Linux" "Linux Programmer's Manual"
+.TH INOTIFY 7 2014-05-23 "Linux" "Linux Programmer's Manual"
 .SH NAME
 inotify \- monitoring filesystem events
 .SH DESCRIPTION
@@ -752,6 +753,231 @@ if the older had not yet been read)
 instead checked if the most recent event could be coalesced with the
 .I oldest
 unread event.
+.SH EXAMPLE
+The following program demonstrates the usage of the inotify API.
+It marks the directories passed as a command-line arguments
+and waits for events of type
+.BR IN_OPEN ,
+.BR IN_CLOSE_NOWRITE 
+and
+.BR IN_CLOSE_WRITE .
+.PP
+The following output was recorded while editing the file
+.I /home/user/temp/foo
+and listing directory
+.IR /tmp .
+Before the file and the directory were opened,
+.B IN_OPEN
+events occurred.
+After the file was closed, an
+.B IN_CLOSE_WRITE
+event occurred.
+After the directory was closed, an
+.B IN_CLOSE_NOWRITE
+event occurred.
+Execution of the program ended when the user pressed the ENTER key.
+.SS Example output
+.in +4n
+.nf
+$ ./inotify.7.example /tmp /home/user/temp
+Press enter key to terminate.
+Listening for events.
+IN_OPEN: /home/user/temp/foo [file]
+IN_CLOSE_WRITE: /home/user/temp/foo [file]
+IN_OPEN: /tmp/ [directory]
+IN_CLOSE_NOWRITE: /tmp/ [directory]
+
+Listening for events stopped.
+.fi
+.in
+.SS Program source
+.nf
+#include <errno.h>
+#include <poll.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/inotify.h>
+#include <unistd.h>
+
+/* Read all available inotify events from the file descriptor 'fd'.
+   wd is the table of watch descriptors for the directories in argv.
+   argc is the length of wd and argv.
+   argv is the list of watched directories.
+   Entry 0 of wd and argv is unused. */
+
+static void
+handle_events(int fd, int *wd, int argc, char* argv[])
+{
+    /* Some systems cannot read integer variables if they are
+       not properly aligned. On other systems incorrect alignment
+       may decrease performance.
+       Hence, the buffer used for reading from the inotify file
+       descriptor should have the same alignment as
+       struct inotify_event. */
+    char buf[4096]
+    __attribute__ ((aligned(__alignof__(struct inotify_event))));
+    const struct inotify_event *event;
+    int i;
+    ssize_t len;
+    char *ptr;
+
+    /* Loop while events can be read from inotify file descriptor. */
+
+    for (;;) {
+
+        /* Read some events. */
+
+        len = read(fd, buf, sizeof buf);
+        if (len == \-1 && errno != EAGAIN) {
+            perror("read");
+            exit(EXIT_FAILURE);
+        }
+
+        /* If the nonblocking read() found no events to read, then
+           it returns \-1 with errno set to EAGAIN. In that case,
+           we exit the loop. */
+
+        if (len <= 0)
+            break;
+
+        /* Loop over all events in the buffer */
+
+        for (ptr = buf; ptr < buf + len;
+             ptr += sizeof(struct inotify_event) + event\->len) {
+
+            event = (const struct inotify_event *) ptr;
+
+            /* Print event type */
+
+            if (event\->mask & IN_OPEN)
+                printf("IN_OPEN: ");
+            if (event\->mask & IN_CLOSE_NOWRITE)
+                printf("IN_CLOSE_NOWRITE: ");
+            if (event\->mask & IN_CLOSE_WRITE)
+                printf("IN_CLOSE_WRITE: ");
+
+            /* Print the name of the watched directory */
+
+            for (i = 1; i < argc; ++i) {
+                if (wd[i] == event\->wd) {
+                    printf("%s/", argv[i]);
+                    break;
+                }
+            }
+
+            /* Print the name of the file */
+
+            if (event\->len)
+                printf("%s", event\->name);
+
+            /* Print type of filesystem object */
+
+            if (event\->mask & IN_ISDIR)
+                printf(" [directory]\\n");
+            else
+                printf(" [file]\\n");
+
+        }
+    }
+}
+
+int
+main(int argc, char* argv[])
+{
+    char buf;
+    int fd, i, poll_num;
+    int *wd;
+    nfds_t nfds;
+    struct pollfd fds[2];
+
+    if (argc < 2) {
+        printf("Usage: %s PATH [PATH ...]\\n", argv[0]);
+        exit(EXIT_FAILURE);
+    }
+
+    printf("Press ENTER key to terminate.\\n");
+
+    /* Create the file descriptor for accessing the inotify API */
+
+    fd = inotify_init1(IN_NONBLOCK);
+    if (fd == \-1) {
+        perror("inotify_init1");
+        exit(EXIT_FAILURE);
+    }
+
+    /* Allocate memory for watch descriptors */
+
+    wd = calloc(argc, sizeof(int));
+    if (wd == NULL) {
+        perror("calloc");
+        exit(EXIT_FAILURE);
+    }
+
+    /* Mark directories for events
+       \- file was opened
+       \- file was closed */
+
+    for (i = 1; i < argc; i++) {
+        wd[i] = inotify_add_watch(fd, argv[i],
+                                  IN_OPEN | IN_CLOSE);
+        if (wd[i] == \-1) {
+            fprintf(stderr, "Cannot watch '%s'\\n", argv[i]);
+            perror("inotify_add_watch");
+            exit(EXIT_FAILURE);
+        }
+    }
+
+    /* Prepare for polling */
+
+    nfds = 2;
+
+    /* Console input */
+
+    fds[0].fd = STDIN_FILENO;
+    fds[0].events = POLLIN;
+
+    /* Inotify input */
+
+    fds[1].fd = fd;
+    fds[1].events = POLLIN;
+
+    /* Wait for events and/or terminal input */
+
+    printf("Listening for events.\\n");
+    while (1) {
+        poll_num = poll(fds, nfds, \-1);
+        if (poll_num == \-1) {
+            if (errno == EINTR)
+                continue;
+            perror("poll");
+            exit(EXIT_FAILURE);
+        }
+        if (poll_num > 0) {
+
+            if (fds[0].revents & POLLIN) {
+
+                /* Console input is available. Empty stdin and quit */
+
+                while (read(STDIN_FILENO, &buf, 1) > 0 && buf != '\\n')
+                    continue;
+                break;
+            }
+            if (fds[1].revents & POLLIN) {
+
+                /* Inotify events are available */
+                handle_events(fd, wd, argc, argv);
+            }
+        }
+    }
+
+    /* Close inotify file descriptor */
+
+    close(fd);
+    free(wd);
+    printf("Listening for events stopped.\\n");
+    exit(EXIT_SUCCESS);
+}
+.fi
 .SH SEE ALSO
 .BR inotifywait (1),
 .BR inotifywatch (1),
-- 
2.0.0.rc2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
