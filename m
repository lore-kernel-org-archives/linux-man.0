From: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Subject: sched_setscheduler.3 and threads (was: For review: pthread_setschedparam.3)
Date: Mon, 24 Nov 2008 22:09:37 +0100
Message-ID: <492B1811.3080001@domaigne.com>
References: <cfd18e0f0811060945n3224567du5e98adecb074b5e@mail.gmail.com> <491F3AA6.6050303@domaigne.com> <4922C81F.6070907@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4922C81F.6070907-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, "brian m. carlson" <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Stefan Puiu <stefanpuiuro-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Michael,

I've investigated the effects of sched_setscheduler() on threads. Thing=
s=20
seem worse than I expected.

AFAICS, you can change scheduling attribute of a thread using=20
sched_setscheduler(3) without the changes being reflected in the=20
thread's scheduling parameters as retrieved with pthread_getschedparam(=
3).

Output from the schedtest program below:

<copy>

main   > call sched_setscheduler(0,FIFO,1)
main   > pthread_getschedparam() : Policy=3DFIFO, prio=3D1
main   > sched_getscheduler()    : Policy=3DFIFO, prio=3D1
-----
Thread > pthread_getschedparam() : Policy=3D*NOT* FIFO, prio=3D0
Thread > sched_getscheduler()    : Policy=3D*NOT* FIFO, prio=3D0
-----
Thread > call sched_setscheduler(0,FIFO,2)
Thread > pthread_getschedparam() : Policy=3D*NOT* FIFO, prio=3D0
Thread > sched_getscheduler()    : Policy=3DFIFO, prio=3D2
-----
main   > pthread_getschedparam() : Policy=3DFIFO, prio=3D1
main   > sched_getscheduler()    : Policy=3DFIFO, prio=3D1
-----

</copy>

Let's hope that my program is broken!

A+,
Lo=EFc
--


/**********************************************************************=
*****/
/* schedtest.c- test interaction between sched_setscheduler and threads
/**********************************************************************=
*****/
/*
  * compile with: cc -pthread schedtest.c -o schedtest
  */
#include <errno.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

/**********************************************************************=
/
/* our macro for errors checking                                      *=
/
/**********************************************************************=
/
#define COND_CHECK(func, cond, errv) \
if ( (cond) ) \
{ \
    fprintf(stderr, "\n[CHECK FAILED at %s:%d]\n| %s(...)=3D%d (%s)\n\n=
",\
                  __FILE__,__LINE__,func,errv,strerror(errv)); \
                     exit(EXIT_FAILURE); \
}

#define UnixCheck(func,rc)    COND_CHECK(func, (rc=3D=3D-1), errno)
#define PthreadCheck(func,rc) COND_CHECK(func,(rc!=3D0), rc)

void
sched_fifo(const char* thr, int prio)
{
    struct sched_param param;
    int rc;

    printf("%s > call sched_setscheduler(0,FIFO,%d)\n", thr, prio);
    param.sched_priority =3D prio;
    rc =3D sched_setscheduler(0, SCHED_FIFO, &param);
    UnixCheck("sched_setscheduler", rc);
}

void
sched_info(const char* thr)
{
    struct sched_param param;
    int    policy;
    int    rc;

    rc =3D pthread_getschedparam(pthread_self(), &policy, &param);
    PthreadCheck("pthread_getschedparam", rc);
    printf("%s > pthread_getschedparam() : Policy=3D%s, prio=3D%d\n",
           thr,
           (policy=3D=3DSCHED_FIFO) ? "FIFO" : "*NOT* FIFO",
	  param.sched_priority);
    policy =3D sched_getscheduler(0);
    UnixCheck("sched_getscheduler", policy);
    rc =3D sched_getparam(0, &param);
    UnixCheck("sched_getparam", rc);
    printf("%s > sched_getscheduler()    : Policy=3D%s, prio=3D%d\n",
           thr,
           (policy=3D=3DSCHED_FIFO) ? "FIFO" : "*NOT* FIFO",
	  param.sched_priority);
    printf("-----\n");
}

void*
thread(void* ignore)
{
    sleep(2);
    sched_info("Thread");
    sched_fifo("Thread", 2);
    sched_info("Thread");
    return NULL;
}

int
main()
{
    pthread_t tid;
    int       rc;

    rc =3D pthread_create(&tid, NULL, thread, NULL);
    PthreadCheck("pthread_create", rc);
    sched_fifo("main  ", 1);
    sched_info("main  ");
    rc =3D pthread_join(tid, NULL);
    PthreadCheck("pthread_join", rc);
    sched_info("main  ");
    return EXIT_SUCCESS;
}
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
