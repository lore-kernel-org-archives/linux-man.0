From: Zack Weinberg <zackw@panix.com>
Subject: Re: The time(2) man page conflicts with glibc
Date: Tue, 15 Dec 2015 09:14:36 -0500
Message-ID: <CAKCAbMj-X+wLKX3=MDm9z3L9zyikemxCNggu2bfw6=o6K5PGgg@mail.gmail.com>
References: <CAMe9rOoJLk8VzyJKmkOvbmBxhCj4mVA2huYtHJsdxpatbkgJ1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <libc-alpha-return-65607-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <CAMe9rOoJLk8VzyJKmkOvbmBxhCj4mVA2huYtHJsdxpatbkgJ1g@mail.gmail.com>
To: "H.J. Lu" <hjl.tools@gmail.com>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, libc-alpha <libc-alpha@sourceware.org>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On Tue, Dec 15, 2015 at 8:58 AM, H.J. Lu <hjl.tools@gmail.com> wrote:
...
>        time_t time(time_t *t);
...
>        If t is non-NULL, the return value is also stored in the memory pointed
>        to by t.
...
>        On error, ((time_t) -1) is returned, and errno is set appropriately.
...
>        EFAULT t points outside your accessible address space.
...
>    0: b8 c9 00 00 00       mov    $0xc9,%eax
>    5: 0f 05                 syscall
>    7: c3                   retq
>
> I didn't check what kernel returns when memory is invalid.

I did.  The *actual system call* does indeed return -EFAULT when
memory is invalid, which will be observed as 0xfffffffffffffff2 in the
return value.  However, the *vDSO shortcut* (which does not trap into
the kernel) will just segfault the application.  This is an observable
ABI difference between statically and dynamically linked binaries.

Given the extreme obsolescence of the argument to `time`, I would
recommend that the *kernel* be changed to fire an actual SIGSEGV
instead of returning -EFAULT from the syscall version of `time`, and
then that can be the documented behavior, with the historic behavior
relegated to the BUGS section of the manpage.

(Is the vDSO mapped into processes with statically linked executable
images?  If so, we could also consider changing glibc to use it
always.)

Test program and results:

$ cat test.c
#include <time.h>
#include <stdio.h>
#include <errno.h>

int main(void)
{
  time_t a;
  time_t b;
  errno = 0;
  a = time(&b);
  printf("%016llx %016llx %d\n",
         (unsigned long long)a, (unsigned long long)b, errno);

  errno = 0;
  a = time(0);
  printf("%016llx %d\n", (unsigned long long)a, errno);

  errno = 0;
  a = time((time_t *)0x8000FFFF0000FFFF);
  printf("%016llx %d\n", (unsigned long long)a, errno);
  return 0;
}

$ gcc test.c && ./a.out
0000000056701f0d 0000000056701f0d 0
0000000056701f0d 0
Segmentation fault

$ gcc -static test.c && ./a.out
0000000056701f22 0000000056701f22 0
0000000056701f22 0
fffffffffffffff2 0
