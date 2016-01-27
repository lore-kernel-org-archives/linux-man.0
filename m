From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch] Consistency fix: Use "saddr" as the postfix for "struct
 sockaddr"-based type names.
Date: Wed, 27 Jan 2016 14:16:56 -0500
Message-ID: <56A917A8.9010007@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The goal is to make it easier for a reader to follow along with the
documentation, prototypes, and examples that use "struct sockaddr".
We achieve this by using a consistent naming for "struct sockaddr"
-based types. Instead of using "sa", or "name" or "local" we use
"saddr", "name_saddr" and "local_saddr". We avoid variable names
like "sa" which are used for "sigaction" examples.

Instead of the generic "addr" we use "saddr" in places where we accept
"struct sockaddr" as an argument, either the struct or a pointer to the
struct. Where the eventual goal is to cast the variable to a 
"struct sockaddr"-based type, such variable names are adjusted. So for
example if we have a "struct sockaddr_un" variable we call it 
"local_saddr" if it will eventually be cast to "struct sockaddr *".

We might have standardized on just "addr" but that's ambiguous
and I'd like to use, where appropriate, slightly different variable
names for the various forms of "struct sockaddr" like "sockaddr_un",
"sockaddr_in", "sockaddr_storage" and others, so "addr" is a poor
choice when helping the reader follow along (not to mention the
confusion with virtual memory addresses and mmap).

Please apply.

Patch against master.

Signed-off-by: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man2/accept.2      |   14 +++++++-------
 man2/bind.2        |   38 +++++++++++++++++++-------------------
 man2/connect.2     |   12 ++++++------
 man2/getpeername.2 |    8 ++++----
 man2/getsockname.2 |    8 ++++----
 man2/recv.2        |   14 +++++++-------
 man2/recvmmsg.2    |   10 +++++-----
 man2/select_tut.2  |   30 +++++++++++++++---------------
 man2/send.2        |    6 +++---
 man2/sendmmsg.2    |   10 +++++-----
 man3/getaddrinfo.3 |   16 ++++++++--------
 man3/getnameinfo.3 |   14 +++++++-------
 man7/epoll.7       |    3 ++-
 man7/unix.7        |   24 ++++++++++++------------
 14 files changed, 104 insertions(+), 103 deletions(-)

diff --git a/man2/accept.2 b/man2/accept.2
index 99405b7..863141a 100644
--- a/man2/accept.2
+++ b/man2/accept.2
@@ -46,12 +46,12 @@ accept, accept4 \- accept a connection on a socket
 .BR "#include <sys/types.h>" "          /* See NOTES */"
 .B #include <sys/socket.h>
 
-.BI "int accept(int " sockfd ", struct sockaddr *" addr ", socklen_t *" addrlen );
+.BI "int accept(int " sockfd ", struct sockaddr *" saddr ", socklen_t *" addrlen );
 
 .BR "#define _GNU_SOURCE" "             /* See feature_test_macros(7) */"
 .B #include <sys/socket.h>
 
-.BI "int accept4(int " sockfd ", struct sockaddr *" addr ,
+.BI "int accept4(int " sockfd ", struct sockaddr *" saddr ,
 .BI "            socklen_t *" addrlen ", int " flags );
 .fi
 .SH DESCRIPTION
@@ -80,19 +80,19 @@ and is listening for connections after a
 .BR listen (2).
 
 The argument
-.I addr
+.I saddr
 is a pointer to a
 .I sockaddr
 structure.
 This structure is filled in with the address of the peer socket,
 as known to the communications layer.
 The exact format of the address returned
-.I addr
+.I saddr
 is determined by the socket's address family (see
 .BR socket (2)
 and the respective protocol man pages).
 When
-.I addr
+.I saddr
 is NULL, nothing is filled in; in this case,
 .I addrlen
 is not used, and should also be NULL.
@@ -102,7 +102,7 @@ The
 argument is a value-result argument:
 the caller must initialize it to contain the
 size (in bytes) of the structure pointed to by
