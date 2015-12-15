From: "H.J. Lu" <hjl.tools@gmail.com>
Subject: The time(2) man page conflicts with glibc
Date: Tue, 15 Dec 2015 05:58:20 -0800
Message-ID: <CAMe9rOoJLk8VzyJKmkOvbmBxhCj4mVA2huYtHJsdxpatbkgJ1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <libc-alpha-return-65606-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: libc-alpha <libc-alpha@sourceware.org>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

TIME(2)                    Linux Programmer's Manual                   TIME(2)

NAME
       time - get time in seconds

SYNOPSIS
       #include <time.h>

       time_t time(time_t *t);

DESCRIPTION
       time()  returns  the  time  as  the  number of seconds since the Epoch,
       1970-01-01 00:00:00 +0000 (UTC).

       If t is non-NULL, the return value is also stored in the memory pointed
       to by t.

RETURN VALUE
       On  success,  the value of time in seconds since the Epoch is returned.
       On error, ((time_t) -1) is returned, and errno is set appropriately.

ERRORS
       EFAULT t points outside your accessible address space.

CONFORMING TO
       SVr4, 4.3BSD, C89, C99, POSIX.1-2001.  POSIX does not specify any error
       conditions.

But x86-64 glibc has

0000000000000000 <time>:
   0: b8 c9 00 00 00       mov    $0xc9,%eax
   5: 0f 05                 syscall
   7: c3                   retq

I didn't check what kernel returns when memory is invalid.


H.J.
