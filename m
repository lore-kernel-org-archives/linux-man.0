From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] Consistency fix: Use "saddr" as the postfix for "struct
 sockaddr"-based type names.
Date: Wed, 3 Feb 2016 15:55:33 +0100
Message-ID: <56B214E5.8070809@gmail.com>
References: <56A917A8.9010007@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56A917A8.9010007-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Carlos,

On 01/27/2016 08:16 PM, Carlos O'Donell wrote:
> The goal is to make it easier for a reader to follow along with the
> documentation, prototypes, and examples that use "struct sockaddr".
> We achieve this by using a consistent naming for "struct sockaddr"
> -based types. Instead of using "sa", or "name" or "local" we use
> "saddr", "name_saddr" and "local_saddr". We avoid variable names
> like "sa" which are used for "sigaction" examples.
> 
> Instead of the generic "addr" we use "saddr" in places where we accept
> "struct sockaddr" as an argument, either the struct or a pointer to the
> struct. Where the eventual goal is to cast the variable to a 
> "struct sockaddr"-based type, such variable names are adjusted. So for
> example if we have a "struct sockaddr_un" variable we call it 
> "local_saddr" if it will eventually be cast to "struct sockaddr *".
> 
> We might have standardized on just "addr" but that's ambiguous
> and I'd like to use, where appropriate, slightly different variable
> names for the various forms of "struct sockaddr" like "sockaddr_un",
> "sockaddr_in", "sockaddr_storage" and others, so "addr" is a poor
> choice when helping the reader follow along (not to mention the
> confusion with virtual memory addresses and mmap).
> 
> Please apply.
> 
> Patch against master.

I'm not quite convinced about this patch. Some thoughts:

* Consistency is a good thing. Names such as 'a' or 'sa' are
  not very helpful. And I'm happy to see that stuff go away.

* I'm reluctant about the odd name 'saddr'. It's not consistent with
  the BSDs, or much existing documentation. Also, I'm not convinced
  that the possible confusion with VM addresses or mmap().) So, if
  standardizing, I'd prefer to stick with 'addr' (which is also 
  consistent with 'addrlen').

I applied the patch below. Perhaps that's enough change to make
you happy. I'm not dead set against renaming 'addr' and so
forth, but the argument for the benefit would need to be fairly
convincing.

Cheers,

Michael


--- a/man2/recvmmsg.2
+++ b/man2/recvmmsg.2
@@ -219,7 +219,7 @@ main(void)
 #define BUFSIZE 200
 #define TIMEOUT 1
     int sockfd, retval, i;
-    struct sockaddr_in sa;
+    struct sockaddr_in addr;
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
+    addr.sin_family = AF_INET;
+    addr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
+    addr.sin_port = htons(1234);
+    if (bind(sockfd, (struct sockaddr *) &addr, sizeof(addr)) == \-1) {
         perror("bind()");
         exit(EXIT_FAILURE);
     }