-.IR addr ;
+.IR saddr ;
 on return it will contain the actual size of the peer address.
 
 The returned address is truncated if the buffer provided is too small;
@@ -231,7 +231,7 @@ A connection has been aborted.
 .TP
 .B EFAULT
 The
-.I addr
+.I saddr
 argument is not in a writable part of the user address space.
 .TP
 .B EINTR
diff --git a/man2/bind.2 b/man2/bind.2
index a2fb7b1..eeee090 100644
--- a/man2/bind.2
+++ b/man2/bind.2
@@ -73,7 +73,7 @@ bind \- bind a name to a socket
 .BR "#include <sys/types.h>" "          /* See NOTES */"
 .B #include <sys/socket.h>
 .sp
-.BI "int bind(int " sockfd ", const struct sockaddr *" addr ,
+.BI "int bind(int " sockfd ", const struct sockaddr *" saddr ,
 .BI "         socklen_t " addrlen );
 .fi
 .SH DESCRIPTION
@@ -82,12 +82,12 @@ When a socket is created with
 it exists in a name space (address family) but has no address assigned to it.
 .BR bind ()
 assigns the address specified by
-.I addr
+.I saddr
 to the socket referred to by the file descriptor
 .IR sockfd .
 .I addrlen
 specifies the size, in bytes, of the address structure pointed to by
