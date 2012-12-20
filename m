From: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] recvmmsg.2  Updated fixme, added example
Date: Thu, 20 Dec 2012 19:47:26 +0100
Message-ID: <1356029246-6212-1-git-send-email-eliedebrauwer@gmail.com>
References: <CAKgNAkgDE3yyLOjdaAjWgpS2iPMmcr3njAWik20nMiX=ZQYUHg@mail.gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkgDE3yyLOjdaAjWgpS2iPMmcr3njAWik20nMiX=ZQYUHg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi all,

Please find below a patch with the comments in below (including two 
other typo's I seem to have missed yesterday). 

Thanks for the comments.

E.


---
 man2/recvmmsg.2 |   94 +++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 92 insertions(+), 2 deletions(-)

diff --git a/man2/recvmmsg.2 b/man2/recvmmsg.2
index a7b00d4..0c6db49 100644
--- a/man2/recvmmsg.2
+++ b/man2/recvmmsg.2
@@ -21,8 +21,6 @@
 .\" Formatted or processed versions of this manual, if unaccompanied by
 .\" the source, must acknowledge the copyright and authors of this work.
 .\"
-.\" FIXME: This page could be improved with an example program.
-.\"
 .TH RECVMMSG 2 2012-05-02 "Linux" "Linux Programmer's Manual"
 .SH NAME
 recvmmsg \- receive multiple messages on a socket
@@ -165,6 +163,98 @@ Support in glibc was added in version 2.12.
 .SH CONFORMING TO
 .BR recvmmsg ()
 is Linux-specific.
+.SH EXAMPLE
+.PP
+The following program uses 
+.BR recvmmsg () 
+to receive multiple messages on a socket and stores
+them in multiple buffers. 
+The call returns if all buffers are filled or if the 
+timeout specified is expired.
+
+The following snippet periodically generates UDP datagrams 
+containing a random number:
+.in +4n
+.nf
+.RB "$" " while true; do echo $RANDOM > /dev/udp/127.0.0.1/1234; sleep 0.25; done"
+.fi
+.in
+
+These datagrams are read by the example application which 
+can give the following output:
+.in +4n
+.nf
+.RB "$" " ./a.out"
+5 messages received
+1 11782
+2 11345
+3 304
+4 13514
+5 28421
+.fi
+.in
+.SS Program source
+\&
+.nf
+#define _GNU_SOURCE
+#include <netinet/ip.h> 
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/socket.h>
+
+int 
+main()
+{
+#define VLEN 10
+#define BUFSIZE 200 
+#define TIMEOUT 1
+    int sockfd, retval, i;
+    struct sockaddr_in sa;
+    struct mmsghdr msgs[VLEN];
+    struct iovec iovecs[VLEN];
+    char bufs[VLEN][BUFSIZE+1];
+    struct timespec timeout;
+
+    sockfd = socket(AF_INET, SOCK_DGRAM, 0);
+    if (sockfd == \-1) {
+        perror("socket()");
+        exit(EXIT_FAILURE);
+    }
+
+    sa.sin_family = AF_INET;             
+    sa.sin_addr.s_addr = htonl(INADDR_LOOPBACK);  
+    sa.sin_port = htons(1234);  
+    if (bind(sockfd, (struct sockaddr *) &sa, sizeof(sa)) == \-1) {
+        perror("bind()");
+        exit(EXIT_FAILURE);
+    }
+
+    memset(msgs, 0, sizeof(msgs));
+    for (i = 0; i < VLEN; i++) {
+        iovecs[i].iov_base         = bufs[i];
+        iovecs[i].iov_len          = BUFSIZE;
+        msgs[i].msg_hdr.msg_iov    = &iovecs[i];
+        msgs[i].msg_hdr.msg_iovlen = 1;
+    }
+
+    timeout.tv_sec = TIMEOUT;
+    timeout.tv_nsec = 0;
+
+    retval = recvmmsg(sockfd, msgs, VLEN, 0, &timeout);
+    if (retval == \-1) {
+        perror("recvmmsg()");
+        exit(EXIT_FAILURE);
+    }
+
+    printf("%d messages received\\n", retval);
+    for (i = 0; i < retval; i++) {
+        bufs[i][msgs[i].msg_len] = 0;
+        printf("%d %s", i+1, bufs[i]);
+    }
+    exit(EXIT_SUCCESS);
+}
+.fi 
 .SH SEE ALSO
 .BR clock_gettime (2),
 .BR recvmsg (2),
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
