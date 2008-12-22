From: "Bert Wesarg" <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH v2] add man-page for pthread_mutexattr_setrobust_np()
Date: Mon, 22 Dec 2008 12:05:31 +0100
Message-ID: <36ca99e90812220305p1ed3d5aehe46025eb8fae6158@mail.gmail.com>
References: <20081201213458.GA18973@Chamillionaire.breakpoint.cc>
	 <cfd18e0f0812070844t349b6026n6e2b0a2b4826fa66@mail.gmail.com>
	 <20081221205941.GA11805@Chamillionaire.breakpoint.cc>
	 <36ca99e90812212332l3067e911v89de96638734ea38@mail.gmail.com>
	 <20081222103953.GB15345@Chamillionaire.breakpoint.cc>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081222103953.GB15345-N26foeg2n7CSQxDm3FYtNwe+0vtP5+jfMa5aj3AfGnc@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Andrzej Siewior <sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

>>> +static int create_new_lock(void)
>>> +{
>>> +    int fd;
>>> +    pthread_mutex_t cmutex = PTHREAD_MUTEX_INITIALIZER;
>>> +    pthread_mutexattr_t attr;
>>> +    int ret;
>>> +
>>> +    pthread_mutexattr_init(&attr);
>>> +    pthread_mutexattr_setrobust_np(&attr, PTHREAD_MUTEX_ROBUST_NP);
>>> +    pthread_mutex_init(&cmutex, &attr);
>>> +
>>> +    fd = open(lock_name, O_RDWR | O_CREAT | O_EXCL, S_IRUSR | S_IWUSR |
>>> +            S_IRGRP | S_IWGRP);
>>> +    if (fd < 0)
>>> +        return fd;
>>> +
>>> +    ret = write(fd, &cmutex, sizeof(cmutex));
>>I think its undefined behavior if you copy a struct pthread_mutex. You
>>should use mmap here too.
> Why should be this undefined? Is there something special about this
> struct? And why should this behave different with mmap() ?
If you would use mmap, you would initialize the mutex inside the
mmaped area, i.e. directly in the file.

To the copying:

Short answer: http://www.lambdacs.com/cpt/FAQ.html#Q15

Slightly longer:

pthread_mutex_t m1, m2;
pthread_mutex_init(&m1, NULL);
pthread_mutex_lock(&m1);
m2 = m1;
pthread_mutex_unlock(&m2);

How can you be sure, that you have unlocked m1 here?

Yes, you throw away the cmutex after returning from the function and
the copy inside the file is the only one left. I still think such code
should not be in a documentation.

Bert
>
> Sebastian
>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