-.IR addr .
+.IR saddr .
 Traditionally, this operation is called \(lqassigning a name to a socket\(rq.
 .PP
 It is normally necessary to assign a local address using
@@ -129,7 +129,7 @@ see
 .BR netlink (7).
 
 The actual structure passed for the
-.I addr
+.I saddr
 argument will depend on the address family.
 The
 .I sockaddr
@@ -146,7 +146,7 @@ struct sockaddr {
 .in
 The only purpose of this structure is to cast the structure
 pointer passed in
-.I addr
+.I saddr
 in order to avoid compiler warnings.
 See EXAMPLE below.
 .SH RETURN VALUE
@@ -186,7 +186,7 @@ The socket is already bound to an address.
 .B EINVAL
 .I addrlen
 is wrong, or
-.I addr
+.I saddr
 is not a valid address for this socket's domain.
 .TP
 .B ENOTSOCK
@@ -208,15 +208,15 @@ A nonexistent interface was requested or the requested
 address was not local.
 .TP
 .B EFAULT
-.I addr
+.I saddr
 points outside the user's accessible address space.
 .TP
 .B ELOOP
 Too many symbolic links were encountered in resolving
-.IR addr .
+.IR saddr .
 .TP
 .B ENAMETOOLONG
-.I addr
+.I saddr
 is too long.
 .TP
 .B ENOENT
@@ -292,20 +292,20 @@ int
 main(int argc, char *argv[])
 {
     int sfd, cfd;
-    struct sockaddr_un my_addr, peer_addr;
-    socklen_t peer_addr_size;
+    struct sockaddr_un my_saddr, peer_saddr;
+    socklen_t peer_saddr_size;
 
     sfd = socket(AF_UNIX, SOCK_STREAM, 0);
     if (sfd == \-1)
         handle_error("socket");
 
-    memset(&my_addr, 0, sizeof(struct sockaddr_un));
+    memset(&my_saddr, 0, sizeof(struct sockaddr_un));
                         /* Clear structure */
-    my_addr.sun_family = AF_UNIX;
-    strncpy(my_addr.sun_path, MY_SOCK_PATH,
-            sizeof(my_addr.sun_path) \- 1);
+    my_saddr.sun_family = AF_UNIX;
+    strncpy(my_saddr.sun_path, MY_SOCK_PATH,
+            sizeof(my_saddr.sun_path) \- 1);
 
-    if (bind(sfd, (struct sockaddr *) &my_addr,
+    if (bind(sfd, (struct sockaddr *) &my_saddr,
             sizeof(struct sockaddr_un)) == \-1)
         handle_error("bind");
 
@@ -315,9 +315,9 @@ main(int argc, char *argv[])
     /* Now we can accept incoming connections one
        at a time using accept(2) */
 
-    peer_addr_size = sizeof(struct sockaddr_un);
-    cfd = accept(sfd, (struct sockaddr *) &peer_addr,
-                 &peer_addr_size);
+    peer_saddr_size = sizeof(struct sockaddr_un);
+    cfd = accept(sfd, (struct sockaddr *) &peer_saddr,
+                 &peer_saddr_size);
     if (cfd == \-1)
         handle_error("accept");
 
diff --git a/man2/connect.2 b/man2/connect.2
index ebdb13f..0970653 100644
--- a/man2/connect.2
+++ b/man2/connect.2
@@ -73,7 +73,7 @@ connect \- initiate a connection on a socket
 .br
 .B #include <sys/socket.h>
 .sp
-.BI "int connect(int " sockfd ", const struct sockaddr *" addr ,
+.BI "int connect(int " sockfd ", const struct sockaddr *" saddr ,
 .BI "            socklen_t " addrlen );
 .fi
 .SH DESCRIPTION
@@ -82,13 +82,13 @@ The
 system call connects the socket referred to by the file descriptor
 .I sockfd
 to the address specified by
-.IR addr .
+.IR saddr .
 The
 .I addrlen
 argument specifies the size of
-.IR addr .
+.IR saddr .
 The format of the address in
-.I addr
+.I saddr
 is determined by the address space of the socket
 .IR sockfd ;
 see
@@ -100,7 +100,7 @@ If the socket
 is of type
 .BR SOCK_DGRAM ,
 then
-.I addr
+.I saddr
 is the address to which datagrams are sent by default, and the only
 address from which datagrams are received.
 If the socket is of type
@@ -109,7 +109,7 @@ or
 .BR SOCK_SEQPACKET ,
 this call attempts to make a connection to the socket that is bound
 to the address specified by
-.IR addr .
+.IR saddr .
 .PP
 Generally, connection-based protocol sockets may successfully
 .BR connect ()
diff --git a/man2/getpeername.2 b/man2/getpeername.2
index b2f780a..2ecaef0 100644
--- a/man2/getpeername.2
+++ b/man2/getpeername.2
@@ -45,19 +45,19 @@ getpeername \- get name of connected peer socket
 .SH SYNOPSIS
 .B #include <sys/socket.h>
 .sp
-.BI "int getpeername(int " sockfd ", struct sockaddr *" addr \
+.BI "int getpeername(int " sockfd ", struct sockaddr *" saddr \
 ", socklen_t *" addrlen );
 .SH DESCRIPTION
 .BR getpeername ()
 returns the address of the peer connected to the socket
 .IR sockfd ,
 in the buffer pointed to by
-.IR addr .
+.IR saddr .
 The
 .I addrlen
 argument should be initialized to indicate the amount of space pointed to
 by
-.IR addr .
+.IR saddr .
 On return it contains the actual size of the name returned (in bytes).
 The name is truncated if the buffer provided is too small.
 
@@ -79,7 +79,7 @@ is not a valid file descriptor.
 .TP
 .B EFAULT
 The
-.I addr
+.I saddr
 argument points to memory not in a valid part of the
 process address space.
 .TP
diff --git a/man2/getsockname.2 b/man2/getsockname.2
index 6b1acf6..8360e2c 100644
--- a/man2/getsockname.2
+++ b/man2/getsockname.2
@@ -44,7 +44,7 @@ getsockname \- get socket name
 .nf
 .B #include <sys/socket.h>
 .sp
-.BI "int getsockname(int " sockfd ", struct sockaddr *" addr \
+.BI "int getsockname(int " sockfd ", struct sockaddr *" saddr \
 ", socklen_t *" addrlen );
 .fi
 .SH DESCRIPTION
@@ -52,12 +52,12 @@ getsockname \- get socket name
 returns the current address to which the socket
 .I sockfd
 is bound, in the buffer pointed to by
-.IR addr .
+.IR saddr .
 The
 .I addrlen
 argument should be initialized to indicate
 the amount of space (in bytes) pointed to by
-.IR addr .
+.IR saddr .
 On return it contains the actual size of the socket address.
 
 The returned address is truncated if the buffer provided is too small;
@@ -78,7 +78,7 @@ is not a valid file descriptor.
 .TP
 .B EFAULT
 The
-.I addr
+.I saddr
 argument points to memory not in a valid part of the
 process address space.
 .TP
diff --git a/man2/recv.2 b/man2/recv.2
index 33265b8..776df0c 100644
--- a/man2/recv.2
+++ b/man2/recv.2
@@ -52,7 +52,7 @@ recv, recvfrom, recvmsg \- receive a message from a socket
 .BI "ssize_t recv(int " sockfd ", void *" buf ", size_t " len ", int " flags );
 .sp
 .BI "ssize_t recvfrom(int " sockfd ", void *" buf ", size_t " len ", int " flags ,
-.BI "                 struct sockaddr *" src_addr ", socklen_t *" addrlen );
+.BI "                 struct sockaddr *" src_saddr ", socklen_t *" addrlen );
 .sp
 .BI "ssize_t recvmsg(int " sockfd ", struct msghdr *" msg ", int " flags );
 .fi
