From: Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCTH 0/2] pthread_mutexattr_setrobust() and pthread_mutex_consistent()
Date: Wed, 13 Sep 2017 12:09:33 +0800
Message-ID: <CAJYFCiNJaLCcmG+M0+VtM6zk9cB6MCguz0ppt_hfGShAgEUvGw@mail.gmail.com>
References: <CAJYFCiMZN09HaHpvKgxz3mqzmcaXAWmkz=BmgOW9WVdRKOhDsg@mail.gmail.com>
 <36ab9ec0-b496-c007-c12f-065fd618e7fd@gmail.com> <CAJYFCiPM6Hy1cPF2mUBu5bVqxNX+5kvKnJZLhYzMMwuMiHCKeg@mail.gmail.com>
 <20170826210528.GA32472@HP.internal.baidu.com> <f56e1439-7a5f-3b7a-2ec4-0970fc6ad0ad@gmail.com>
 <20170913083446.GA16265@HP.internal.baidu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170913083446.GA16265-BUpDV9vzqx74NUO8LpiZZi+1pv2Z1Xu3@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

2017-09-13 16:34 GMT+08:00 Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> On Tue, Sep 12, 2017 at 02:41:29PM +0200, Michael Kerrisk (man-pages) wrote:
>> Hello Yubin,
>>
>> [...]
>> > +.B PTHREAD_MUTEX_ROBUST
>> > +can be set on a mutex attribute object so that when the owner of the mutex
>> > +dies or when the process containing such a locked mutex performs
>> > +.IR execve (2)
>> > +, any future attempts to call
>> > +.IR pthread_mutex_lock (3)
>> > +on this mutex will suceed and return
>> > +.B EOWNERDEAD
>> > +to indicate that the original owner no longer exists and the mutex is left in
>> > +an inconsistent state.
>> How did you verify the point regarding execve(2)? I don't see this
>> detailed mentioned in the standards or in the glibc source.
>
> Please see below the program I used to verify that. I haven't go into too much
> detail in the POSIX standard, though. I think I must have read it at [1] or
> somewhere else (don't remember...).
>
> And also, it is mentioned at [1] that when the process containing such a locked
> mutex unmaps the memory containing the mutex, the mutex is unlocked... I think
> this is trivial so I don't add it.
>
> Thanks,
> Yubin
>
> [1]: https://docs.oracle.com/cd/E19253-01/816-5168/pthread-mutexattr-setrobust-np-3c/index.html
>
> /************ verify-execve.c *****************/
> #include <errno.h>
> #include <pthread.h>
> #include <stdio.h>
> #include <stdlib.h>
> #include <string.h>
> #include <sys/ipc.h>
> #include <sys/shm.h>
> #include <sys/stat.h>
> #include <sys/types.h>
> #include <unistd.h>
>
> #define VERIFY_KEY 20170010
> #define ERROR_ON(func_name) \
>     fprintf(stderr, "error: " #func_name ": line[%d]: %s\n", __LINE__, strerror(errno));
>
> int main(int argc, char *argv[]) {
>     int shmid = -1;
>     struct shm *shm = NULL;
>     mode_t previous_umask = -1;
>     int ret_code = 0;
>     pthread_mutex_t *mutexp = NULL;
>     pthread_mutexattr_t attr;
>     pid_t pid = 0;
>     char *const * execve_arg = {"cat", NULL};
>     char *const * execve_env = {NULL};
>
>     previous_umask = umask(0);
>     shmid = shmget(VERIFY_KEY, sizeof(pthread_mutex_t), IPC_CREAT | 0666);
>     if (shmid < 0) {
>         ERROR_ON(shmget);
>         return -1;
>     }
>
>     shm = (struct shm *)shmat(shmid, NULL, 0);
>     if ((void *)-1 == shm) {
>         ERROR_ON(shmat);
>         return -1;
>     }
>     memset(shm, 0, sizeof(pthread_mutex_t));
>
>     printf("Successfully attached shared memory, trying to lock\n");
>
>     //initialize the lock
>     mutexp = (pthread_mutex_t *)shm;
>     pthread_mutexattr_init(&attr);
>     pthread_mutexattr_setrobust(&attr, PTHREAD_MUTEX_ROBUST);
>     pthread_mutexattr_setpshared(&attr, PTHREAD_PROCESS_SHARED);
>     pthread_mutex_init(mutexp, &attr);
>
>     ret_code = pthread_mutex_lock(mutexp);
>     if (0 == ret_code) {
>         printf("successfull acquired the lock. Going to fork/execve now\n");
>     } else {
>         ERROR_ON(pthread_mutex_lock);
>         return -1;
>     }
>
>     pid = fork();
>     if (0 == pid) {
>         printf("child would sleep for 2 sec and then lock the mutex\n");
>         sleep(2);
>         ret_code = pthread_mutex_lock(mutexp);
>         if (EOWNERDEAD == ret_code) {
>             printf("child see EOWNERDEAD returned. Verification completed\n");
>             pthread_mutex_consistent(mutexp);
>             pthread_mutex_unlock(mutexp);
>             exit(0);
>         } else {
>             printf("child see [%d] returned\n", ret_code);
>             exit(1);
>         }
>     } else {
>         printf("parent going to execve(/bin/cat)\n");
>         execve("/bin/cat", execve_arg, execve_env);

Note that execve(/bin/cat) here is on purpose: it "suspends" the
parent so that the child will not be killed because parent dies, such
that the child have enough time to check whether pthread_mutex_lock(3)
will return EOWNERDEAD. So, after executing this program, wait 2
seconds before pressing your keyboard ;-)

Yubin

>     }
>     return 0;
> }
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
