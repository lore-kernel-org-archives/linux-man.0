From: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] sendmmsg.2: Updated fixme, added example
Date: Fri, 14 Dec 2012 20:06:52 +0100
Message-ID: <50CB78CC.7080208@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020609060602050602050404"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------020609060602050602050404
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello all,

A patch which updates a fixme which extends man 2 sendmmsg with an example.

The example uses sendmmsg to sends out a string "onetwo" on a first 
datagram,
where both halves originate from distinct buffers and a second datagram
contains "three", coming from a single buffer.

Tested with netcat listening:
root@ubuntu:~# nc -l -u -p 1234
onetwothree

And tcpdump peeking:
root@ubuntu:~# tcpdump -c 2 -s 0 -X -ni lo tcpdump: verbose output 
suppressed, use -v or -vv for full protocol decode
listening on lo, link-type EN10MB (Ethernet), capture size 65535 bytes
18:45:16.632134 IP 127.0.0.1.34715 > 127.0.0.1.1234: UDP, length 6
      0x0000:  4500 0022 c21c 4000 4011 7aac 7f00 0001  E.."..@.@.z.....
      0x0010:  7f00 0001 879b 04d2 000e fe21 6f6e 6574  ...........!onet
      0x0020:  776f                                     wo
18:45:16.633267 IP 127.0.0.1.34715 > 127.0.0.1.1234: UDP, length 5
      0x0000:  4500 0021 c21d 4000 4011 7aac 7f00 0001  E..!..@.@.z.....
      0x0010:  7f00 0001 879b 04d2 000d fe20 7468 7265  ............thre
      0x0020:  65                                       e
2 packets captured
4 packets received by filter
0 packets dropped by kernel

my 2 cents
E.
---
  man2/sendmmsg.2 |   69 
+++++++++++++++++++++++++++++++++++++++++++++++++++++--
  1 file changed, 67 insertions(+), 2 deletions(-)

diff --git a/man2/sendmmsg.2 b/man2/sendmmsg.2
index 12ad3ff..5027619 100644
--- a/man2/sendmmsg.2
+++ b/man2/sendmmsg.2
@@ -23,8 +23,6 @@
  .\" Formatted or processed versions of this manual, if unaccompanied by
  .\" the source, must acknowledge the copyright and authors of this work.
  .\"
-.\" FIXME Adding an example program would improve this page
-.\"
  .TH SENDMMSG 2 2012-02-27 "Linux" "Linux Programmer's Manual"
  .SH NAME
  sendmmsg \- send multiple messages on a socket
@@ -165,6 +163,73 @@ is capped to
  .\"     For error handling an application using sendmmsg needs to retry at
  .\"     the first unsent message, so capping is simpler and requires less
  .\"     application logic than returning EINVAL.
+.SH EXAMPLE
+The example below uses
+.BR sendmmsg ()
+to send
+.I onetwo
+and
+.I three
+in two distinct UDP datagrams using one system call. Where the contents
+of the first datagram originates from multiple buffers.
+
+.nf
+#define _GNU_SOURCE
+#include <netinet/ip.h> +#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/types.h>
+#include <sys/socket.h>
+
+int main()
+{
+    int sockfd;
+    struct sockaddr_in sa;
+    struct mmsghdr msg[2];
+    struct iovec msg1[2], msg2;
+    int retval;
+
+    sockfd = socket(AF_INET, SOCK_DGRAM, 0);
+    if (sockfd == -1) {
+        perror("socket()");
+        exit(EXIT_FAILURE);
+    }
+
+    sa.sin_family = AF_INET;
+    sa.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
+    sa.sin_port = htons(1234);
+    if (connect(sockfd, (struct sockaddr *)&sa, sizeof(sa))) {
+        perror("connect()");
+        exit(EXIT_FAILURE);
+    }
+
+    memset(msg1, 0, sizeof(msg1));
+    msg1[0].iov_base = "one";
+    msg1[0].iov_len = 3;
+    msg1[1].iov_base = "two";
+    msg1[1].iov_len = 3;
+
+    memset(&msg2, 0, sizeof(msg2));
+    msg2.iov_base = "three";
+    msg2.iov_len = 5;
+
+    memset(msg, 0, sizeof(msg));
+    msg[0].msg_hdr.msg_iov = msg1;
+    msg[0].msg_hdr.msg_iovlen = 2;
+
+    msg[1].msg_hdr.msg_iov = &msg2;
+    msg[1].msg_hdr.msg_iovlen = 1;
+
+    retval = sendmmsg(sockfd, msg, 2, 0);
+    if (retval == -1)
+        perror("sendmmsg()");
+    else
+        printf("%d messages sent\n", retval);
+
+    exit(0);
+}
+.fi
  .SH SEE ALSO
  .BR recvmmsg (2),
  .BR sendmsg (2),