@@ -280,15 +280,15 @@ The caller must specify the size of the buffer in
 .IR len .
 
 If
-.I src_addr
+.I src_saddr
 is not NULL,
 and the underlying protocol provides the source address of the message,
 that source address is placed in the buffer pointed to by
-.IR src_addr .
+.IR src_saddr .
 .\" (Note: for datagram sockets in both the UNIX and Internet domains,
-.\" .I src_addr
+.\" .I src_saddr
 .\" is filled in.
-.\" .I src_addr
+.\" .I src_saddr
 .\" is also filled in for stream sockets in the UNIX domain, but is not
 .\" filled in for stream sockets in the Internet domain.)
 .\" [The above notes on AF_UNIX and AF_INET sockets apply as at
@@ -298,7 +298,7 @@ In this case,
 is a value-result argument.
 Before the call,
 it should be initialized to the size of the buffer associated with
-.IR src_addr .
+.IR src_saddr .
 Upon return,
 .I addrlen
 is updated to contain the actual size of the source address.
@@ -308,7 +308,7 @@ in this case,
 will return a value greater than was supplied to the call.
 
 If the caller is not interested in the source address,
-.I src_addr
+.I src_saddr
 and
 .I addrlen
 should be specified as NULL.
diff --git a/man2/recvmmsg.2 b/man2/recvmmsg.2
index a2b1f43..09b2261 100644
--- a/man2/recvmmsg.2
+++ b/man2/recvmmsg.2
@@ -219,7 +219,7 @@ main(void)
 #define BUFSIZE 200
 #define TIMEOUT 1
     int sockfd, retval, i;
-    struct sockaddr_in sa;
+    struct sockaddr_in saddr;
     struct mmsghdr msgs[VLEN];
     struct iovec iovecs[VLEN];
     char bufs[VLEN][BUFSIZE+1];
@@ -231,10 +231,10 @@ main(void)
         exit(EXIT_FAILURE);
     }
 
