From: Tetsuo Handa <penguin-kernel-JPay3/Yim36HaxMnTkn67Xf5DAMn2ifp@public.gmane.org>
Subject: [patch] unix.7: Fix description of "pathname" sockets
Date: Sun, 4 Mar 2012 15:06:22 +0900
Message-ID: <201203041506.IEI12222.VHFQOLtMOSFOJF@I-love.SAKURA.ne.jp>
References: <AANLkTimtTazMmDvQFgASsVGa=AYvPZqUaUmyg5p7VVY1@mail.gmail.com><201010171428.DDC17187.FFFJSLtOOHOMQV@I-love.SAKURA.ne.jp><201010262115.FEH09326.OMFJHSVOFLQFOt@I-love.SAKURA.ne.jp><201011232159.DFE78143.tSHMFQOLFVFJOO@I-love.SAKURA.ne.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201011232159.DFE78143.tSHMFQOLFVFJOO-JPay3/Yim36HaxMnTkn67Xf5DAMn2ifp@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

test.c generates below output.

size=111 sun_path='bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbcccc'

----- test.c start -----
#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>

int main(int argc, char *argv[])
{
        struct {
                struct sockaddr_un addr1;
                struct sockaddr_un addr2;
                struct sockaddr_un addr3;
                char tail[5];
        } buf = { };
        socklen_t size = sizeof(buf.addr3);
        int fd1 = socket(PF_UNIX, SOCK_STREAM, 0);
        int fd2 = socket(PF_UNIX, SOCK_STREAM, 0);
        int fd3;
        buf.addr1.sun_family = AF_UNIX;
        buf.addr2.sun_family = AF_UNIX;
        memset(buf.addr1.sun_path, 'a', sizeof(buf.addr1.sun_path));
        memset(buf.addr2.sun_path, 'b', sizeof(buf.addr2.sun_path));
        memset(buf.tail, 'c', sizeof(buf.tail) - 1);
        if (bind(fd1, (struct sockaddr *) &buf.addr1, sizeof(buf.addr1)) ||
            listen(fd1, 5) ||
            bind(fd2, (struct sockaddr *) &buf.addr2, sizeof(buf.addr2)) ||
            connect(fd2, (struct sockaddr *) &buf.addr1, sizeof(buf.addr1)))
                return 1;
        fd3 = accept(fd1, (struct sockaddr *) &buf.addr3, &size);
        printf("size=%d sun_path='%s'\n", size, buf.addr3.sun_path);
        return 0;
}
----- test.c end -----

----------------------------------------
 From f388eedbdc0b099bb9f36ab007f9370432abb300 Mon Sep 17 00:00:00 2001
 From: Tetsuo Handa <penguin-kernel-JPay3/Yim36HaxMnTkn67Xf5DAMn2ifp@public.gmane.org>
Date: Tue, 23 Nov 2010 21:34:25 +0900
Subject: [PATCH] unix.7: Fix description of "pathname" sockets

Since unix_mkname() in net/unix/af_unix.c does

  ((char *)sunaddr)[len] = 0;

rather than

  ((char *)sunaddr)[len - 1] = 0;

, sunaddr->sun_path may not be terminated with a null byte if
len == sizeof(*sunaddr).

Therefore, the caller of getsockname(), getpeername(), accept() must not assume
that sunaddr->sun_path contains a null-terminated pathname even if the returned
addrlen is greater than sizeof(sa_family_t) and sun_path[0] != '\0'.

Signed-off-by: Tetsuo Handa <penguin-kernel-JPay3/Yim36HaxMnTkn67Xf5DAMn2ifp@public.gmane.org>
---
 man7/unix.7 |   19 ++++++++++++++++---
 1 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/man7/unix.7 b/man7/unix.7
index b53328b..7b0b47c 100644
--- a/man7/unix.7
+++ b/man7/unix.7
@@ -80,10 +80,23 @@ When the address of the socket is returned by
 and
 .BR accept (2),
 its length is
-.IR "offsetof(struct sockaddr_un, sun_path) + strlen(sun_path) + 1" ,
+.IR "offsetof(struct sockaddr_un, sun_path) + strlen(sun_path) + 1".
+Note that this length can be one byte larger than
+.IR "sizeof(struct sockaddr_un)"
+because
+.BR bind (2)
+accepts
+.IR sun_path
+which is not terminated with a null byte ('\\0').
+Therefore, you must not use string manipulation functions (e.g. strlen(),
+printf("%s")) against
+.IR sun_path
+because
+.BR getsockname (2),
+.BR getpeername (2),
 and
-.I sun_path
-contains the null-terminated pathname.
+.BR accept (2)
+may not have stored a null-terminated string.
 .IP *
 .IR unnamed :
 A stream socket that has not been bound to a pathname using
-- 
1.6.1
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
