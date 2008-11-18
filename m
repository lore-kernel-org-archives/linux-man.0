From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: For review: pthread_setschedparam.3
Date: Tue, 18 Nov 2008 08:50:23 -0500
Message-ID: <4922C81F.6070907@gmail.com>
References: <cfd18e0f0811060945n3224567du5e98adecb074b5e@mail.gmail.com> <491F3AA6.6050303@domaigne.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <491F3AA6.6050303-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, "brian m. carlson" <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, =?ISO-8859-1?Q?Loic_Domaign=E9?= <loic-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>, Stefan Puiu <stefanpuiuro-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Loic,

Okay, here I'll revisit this piece.

>> The returned priority value is that set by the most recent
>> .BR pthread_setschedparam (),
>> .BR pthread_setschedprio (3),
>> or
>> .BR pthread_create (3)
>> call that affected
>> .IR thread .
> 
> Hmm, that's perfectly right from a POSIX point of view. Knowing how 
> Linux implements threads, I have been interested about the effect of 
> sched_setscheduler() on a MT-process (since NPTL uses 1:1 model, this 
> should be a NOP).

Why should it be a NOP?

Thanks,

Michael

> I tested the following program against the stable glibc-2.7... 
> Apparently, it seems that sched_setscheduler() might affect the main 
> thread priority as well.
> 
> -- 
> #include <stdio.h>
> #include <pthread.h>
> #include <sched.h>
> #include <unistd.h>
> 
> void
> print_schedinfo(const char* thread)
> {
>    struct sched_param param;
>    int policy;
>    int rc;
> 
>    rc = pthread_getschedparam(pthread_self(), &policy, &param);
>    if (rc!=0) printf("##%d\n", rc);
>    printf("%s > Policy=%s, prio=%d\n",
>           thread,
>           (policy==SCHED_FIFO) ? "FIFO" : "*NOT* FIFO",
>       param.sched_priority);
> }
> 
> // dummy thread...
> //
> void*
> thread(void* ignore)
> {
>    sleep(3);
>    print_schedinfo("dummy thread");
>    pthread_exit(NULL);
> }
> 
> int
> main()
> {
>    struct sched_param param;
>    int    policy;
>    int    rc;
>    pthread_t tid;
> 
>    // create dummy thread
>    //
>    pthread_create(&tid, NULL, thread, NULL);
>    param.sched_priority=1;
> 
>    // now we shall change the process policy/prio using
>    // sched_setscheduler().
>    // Normally: this should be a NOP. But due to the way Linux
>    // implements threads, I am suspecting that this shall affect
>    // the main thread
>    //
>    rc=sched_setscheduler(0, SCHED_FIFO, &param);
>    if (rc==-1) printf("sched_setscheduler FAILED\n");
> 
>    // print my scheduling info
>    //
>    print_schedinfo("main");
> 
>    // join dummy thread and terminate
>    //
>    pthread_join(tid, NULL);
>    return 0;
> }


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