-    sa.sin_family = AF_INET;
-    sa.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
-    sa.sin_port = htons(1234);
-    if (bind(sockfd, (struct sockaddr *) &sa, sizeof(sa)) == \-1) {
+    saddr.sin_family = AF_INET;
+    saddr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
+    saddr.sin_port = htons(1234);
+    if (bind(sockfd, (struct sockaddr *) &saddr, sizeof(saddr)) == \-1) {
         perror("bind()");
         exit(EXIT_FAILURE);
     }
diff --git a/man2/select_tut.2 b/man2/select_tut.2
index d514ed0..0c4125a 100644
--- a/man2/select_tut.2
+++ b/man2/select_tut.2
@@ -553,7 +553,7 @@ static int forward_port;
 static int
 listen_socket(int listen_port)
 {
-    struct sockaddr_in a;
+    struct sockaddr_in saddr;
     int s;
     int yes;
 
@@ -569,10 +569,10 @@ listen_socket(int listen_port)
         close(s);
         return \-1;
     }
-    memset(&a, 0, sizeof(a));
-    a.sin_port = htons(listen_port);
-    a.sin_family = AF_INET;
-    if (bind(s, (struct sockaddr *) &a, sizeof(a)) == \-1) {
+    memset(&saddr, 0, sizeof(saddr));
+    saddr.sin_port = htons(listen_port);
+    saddr.sin_family = AF_INET;
+    if (bind(s, (struct sockaddr *) &saddr, sizeof(saddr)) == \-1) {
         perror("bind");
         close(s);
         return \-1;
@@ -585,7 +585,7 @@ listen_socket(int listen_port)
 static int
 connect_socket(int connect_port, char *address)
 {
-    struct sockaddr_in a;
+    struct sockaddr_in saddr;
     int s;
 
     s = socket(AF_INET, SOCK_STREAM, 0);
@@ -595,17 +595,17 @@ connect_socket(int connect_port, char *address)
         return \-1;
     }
 
-    memset(&a, 0, sizeof(a));
-    a.sin_port = htons(connect_port);
-    a.sin_family = AF_INET;
+    memset(&saddr, 0, sizeof(saddr));
+    saddr.sin_port = htons(connect_port);
+    saddr.sin_family = AF_INET;
 
-    if (!inet_aton(address, (struct in_addr *) &a.sin_addr.s_addr)) {
+    if (!inet_aton(address, (struct in_addr *) &saddr.sin_addr.s_addr)) {
         perror("bad IP address format");
         close(s);
         return \-1;
     }
 
-    if (connect(s, (struct sockaddr *) &a, sizeof(a)) == \-1) {
+    if (connect(s, (struct sockaddr *) &saddr, sizeof(saddr)) == \-1) {
         perror("connect()");
         shutdown(s, SHUT_RDWR);
         close(s);
@@ -701,10 +701,10 @@ main(int argc, char *argv[])
 
         if (FD_ISSET(h, &rd)) {
             unsigned int l;
-            struct sockaddr_in client_address;
+            struct sockaddr_in client_saddr;
 
-            memset(&client_address, 0, l = sizeof(client_address));
-            r = accept(h, (struct sockaddr *) &client_address, &l);
+            memset(&client_saddr, 0, l = sizeof(client_saddr));
+            r = accept(h, (struct sockaddr *) &client_saddr, &l);
             if (r == \-1) {
                 perror("accept()");
             } else {
@@ -718,7 +718,7 @@ main(int argc, char *argv[])
                     SHUT_FD1;
                 else
                     printf("connect from %s\\n",
-                            inet_ntoa(client_address.sin_addr));
+                            inet_ntoa(client_saddr.sin_addr));
             }
         }
 
diff --git a/man2/send.2 b/man2/send.2
index d5c5b0e..ef8ec4d 100644
--- a/man2/send.2
+++ b/man2/send.2
@@ -50,7 +50,7 @@ send, sendto, sendmsg \- send a message on a socket
 
 .BI "ssize_t sendto(int " sockfd ", const void *" buf ", size_t " len \
 ", int " flags ,
-.BI "               const struct sockaddr *" dest_addr ", socklen_t " addrlen );
+.BI "               const struct sockaddr *" dest_saddr ", socklen_t " addrlen );
 
 .BI "ssize_t sendmsg(int " sockfd ", const struct msghdr *" msg \
 ", int " flags );
@@ -98,7 +98,7 @@ is used on a connection-mode
 .RB ( SOCK_STREAM ,
 .BR SOCK_SEQPACKET )
 socket, the arguments
-.I dest_addr
+.I dest_saddr
 and
 .I addrlen
 are ignored (and the error
@@ -108,7 +108,7 @@ not NULL and 0), and the error
 .B ENOTCONN
 is returned when the socket was not actually connected.
 Otherwise, the address of the target is given by
-.I dest_addr
+.I dest_saddr
 with
 .I addrlen
 specifying its size.
diff --git a/man2/sendmmsg.2 b/man2/sendmmsg.2
index cd5ce66..1200309 100644
--- a/man2/sendmmsg.2
+++ b/man2/sendmmsg.2
@@ -188,7 +188,7 @@ int
 main(void)
 {
     int sockfd;
-    struct sockaddr_in sa;
+    struct sockaddr_in saddr;
     struct mmsghdr msg[2];
     struct iovec msg1[2], msg2;
     int retval;
@@ -199,10 +199,10 @@ main(void)
         exit(EXIT_FAILURE);
     }
 
-    sa.sin_family = AF_INET;
-    sa.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
-    sa.sin_port = htons(1234);
-    if (connect(sockfd, (struct sockaddr *) &sa, sizeof(sa)) == \-1) {
+    saddr.sin_family = AF_INET;
+    saddr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
+    saddr.sin_port = htons(1234);
+    if (connect(sockfd, (struct sockaddr *) &saddr, sizeof(saddr)) == \-1) {
         perror("connect()");
         exit(EXIT_FAILURE);
     }
diff --git a/man3/getaddrinfo.3 b/man3/getaddrinfo.3
index 7bf815a..24a0f73 100644
--- a/man3/getaddrinfo.3
+++ b/man3/getaddrinfo.3
@@ -671,8 +671,8 @@ main(int argc, char *argv[])
     struct addrinfo hints;
     struct addrinfo *result, *rp;
     int sfd, s;
-    struct sockaddr_storage peer_addr;
-    socklen_t peer_addr_len;
+    struct sockaddr_storage peer_saddr;
+    socklen_t peer_saddr_len;
     ssize_t nread;
     char buf[BUF_SIZE];
 
@@ -723,16 +723,16 @@ main(int argc, char *argv[])
     /* Read datagrams and echo them back to sender */
 
     for (;;) {
-        peer_addr_len = sizeof(struct sockaddr_storage);
+        peer_saddr_len = sizeof(struct sockaddr_storage);
         nread = recvfrom(sfd, buf, BUF_SIZE, 0,
-                (struct sockaddr *) &peer_addr, &peer_addr_len);
+                (struct sockaddr *) &peer_saddr, &peer_saddr_len);
         if (nread == \-1)
             continue;               /* Ignore failed request */
 
         char host[NI_MAXHOST], service[NI_MAXSERV];
 
-        s = getnameinfo((struct sockaddr *) &peer_addr,
-                        peer_addr_len, host, NI_MAXHOST,
+        s = getnameinfo((struct sockaddr *) &peer_saddr,
+                        peer_saddr_len, host, NI_MAXHOST,
                         service, NI_MAXSERV, NI_NUMERICSERV);
        if (s == 0)
             printf("Received %zd bytes from %s:%s\\n",
@@ -741,8 +741,8 @@ main(int argc, char *argv[])
             fprintf(stderr, "getnameinfo: %s\\n", gai_strerror(s));
 
         if (sendto(sfd, buf, nread, 0,
-                    (struct sockaddr *) &peer_addr,
-                    peer_addr_len) != nread)
+                    (struct sockaddr *) &peer_saddr,
+                    peer_saddr_len) != nread)
             fprintf(stderr, "Error sending response\\n");
     }
 }
diff --git a/man3/getnameinfo.3 b/man3/getnameinfo.3
index 0dc1d29..3947956 100644
--- a/man3/getnameinfo.3
+++ b/man3/getnameinfo.3
@@ -15,7 +15,7 @@ getnameinfo \- address-to-name translation in protocol-independent manner
 .B #include <sys/socket.h>
 .B #include <netdb.h>
 .sp
-.BI "int getnameinfo(const struct sockaddr *" "sa" ", socklen_t " "salen" ,
+.BI "int getnameinfo(const struct sockaddr *" "saddr" ", socklen_t " "salen" ,
 .BI "                char *" "host" ", socklen_t " "hostlen" ,
 .BI "                char *" "serv" ", socklen_t " "servlen" ", int " "flags" );
 .fi
