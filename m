From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: man page for robust mutexes
Date: Sun, 7 Dec 2008 11:44:54 -0500
Message-ID: <cfd18e0f0812070844t349b6026n6e2b0a2b4826fa66@mail.gmail.com>
References: <20081201213458.GA18973@Chamillionaire.breakpoint.cc>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081201213458.GA18973-N26foeg2n7CSQxDm3FYtNwe+0vtP5+jfMa5aj3AfGnc@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Andrzej Siewior <sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Sebastian,

Thanks for writing this page!

I will have more comments later, but a few quick comments now.  Could
you revise your page in the light of these comments?

On Mon, Dec 1, 2008 at 4:34 PM, Sebastian Andrzej Siewior
<sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org> wrote:
> Robust mutexes are available since a few days, so here is a man page for
> them. I used pthread_mutexattr_setprotocol.3p as a template and sneaked a
> few phrases from there.

Please be careful here.  If there are any sentences taken from a
copyrighted source (the 3p pages are copyright by the IEEE), could you
please rewrite in your own words.

> That's my first man-page however, so some things
> might be wrong :)

Could you take a look at man-pages(7) please -- that will clarify some
of my comments below.

> Sebastian
> --- /dev/null
> +++ b/man3p/pthread_mutexattr_setrobust_np.3p
> @@ -0,0 +1,240 @@
> +.\" Copyright (c) 2008 Sebastian Andrzej Siewior

You need to put this page under a free license.  Have a look here:
http://www.kernel.org/doc/man-pages/licenses.html
The "verbatim" license is the most widely used, and my preference for
new pages, but it's your choice.

> +.TH "ROBUST MUTEXES" P 2008 "" "POSIX Programmer's Manual"

s/P/3/

s/POSIX Programmer's Manual/Linux Programmer's Manual/

> +.\" pthread_mutexattr_setrobust_np
> +.SH NAME
> +pthread_mutexattr_setrobust_np, pthread_mutexattr_getrobust_np \- set or get
> +the robustness of a mutex
> +.SH SYNOPSIS
> +.LP

I prefer .nf/.fi blocks for the SYNOPIS, and then you can drop all of
the .br and .sp clutter.  See, for example, fcntl(2).

> +\fB#include <pthread.h>

Please, rather make it .B for each of these lines, and .BI where you
need to mix with italic  See, for example, fcntl(2).

> +.br
> +.sp
> +#define __USE_GNU

s/__USE_GNU/_GNU_SOURCE/

See feature_test_macros(7)

> +.sp
> +int pthread_mutexattr_getrobust_np(pthread_mutexattr_t *\fP\fIattr\fP\fB, int
> +\fP\fIrobustness\fP\fB);
> +.br
> +int pthread_mutexattr_setrobust_np(pthread_mutexattr_t *\fP\fIattr\fP\fB, int
> +\fP\fIrobustness\fP\fB);
> +.br
> +int pthread_mutex_consistent_np(pthread_mutex_t *\fP\fImutex\fP\fB);
> +\fP
> +\fB
> +.br
> +\fP
> +.SH DESCRIPTION
> +.LP
> +The \fIpthread_mutexattr_getrobust_np\fP() and

The convention used in most man-pages sources is

.BR func ()

Could you please swich all instances to that.

> +\fIpthread_mutexattr_setrobust_np\fP() functions, respectively, shall get and
> +set the robustness attribute of a mutex attributes object pointed to by
> +\fIattr\fP which was previously created by the function

Preferred is:

.I attr

Could you please change all instances.

> +\fIpthread_mutexattr_init\fP().
> +.LP
> +The \fIrobustness\fP attribute defines the robustness to be used in utilizing
> +mutexes. The value of \fIrobustness\fP may be one of:

Please start new sentences on new source lines.  (See man-pages(7).)

> +.LP
> +.sp
> +PTHREAD_MUTEX_STALLED_NP
> +.br
> +.sp
> +PTHREAD_MUTEX_ROBUST_NP
> +.br
> +.sp
> +.LP
> +which are defined in the \fI<pthread.h>\fP header if the GNU extensions are

Use ".I"

> +used.
> +.LP
> +The default attribute is PTHREAD_MUTEX_STALLED_NP.

Use .B for constants

> +.LP
> +When a mutex is created with PTHREAD_MUTEX_STALLED_NP is locked and the owner
> +dies, then the next call to pthread_mutex_lock() will block forever. Also,
> +the already waiting waiters will wait for ever.
> +.LP
> +The behavior is different if the mutex is created with
> +PTHREAD_MUTEX_ROBUST_NP. If the owner dies while holding the lock, the
> +next call to \fIpthread_mutex_lock\fP() will return EOWNERDEAD and the caller

Use .B for constants

> +will acquire lock. The new owner should call
> +\fIpthread_mutex_consistent_np\fP() on the mutex once the internal state of
> +the protected variables are consistent again. If this is not done, future
> +calls to pthread_mutex_lock() will continue to return EOWNERDEAD (although
> +locking will function correctly).
> +.SH RETURN VALUE
> +.LP

.LP is needed after .SH

> +Upon successful completion, \fIpthread_mutexattr_setrobust_np\fP(),
> +\fIpthread_mutexattr_getrobust_np\fP() and
> +\fIpthread_mutex_consistent_np\fP()shall return zero; otherwise,
> +an error number shall be returned to indicate the error.
> +.SH ERRORS
> +.LP
> +The \fIpthread_mutexattr_destroy\fP() function may fail if:

Wrong function nam above.

