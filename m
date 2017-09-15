From: Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCTH 0/2] pthread_mutexattr_setrobust() and
 pthread_mutex_consistent()
Date: Fri, 15 Sep 2017 16:29:53 +0800
Message-ID: <20170915082938.GA317@HP.internal.baidu.com>
References: <CAJYFCiMZN09HaHpvKgxz3mqzmcaXAWmkz=BmgOW9WVdRKOhDsg@mail.gmail.com>
 <36ab9ec0-b496-c007-c12f-065fd618e7fd@gmail.com>
 <CAJYFCiPM6Hy1cPF2mUBu5bVqxNX+5kvKnJZLhYzMMwuMiHCKeg@mail.gmail.com>
 <20170826210528.GA32472@HP.internal.baidu.com>
 <f56e1439-7a5f-3b7a-2ec4-0970fc6ad0ad@gmail.com>
 <20170913083446.GA16265@HP.internal.baidu.com>
 <CAKgNAkh4iAkz8oL70S3dzztF_oZy+fXohS4OZ2nyySAaAMGX3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkh4iAkz8oL70S3dzztF_oZy+fXohS4OZ2nyySAaAMGX3w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Sep 13, 2017 at 02:28:10PM +0200, Michael Kerrisk (man-pages) wrote:
> Hello Yubin,
> 
> On 13 September 2017 at 10:34, Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Tue, Sep 12, 2017 at 02:41:29PM +0200, Michael Kerrisk (man-pages) wrote:
> >> Hello Yubin,
> >>
> >> [...]
> >> > +.B PTHREAD_MUTEX_ROBUST
> >> > +can be set on a mutex attribute object so that when the owner of the mutex
> >> > +dies or when the process containing such a locked mutex performs
> >> > +.IR execve (2)
> >> > +, any future attempts to call
> >> > +.IR pthread_mutex_lock (3)
> >> > +on this mutex will suceed and return
> >> > +.B EOWNERDEAD
> >> > +to indicate that the original owner no longer exists and the mutex is left in
> >> > +an inconsistent state.
> >> How did you verify the point regarding execve(2)? I don't see this
> >> detailed mentioned in the standards or in the glibc source.
> >
> > Please see below the program I used to verify that. I haven't go into too much
> > detail in the POSIX standard, though. I think I must have read it at [1] or
> > somewhere else (don't remember...).
> 
> Thanks for the details and example program.
> 
> So, I see the kernel code that deals with this now: in
> fs/exec.c::exec_mmap(), there is a call to mm_release() which in turn
> calls exit_robust_list()
> 
> So, this detail isn't in POSIX. I think what I will do is move
> discussion of that point into the NOTES.
> 
> > And also, it is mentioned at [1] that when the process containing such a locked
> > mutex unmaps the memory containing the mutex, the mutex is unlocked... I think
> > this is trivial so I don't add it.
> 
> It also appears not to be true on Linux, at least in some short tests
> I just did.[1] See my modified version of your program, below. Also
> when looking at the kernel code, I can see no call to mm_release()
> that would lead to this behavior.

[snip]
>
> 
> [1] And I wonder if the Solaris documentation is even correct, since,
> if we are talking about a shared anonymous mapping, the memory would
> not be released until *all* processes have unmapped the memory

Yes you are right. The lock will not be unlocked automatically. Instead, it
will deadlock if the child try to lock it. See the modified program
below (your snippet contains some logical problems, so I modified it a little
bit)

Yubin
 
/************ verify-execve.c *****************/
#define _POSIX_C_SOURCE 200809L
#define _GNU_SOURCE
#include <errno.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ipc.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

#define MEMSIZE 4096

#define ERROR_ON(func_name) \
    fprintf(stderr, "error: " #func_name ": line[%d]: %s\n", __LINE__, strerror(errno));

int main(int argc, char *argv[]) {
    struct shm *shm = NULL;
    int ret_code = 0;
    pthread_mutex_t *mutexp = NULL;
    pthread_mutexattr_t attr;
    int status = -1;
    pid_t pid = 0;

    shm = mmap(NULL, MEMSIZE, PROT_READ | PROT_WRITE,
               MAP_ANONYMOUS | MAP_SHARED,-1, 0);
    if ((void *)-1 == shm) {
        ERROR_ON(shmat);
        return -1;
    }
    memset(shm, 0, sizeof(pthread_mutex_t));

    printf("Successfully attached shared memory, trying to lock\n");

    //initialize the lock
    mutexp = (pthread_mutex_t *)shm;
    pthread_mutexattr_init(&attr);
    pthread_mutexattr_setrobust(&attr, PTHREAD_MUTEX_ROBUST);
    pthread_mutexattr_setpshared(&attr, PTHREAD_PROCESS_SHARED);
    pthread_mutex_init(mutexp, &attr);

    pid = fork();
    if (0 == pid) {
        sleep(3);
        printf("Child about to call pthread_mutex-Lock()\n");
        ret_code = pthread_mutex_lock(mutexp);
        if (EOWNERDEAD == ret_code) {
            printf("child see EOWNERDEAD returned. Verification completed\n");
            pthread_mutex_consistent(mutexp);
            pthread_mutex_unlock(mutexp);
            exit(0);
        } else {
            printf("child see [%d] returned\n", ret_code);
            exit(1);
        }
    } else {
        ret_code = pthread_mutex_lock(mutexp);
        if (0 == ret_code) {
            printf("parent successfully acquired the lock\n");
        } else {
            ERROR_ON(pthread_mutex_lock);
            return -1;
        }

        if (munmap(shm, MEMSIZE) == -1)
            ERROR_ON(munmap);
        printf("Parent has unmapped the memory, waiting for its child\n");
        wait(&status);
        printf("Parent about to exit\n");
        exit(0);
    }
    return 0;
}
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