diff --git a/man2/select_tut.2 b/man2/select_tut.2
index d514ed0..da05a39 100644
--- a/man2/select_tut.2
+++ b/man2/select_tut.2
@@ -553,7 +553,7 @@ static int forward_port;
 static int
 listen_socket(int listen_port)
 {
-    struct sockaddr_in a;
+    struct sockaddr_in addr;
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
+    memset(&addr, 0, sizeof(addr));
+    addr.sin_port = htons(listen_port);
+    addr.sin_family = AF_INET;
+    if (bind(s, (struct sockaddr *) &addr, sizeof(addr)) == \-1) {
         perror("bind");
         close(s);
         return \-1;
@@ -585,7 +585,7 @@ listen_socket(int listen_port)
 static int
 connect_socket(int connect_port, char *address)
 {
-    struct sockaddr_in a;
+    struct sockaddr_in addr;
     int s;
 
     s = socket(AF_INET, SOCK_STREAM, 0);
@@ -595,17 +595,17 @@ connect_socket(int connect_port, char *address)
         return \-1;
     }
 
-    memset(&a, 0, sizeof(a));
-    a.sin_port = htons(connect_port);
-    a.sin_family = AF_INET;
+    memset(&addr, 0, sizeof(addr));
+    addr.sin_port = htons(connect_port);
+    addr.sin_family = AF_INET;
 
-    if (!inet_aton(address, (struct in_addr *) &a.sin_addr.s_addr)) {
+    if (!inet_aton(address, (struct in_addr *) &addr.sin_addr.s_addr)) {
         perror("bad IP address format");
         close(s);
         return \-1;
     }
 
-    if (connect(s, (struct sockaddr *) &a, sizeof(a)) == \-1) {
+    if (connect(s, (struct sockaddr *) &addr, sizeof(addr)) == \-1) {
         perror("connect()");
         shutdown(s, SHUT_RDWR);
         close(s);
@@ -701,10 +701,10 @@ main(int argc, char *argv[])
 
         if (FD_ISSET(h, &rd)) {
             unsigned int l;
-            struct sockaddr_in client_address;
+            struct sockaddr_in client_addr;
 
-            memset(&client_address, 0, l = sizeof(client_address));
-            r = accept(h, (struct sockaddr *) &client_address, &l);
+            memset(&client_addr, 0, l = sizeof(client_addr));
+            r = accept(h, (struct sockaddr *) &client_addr, &l);
             if (r == \-1) {
                 perror("accept()");
             } else {
@@ -718,7 +718,7 @@ main(int argc, char *argv[])
                     SHUT_FD1;
                 else
                     printf("connect from %s\\n",
-                            inet_ntoa(client_address.sin_addr));
+                            inet_ntoa(client_addr.sin_addr));
             }
         }
 
diff --git a/man2/sendmmsg.2 b/man2/sendmmsg.2
index cd5ce66..e4974d9 100644
--- a/man2/sendmmsg.2
+++ b/man2/sendmmsg.2
@@ -188,7 +188,7 @@ int
 main(void)
 {
     int sockfd;
-    struct sockaddr_in sa;
+    struct sockaddr_in addr;
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
+    addr.sin_family = AF_INET;
+    addr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
+    addr.sin_port = htons(1234);
+    if (connect(sockfd, (struct sockaddr *) &addr, sizeof(addr)) == \-1) {
         perror("connect()");
         exit(EXIT_FAILURE);
     }
diff --git a/man3/getnameinfo.3 b/man3/getnameinfo.3
index 0dc1d29..91473c2 100644
--- a/man3/getnameinfo.3
+++ b/man3/getnameinfo.3
@@ -15,7 +15,7 @@ getnameinfo \- address-to-name translation in protocol-independent manner
 .B #include <sys/socket.h>
 .B #include <netdb.h>
 .sp
-.BI "int getnameinfo(const struct sockaddr *" "sa" ", socklen_t " "salen" ,
+.BI "int getnameinfo(const struct sockaddr *" "addr" ", socklen_t " "addrlen" ,
 .BI "                char *" "host" ", socklen_t " "hostlen" ,
 .BI "                char *" "serv" ", socklen_t " "servlen" ", int " "flags" );
 .fi
@@ -53,7 +53,7 @@ argument is a pointer to a generic socket address structure
 or
 .IR sockaddr_in6 )
 of size
-.I salen
+.I addrlen
 that holds the input IP address and port number.
 The arguments
 .I host
@@ -261,11 +261,11 @@ a particular address family.
 
 .in +4n
 .nf
-struct sockaddr *sa;    /* input */
-socklen_t len;         /* input */
+struct sockaddr *addr;     /* input */
+socklen_t addrlen;         /* input */
 char hbuf[NI_MAXHOST], sbuf[NI_MAXSERV];
 
-if (getnameinfo(sa, len, hbuf, sizeof(hbuf), sbuf,
+if (getnameinfo(addr, addrlen, hbuf, sizeof(hbuf), sbuf,
             sizeof(sbuf), NI_NUMERICHOST | NI_NUMERICSERV) == 0)
     printf("host=%s, serv=%s\en", hbuf, sbuf);
 .fi
@@ -276,11 +276,11 @@ reverse address mapping.
 
 .in +4n
 .nf
-struct sockaddr *sa;    /* input */
-socklen_t len;         /* input */
+struct sockaddr *addr;     /* input */
+socklen_t addrlen;         /* input */
 char hbuf[NI_MAXHOST];
 
-if (getnameinfo(sa, len, hbuf, sizeof(hbuf),
+if (getnameinfo(addr, addrlen, hbuf, sizeof(hbuf),
             NULL, 0, NI_NAMEREQD))
     printf("could not resolve hostname");
 else
diff --git a/man7/epoll.7 b/man7/epoll.7
index ddc6f1a..94be6ed 100644
--- a/man7/epoll.7
+++ b/man7/epoll.7
@@ -288,7 +288,7 @@ for (;;) {
     for (n = 0; n < nfds; ++n) {
         if (events[n].data.fd == listen_sock) {
             conn_sock = accept(listen_sock,
-                            (struct sockaddr *) &local, &addrlen);
+                               (struct sockaddr *) &addr, &addrlen);
             if (conn_sock == \-1) {
                 perror("accept");
                 exit(EXIT_FAILURE);
diff --git a/man7/unix.7 b/man7/unix.7
index e069348..94d9210 100644
--- a/man7/unix.7
+++ b/man7/unix.7
@@ -817,7 +817,7 @@ main(int argc, char *argv[])
 int
 main(int argc, char *argv[])
 {
-    struct sockaddr_un name;
+    struct sockaddr_un addr;
     int i;
     int ret;
     int data_socket;
@@ -837,14 +837,14 @@ main(int argc, char *argv[])
      * the structure.
      */
 
-    memset(&name, 0, sizeof(struct sockaddr_un));
+    memset(&addr, 0, sizeof(struct sockaddr_un));
 
-    /* Connect socket to socket name. */
+    /* Connect socket to socket address */
 
-    name.sun_family = AF_UNIX;
-    strncpy(name.sun_path, SOCKET_NAME, sizeof(name.sun_path) \- 1);
+    addr.sun_family = AF_UNIX;
+    strncpy(addr.sun_path, SOCKET_NAME, sizeof(addr.sun_path) \- 1);
 
-    ret = connect (data_socket, (const struct sockaddr *) &name,
+    ret = connect (data_socket, (const struct sockaddr *) &addr,
                    sizeof(struct sockaddr_un));
     if (ret == \-1) {
         fprintf(stderr, "The server is down.\\n");

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