-- 
1.7.10.4


--------------020609060602050602050404
Content-Type: text/plain;
 name="Attached Message Part"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="Attached Message Part"

Hello all,

A patch which updates a fixme and which extends sendmmsg with an example.

The example uses sendmmsg to sends out a string "onetwo" on a first datagram,
where both halves originate from distinct buffers and a second datagram
contains "three", coming from a single buffer. 

Tested with netcat listening:
root@ubuntu:~# nc -l -u -p 1234
onetwothree

And tcpdump peeking:
root@ubuntu:~# tcpdump -c 2 -s 0 -X -ni lo 
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on lo, link-type EN10MB (Ethernet), capture size 65535 bytes
18:45:16.632134 IP 127.0.0.1.34715 > 127.0.0.1.1234: UDP, length 6
        0x0000:  4500 0022 c21c 4000 4011 7aac 7f00 0001  E.."..@.@.z.....
        0x0010:  7f00 0001 879b 04d2 000e fe21 6f6e 6574  ...........!onet
        0x0020:  776f                                     wo
18:45:16.633267 IP 127.0.0.1.34715 > 127.0.0.1.1234: UDP, length 5
        0x0000:  4500 0021 c21d 4000 4011 7aac 7f00 0001  E..!..@.@.z.....
        0x0010:  7f00 0001 879b 04d2 000d fe20 7468 7265  ............thre
        0x0020:  65                                       e
2 packets captured
4 packets received by filter
0 packets dropped by kernel

my 2 cents
E. 

---
 man2/sendmmsg.2 |   69 +++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 67 insertions(+), 2 deletions(-)

diff --git a/man2/sendmmsg.2 b/man2/sendmmsg.2
index 12ad3ff..5027619 100644
--- a/man2/sendmmsg.2
+++ b/man2/sendmmsg.2
@@ -23,8 +23,6 @@
 .\" Formatted or processed versions of this manual, if unaccompanied by
 .\" the source, must acknowledge the copyright and authors of this work.
 .\"
-.\" FIXME Adding an example program would improve this page
-.\"
 .TH SENDMMSG 2 2012-02-27 "Linux" "Linux Programmer's Manual"
 .SH NAME
 sendmmsg \- send multiple messages on a socket
@@ -165,6 +163,73 @@ is capped to
 .\"     For error handling an application using sendmmsg needs to retry at
 .\"     the first unsent message, so capping is simpler and requires less
 .\"     application logic than returning EINVAL.
+.SH EXAMPLE
+The example below uses 
+.BR sendmmsg ()
+to send  
+.I onetwo
+and 
+.I three
+in two distinct UDP datagrams using one system call. Where the contents
+of the first datagram originates from multiple buffers.
+
+.nf
+#define _GNU_SOURCE
+#include <netinet/ip.h> 
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/types.h>
+#include <sys/socket.h>
+
+int main()
+{
+    int sockfd;
+    struct sockaddr_in sa;
+    struct mmsghdr msg[2];
+    struct iovec msg1[2], msg2;
+    int retval;
+
+    sockfd = socket(AF_INET, SOCK_DGRAM, 0);
+    if (sockfd == -1) {
+        perror("socket()");
+        exit(EXIT_FAILURE);
+    }
+
+    sa.sin_family = AF_INET;             
+    sa.sin_addr.s_addr = htonl(INADDR_LOOPBACK);  
+    sa.sin_port = htons(1234);  
+    if (connect(sockfd, (struct sockaddr *)&sa, sizeof(sa))) {
+        perror("connect()");
+        exit(EXIT_FAILURE);
+    }
+
+    memset(msg1, 0, sizeof(msg1)); 
+    msg1[0].iov_base = "one";
+    msg1[0].iov_len = 3;
+    msg1[1].iov_base = "two";
+    msg1[1].iov_len = 3;
+
+    memset(&msg2, 0, sizeof(msg2));
+    msg2.iov_base = "three";
+    msg2.iov_len = 5;
+
+    memset(msg, 0, sizeof(msg));
+    msg[0].msg_hdr.msg_iov = msg1;
+    msg[0].msg_hdr.msg_iovlen = 2;
+
+    msg[1].msg_hdr.msg_iov = &msg2;
+    msg[1].msg_hdr.msg_iovlen = 1;
+
+    retval = sendmmsg(sockfd, msg, 2, 0);
+    if (retval == -1)
+        perror("sendmmsg()");
+    else
+        printf("%d messages sent\n", retval);
+
+    exit(0);
+}
+.fi
 .SH SEE ALSO
 .BR recvmmsg (2),
 .BR sendmsg (2),
-- 
1.7.10.4


--------------020609060602050602050404--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
