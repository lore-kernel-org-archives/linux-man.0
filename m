From: Sebastian Andrzej Siewior <sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>
Subject: Re: [PATCH v2] add man-page for pthread_mutexattr_setrobust_np()
Date: Mon, 22 Dec 2008 11:39:53 +0100
Message-ID: <20081222103953.GB15345@Chamillionaire.breakpoint.cc>
References: <20081201213458.GA18973@Chamillionaire.breakpoint.cc> <cfd18e0f0812070844t349b6026n6e2b0a2b4826fa66@mail.gmail.com> <20081221205941.GA11805@Chamillionaire.breakpoint.cc> <36ca99e90812212332l3067e911v89de96638734ea38@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <36ca99e90812212332l3067e911v89de96638734ea38-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

* Bert Wesarg | 2008-12-22 08:32:15 [+0100]:

>> +static int open_existing_lock(void)
>> +{
>> +    int fd;
>> +    int ret;
>> +    struct stat buf;
>> +    int retry = 5;
>> +
>> +    fd = open(lock_name, O_RDWR);
>> +    if (fd < 0)
>> +        return fd;
>> +    do {
>> +        ret = fstat(fd, &buf);
>> +        if (ret < 0)
>Isn't here a close(2) missing?
yes it is. Thx.

>> +            return ret;
>> +
>> +        if (buf.st_size == sizeof(*limi_mutex))
>> +            return fd;
>> +
>> +        close(fd);
>Isn't this close(2) wrong here?
uhhh. Actually I wanted to have the open() within the do while loop. So
I move that and this will be fine then.

>> +        sleep(1);
>> +        retry\-\-;
>> +    } while (retry);
>> +
>> +    close(fd);
>> +    return \-1;
>> +}
>> +
>> +static int create_new_lock(void)
>> +{
>> +    int fd;
>> +    pthread_mutex_t cmutex = PTHREAD_MUTEX_INITIALIZER;
>> +    pthread_mutexattr_t attr;
>> +    int ret;
>> +
>> +    pthread_mutexattr_init(&attr);
>> +    pthread_mutexattr_setrobust_np(&attr, PTHREAD_MUTEX_ROBUST_NP);
>> +    pthread_mutex_init(&cmutex, &attr);
>> +
>> +    fd = open(lock_name, O_RDWR | O_CREAT | O_EXCL, S_IRUSR | S_IWUSR |
>> +            S_IRGRP | S_IWGRP);
>> +    if (fd < 0)
>> +        return fd;
>> +
>> +    ret = write(fd, &cmutex, sizeof(cmutex));
>I think its undefined behavior if you copy a struct pthread_mutex. You
>should use mmap here too.
Why should be this undefined? Is there something special about this
struct? And why should this behave different with mmap() ?

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