> +.TP 7
> +.B EINVAL
> +The value specified by \fIrobustness\fP is invalid.
> +.LP
> +The \fIpthread_mutex_consistent_np\fp() function may fail if:
> +.TP 7
> +.B EINVAL
> +The mutex specified by \fImutex\fP is either not PTHREAD_MUTEX_ROBUST_NP or is
> +in consistent state.

"in an incinsistent state"?

> +\fIThe following sections are informative.\fP
> +.SH EXAMPLES
> +.LP
> +The robost mutexes could be used to share a common lock accross multiple
> +process and avoid IPC communication. Here is an example:
> +.sp
> +.RS
> +.nf
> +\fB
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <fcntl.h>
> +#include <unistd.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <stdlib.h>
> +#include <sys/mman.h>
> +#include <errno.h>
> +
> +#define __USE_GNU

s/__USE_GNU/_GNU_SOURCE/
and move to top of listing (see feature_test_macros(7).

> +#include <pthread.h>
> +
> +static const char *lock_name = "/dev/shm/limi_lock";
> +static int lock_fd;
> +static void *limi_ressource;
> +static pthread_mutex_t *limi_mutex;
> +
> +.sp
> +
> +static int open_existing_lock(void)
> +{
> +       int fd;
> +       int ret;
> +       struct stat buf;
> +       int retry = 5;
> +
> +       fd = open(lock_name, O_RDWR);
> +       if (fd < 0)
> +               return fd;
> +       do {
> +
> +               ret = fstat(fd, &buf);
> +               if (ret < 0)
> +                       return ret;
> +
> +               if (buf.st_size == sizeof(*limi_mutex))
> +                       return fd;
> +
> +               sleep(1);
> +               retry--;

s/-/\\-/ for each '-' in source code.

> +       } while (retry);
> +
> +       close(fd);
> +       return -1;

See previous comment.

> +}
> +
> +.sp
> +
> +static int create_new_lock(void)
> +{
> +       int fd;
> +       pthread_mutex_t cmutex = PTHREAD_MUTEX_INITIALIZER;
> +       pthread_mutexattr_t attr;
> +       int ret;
> +
> +       pthread_mutexattr_init(&attr);
> +       pthread_mutexattr_setrobust_np(&attr, PTHREAD_MUTEX_ROBUST_NP);
> +       pthread_mutex_init(&cmutex, &attr);
> +
> +       fd = open(lock_name, O_RDWR | O_CREAT | O_EXCL, S_IRUSR | S_IWUSR |
> +                       S_IRGRP | S_IWGRP);
> +       if (fd < 0)
> +               return fd;
> +
> +       ret = write(fd, &cmutex, sizeof(cmutex));
> +       if (ret < 0) {
> +               fprintf(stderr, "Write to %s failed: %s\n",
> +                               lock_name, strerror(errno));
> +               exit(1);
> +       }
> +       return fd;
> +}
> +
> +.sp
> +
> +void limi_lock_init(void)
> +{
> +       lock_fd = open_existing_lock();
> +       if (lock_fd < 0) {
> +               lock_fd = create_new_lock();
> +               if (lock_fd < 0) {
> +                       lock_fd = open_existing_lock();
> +                       if (lock_fd < 0) {
> +                               fprintf(stderr, "Can't open %s: %s\n",
> +                                               lock_name, strerror(errno));
> +                               exit(1);
> +                       }
> +               }
> +       }
> +
> +       limi_lock_mmap = mmap(NULL, sizeof(*limi_mutex),
> +                       PROT_READ | PROT_WRITE, MAP_SHARED, lock_fd, 0);
> +
> +       if (limi_lock_mmap == MAP_FAILED) {
> +               fprintf(stderr, "failed to mmap limi lock: %s\n",
> +                               strerror(errno));
> +               exit(1);
> +       }
> +       limi_mutex = limi_lock_mmap;
> +}
> +
> +.sp
> +
> +void limi_lock(void)
> +{
> +       int ret;
> +
> +       ret = pthread_mutex_lock(limi_mutex);
> +       if (!ret)
> +               return;
> +
> +       if (ret == EOWNERDEAD) {
> +               pthread_mutex_consistent_np(limi_mutex);
> +               return;
> +       }
> +
> +       fprintf(stderr, "Can not grab lock: %s\n", strerror(ret));
> +       exit(1);
> +}
> +
> +.sp
> +
> +void limi_unlock(void)
> +{
> +       int ret;
> +
> +       ret = pthread_mutex_unlock(limi_mutex);
> +       if (!ret)
> +               return;
> +
> +       fprintf(stderr, "Can not unlock: %s\n", strerror(ret));
> +       exit(1);
> +}
> +
> +\fP
> +.fi
> +.RE
> +.LP

I think it's better to have the explanation of the programs before the
listing.  Could you relocate it please.

> +The code example shows how to share a lock between two applications without
> +classic IPC. If one of the applications dies while holding the lock or the
> +system reboots unexpectly, the new owner of lock marks the lock state
> +consistent. In this example the lock owner does not need to perform any
> +validation of the resource protected by the lock. The lock owner knows if
> +the previous owner unlocked successfully or died.
> +.f
> +.SH SEE ALSO
> +.LP
> +\fIpthread_mutex_create\fP(), \fIpthread_mutex_destroy\fP(),
> +\fIpthread_mutexattr_init\fP(), \fIpthread_mutexattr_destroy\fP(),
> +\fIpthread_mutex_lock\fP(), \fIpthread_mutex_unlock\fP(), \fI<pthread.h>\fP
> +.SH COPYRIGHT
> +This man page was contributed by Sebastian Andrzej Siewior.

Take a look, and you'll see that *no* pages in man-pages carry
copyright notices in the formatted output.  The copyright notice in
the page source suffices.


Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
