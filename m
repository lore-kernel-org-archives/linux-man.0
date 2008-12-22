From: "Bert Wesarg" <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH v2] add man-page for pthread_mutexattr_setrobust_np()
Date: Mon, 22 Dec 2008 08:32:15 +0100
Message-ID: <36ca99e90812212332l3067e911v89de96638734ea38@mail.gmail.com>
References: <20081201213458.GA18973@Chamillionaire.breakpoint.cc>
	 <cfd18e0f0812070844t349b6026n6e2b0a2b4826fa66@mail.gmail.com>
	 <20081221205941.GA11805@Chamillionaire.breakpoint.cc>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081221205941.GA11805-N26foeg2n7CSQxDm3FYtNwe+0vtP5+jfMa5aj3AfGnc@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Andrzej Siewior <sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sun, Dec 21, 2008 at 21:59, Sebastian Andrzej Siewior
<sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org> wrote:
> * Michael Kerrisk | 2008-12-07 11:44:54 [-0500]:
>
>>Sebastian,
> Michael,
Sebastian, Michael,

> +.SH EXAMPLE
> +The code example shows how to share a lock between two applications without
> +System V IPC.
> +An advantage over System V semaphores is that the kernel is not invoked in
> +case the lock is not hold.
> +If one of the applications dies while holding the lock or the system reboots
> +unexpectedly, the new owner of lock marks the lock state consistent.
> +In this example the lock owner does not need to perform any validation of the
> +resource protected by the lock.
> +
> +.nf
> +#define _GNU_SOURCE
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <pthread.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +
> +#include <sys/mman.h>
> +#include <sys/stat.h>
> +#include <sys/types.h>
> +
> +static const char *lock_name = "/dev/shm/limi_lock";
> +static pthread_mutex_t *limi_mutex;
> +
> +static int open_existing_lock(void)
> +{
> +    int fd;
> +    int ret;
> +    struct stat buf;
> +    int retry = 5;
> +
> +    fd = open(lock_name, O_RDWR);
> +    if (fd < 0)
> +        return fd;
> +    do {
> +        ret = fstat(fd, &buf);
> +        if (ret < 0)
Isn't here a close(2) missing?

> +            return ret;
> +
> +        if (buf.st_size == sizeof(*limi_mutex))
> +            return fd;
> +
> +        close(fd);
Isn't this close(2) wrong here?

> +        sleep(1);
> +        retry\-\-;
> +    } while (retry);
> +
> +    close(fd);
> +    return \-1;
> +}
> +
> +static int create_new_lock(void)
> +{
> +    int fd;
> +    pthread_mutex_t cmutex = PTHREAD_MUTEX_INITIALIZER;
> +    pthread_mutexattr_t attr;
> +    int ret;
> +
> +    pthread_mutexattr_init(&attr);
> +    pthread_mutexattr_setrobust_np(&attr, PTHREAD_MUTEX_ROBUST_NP);
> +    pthread_mutex_init(&cmutex, &attr);
> +
> +    fd = open(lock_name, O_RDWR | O_CREAT | O_EXCL, S_IRUSR | S_IWUSR |
> +            S_IRGRP | S_IWGRP);
> +    if (fd < 0)
> +        return fd;
> +
> +    ret = write(fd, &cmutex, sizeof(cmutex));
I think its undefined behavior if you copy a struct pthread_mutex. You
should use mmap here too.

> +    if (ret < 0) {
> +        fprintf(stderr, "Write to %s failed: %s\\n",
> +                lock_name, strerror(errno));
> +        exit(1);
> +    }
> +    return fd;
> +}
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
