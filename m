From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-headers-5.2 and proper use of SIOCGSTAMP
Date: Sat, 20 Jul 2019 22:40:49 +0200
Message-ID: <CAK8P3a049MYvvu3pDONanYEosweYYQH1qJMg+CuMK-NcULtXTA@mail.gmail.com>
References: <20190720174844.4b989d34@sf> <87wogca86l.fsf@mid.deneb.enyo.de>
 <CAK8P3a3s3OeBj1MviaJV2UR0eUhF0GKPBi1iFf_3QKQyNPkuqw@mail.gmail.com> <87muh8a4a3.fsf@mid.deneb.enyo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <libc-alpha-return-103851-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <87muh8a4a3.fsf@mid.deneb.enyo.de>
To: Florian Weimer <fw@deneb.enyo.de>
Cc: Sergei Trofimovich <slyfox@gentoo.org>, Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, GNU C Library <libc-alpha@sourceware.org>, "David S. Miller" <davem@davemloft.net>, Michael Kerrisk <mtk.manpages@gmail.com>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On Sat, Jul 20, 2019 at 9:34 PM Florian Weimer <fw@deneb.enyo.de> wrote:
> * Arnd Bergmann:
> > On Sat, Jul 20, 2019 at 8:10 PM Florian Weimer <fw@deneb.enyo.de> wrote:
> > As far as I can tell, nobody thought it would be a problem to move it
> > from asm/sockios.h to linux/sockios.h, as the general rule is that one
> > should use the linux/*.h version if both exist, and that the asm/*.h
> > version only contains architecture specific definitions. The new
> > definition is the same across all architectures, so it made sense to
> > have it in the common file.
>
> Most of the socket-related constants are not exposed in UAPI headers,
> although userspace is expected to use them.  It seems to me that due
> to the lack of other options among the UAPI headers, <asm/socket.h>
> has been a dumping ground for various socket-related things in the
> past, whether actually architecture-specific or not.
>
> <linux/socket.h> does not include <asm/socket.h>, so that's why we
> usually end up with including <asm/socket.h> (perhaps indirectly via
> <sys/socket.h>), which used to include <asm/sockios.h> on most (all?)
> architectures.  That in turn provided some of the SIOC* constants in
> the past, so people didn't investigate other options.

It seems that both the missing constants and the fact that
linux/socket.h doesn't include asm/socket.h and linux/sockios.h
goes back to a 21 year old commit:

commit 74f513101058f7585176ea8cdf6fb026faea8a7e
Author: linus1 <torvalds@linuxfoundation.org>
Date:   Wed May 20 11:00:00 1998 -0800

    [tytso] include/asm-i386/posix_types.h
    This quick fix eliminates a lot of warning messages when
    compiling e2fsprogs under glibc.  This is because the glibc header files
    defines its own version of FD_SET, FD_ZERO, etc., and so if you need to
    #include the kernel include files, you get a lot of duplicate defined
    macro warning messages.  This patch simply #ifdef's out the kernel
    versions of these function if the kernel is not being compiled and the
    glibc header files are in use.

diff --git a/include/linux/socket.h b/include/linux/socket.h
index 08f0d281401c..35a7629b6b70 100644
--- a/include/linux/socket.h
+++ b/include/linux/socket.h
@@ -1,6 +1,8 @@
 #ifndef _LINUX_SOCKET_H
 #define _LINUX_SOCKET_H

+#if defined(__KERNEL__) || !defined(__GLIBC__) || (__GLIBC__ < 2)
+
 #include <asm/socket.h>                        /* arch-dependent
defines       */
 #include <linux/sockios.h>             /* the SIOCxxx I/O controls     */
 #include <linux/uio.h>                 /* iovec support                */
@@ -256,4 +258,5 @@ extern int move_addr_to_user(void *kaddr, int
klen, void *uaddr, int *ulen);
 extern int move_addr_to_kernel(void *uaddr, int ulen, void *kaddr);
 extern int put_cmsg(struct msghdr*, int level, int type, int len, void *data);
 #endif
+#endif /* not kernel and not glibc */
 #endif /* _LINUX_SOCKET_H */

(the same commit did similar changes in linux/stat.h and asm/posix_types.h)

Over time, the check for glibc was removed (to allow including linux/socket.h
before sys/socket.h), and all the #ifdef __KERNEL__ bits were removed
from the installed header as part of the uapi header split.

> I think we can change glibc to include <linux/sockios.h> in addition
> to <asm/socket.h>.  <linux/sockios.h> looks reasonably clean to me,
> much better than <asm/socket.h>.

That seems reasonable to me, but overall my fear is that these headers
are already so broken that any change will risk breaking something
in more or less unexpected ways.

        Arnd