@@ -261,11 +261,11 @@ a particular address family.
 
 .in +4n
 .nf
-struct sockaddr *sa;    /* input */
-socklen_t len;         /* input */
+struct sockaddr *saddr;    /* input */
+socklen_t len;             /* input */
 char hbuf[NI_MAXHOST], sbuf[NI_MAXSERV];
 
-if (getnameinfo(sa, len, hbuf, sizeof(hbuf), sbuf,
+if (getnameinfo(saddr, len, hbuf, sizeof(hbuf), sbuf,
             sizeof(sbuf), NI_NUMERICHOST | NI_NUMERICSERV) == 0)
     printf("host=%s, serv=%s\en", hbuf, sbuf);
 .fi
@@ -276,11 +276,11 @@ reverse address mapping.
 
 .in +4n
 .nf
-struct sockaddr *sa;    /* input */
-socklen_t len;         /* input */
+struct sockaddr *saddr;    /* input */
+socklen_t len;             /* input */
 char hbuf[NI_MAXHOST];
 
-if (getnameinfo(sa, len, hbuf, sizeof(hbuf),
+if (getnameinfo(saddr, len, hbuf, sizeof(hbuf),
             NULL, 0, NI_NAMEREQD))
     printf("could not resolve hostname");
 else
diff --git a/man7/epoll.7 b/man7/epoll.7
index ddc6f1a..58a4282 100644
--- a/man7/epoll.7
+++ b/man7/epoll.7
@@ -288,7 +288,8 @@ for (;;) {
     for (n = 0; n < nfds; ++n) {
         if (events[n].data.fd == listen_sock) {
             conn_sock = accept(listen_sock,
-                            (struct sockaddr *) &local, &addrlen);
+                               (struct sockaddr *) &local_saddr,
+                               &local_saddr_len);
             if (conn_sock == \-1) {
                 perror("accept");
                 exit(EXIT_FAILURE);
diff --git a/man7/unix.7 b/man7/unix.7
index 3eadb8a..ef834bc 100644
--- a/man7/unix.7
+++ b/man7/unix.7
@@ -598,18 +598,18 @@ a null terminator for the string returned in
 
 .nf
 .in +3
-void *addrp;
+void *saddr;
 
 addrlen = sizeof(struct sockaddr_un);
-addrp = malloc(addrlen + 1);
-if (addrp == NULL)
+saddr = malloc(addrlen + 1);
+if (saddr == NULL)
     /* Handle error */ ;
-memset(addrp, 0, addrlen + 1);
+memset(saddr, 0, addrlen + 1);
 
-if (getsockname(sfd, (struct sockaddr *) addrp, &addrlen)) == \-1)
+if (getsockname(sfd, (struct sockaddr *) saddr, &addrlen)) == \-1)
     /* handle error */ ;
 
-printf("sun_path = %s\\n", ((struct sockaddr_un *) addrp)\->sun_path);
+printf("sun_path = %s\\n", ((struct sockaddr_un *) saddr)\->sun_path);
 .in
 .fi
 
@@ -818,7 +818,7 @@ main(int argc, char *argv[])
 int
 main(int argc, char *argv[])
 {
-    struct sockaddr_un name;
+    struct sockaddr_un local_saddr;
     int i;
     int ret;
     int data_socket;
@@ -838,14 +838,14 @@ main(int argc, char *argv[])
      * the structure.
      */
 
-    memset(&name, 0, sizeof(struct sockaddr_un));
+    memset(&local_saddr, 0, sizeof(struct sockaddr_un));
 
-    /* Connect socket to socket name. */
+    /* Connect socket to socket local_saddr. */
 
-    name.sun_family = AF_UNIX;
-    strncpy(name.sun_path, SOCKET_NAME, sizeof(name.sun_path) \- 1);
+    local_saddr.sun_family = AF_UNIX;
+    strncpy(local_saddr.sun_path, SOCKET_NAME, sizeof(local_saddr.sun_path) \- 1);
 
-    ret = connect (data_socket, (const struct sockaddr *) &name,
+    ret = connect (data_socket, (const struct sockaddr *) &local_saddr,
                    sizeof(struct sockaddr_un));
     if (ret == \-1) {
         fprintf(stderr, "The server is down.\\n");
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
