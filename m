From: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Subject: Re: For review: pthread_cleanup_push.3
Date: Tue, 25 Nov 2008 22:11:02 +0100
Message-ID: <492C69E6.3030402@domaigne.com>
References: <cfd18e0f0811140919g11e625a2i8546b3296d008dce@mail.gmail.com>	 <4927B203.3000702@domaigne.com> <cfd18e0f0811241404o1415d18bq497ff34b29502263@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0811241404o1415d18bq497ff34b29502263-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Gidday Michael,

let's see...

>>> A cancellation clean-up handler is popped from the stack
>>> and executed in the following circumstances:
>>> .IP 1. 3
>>> When a thread is canceled,
>>> all of the stacked clean-up handlers are popped and executed in
>>> the reverse of the order in which they were pushed onto the stack.
>>> .IP 2.
>>> When a thread terminates by calling
>>> .BR pthread_exit (3),
>>> all clean-up handlers are executed as described in the preceding po=
int.
>>> (Clean-up handlers are \fInot\fP called if the thread terminates by
>>> performing a
>>> .I return
>>> from the thread start function.)
>> Generally speaking, it is left to the implementation to call or not
>> clean-up handlers when a thread returns from the start function.
>=20
> Is it?  As far as I can see POSIX.1 just says the result is
> "undefined".  Does that mean it's up to the implementation?  I'm not
> sure.  Anyway< I added this text to NOTES:
>=20
>        POSIX.1  says that the effect of using return, break, continue=
,
>        or   goto   to   prematurely   leave    a    block    brackete=
d
>        pthread_cleanup_push()  and pthread_cleanup_pop() is undefined=
=2E
>        Portable applications should avoid doing this.
>=20
> Thanks for spotting this.

Tru64 implements the clean-up behavior when leaving the scope of=20
pthread_cleanup_{push,pop} with a return.

Interesting c.p.t. threads on this issue:
http://groups.google.de/group/comp.programming.threads/browse_thread/th=
read/2a1cf7d5d44989a9/1b7431bc0e265cae
http://groups.google.de/group/comp.programming.threads/browse_thread/th=
read/295beb4eb09b610e/5257747c038d5162

By the way, even recognized UNIX Author errs:
http://www.apuebook.com/errata.html (Entry #13)

>>> .nf
>>> #include <pthread.h>
>>> #include <sys/types.h>
>>> #include <stdio.h>
>>> #include <stdlib.h>
>>> #include <unistd.h>
>>> #include <errno.h>
>>>
>>> #define handle_error_en(en, msg) \\
>>>        do { errno =3D en; perror(msg); exit(EXIT_FAILURE); } while =
(0)
>>>
>>> static int done =3D 0;
>>> static int cleanup_pop_arg =3D 0;
>>> static int cnt =3D 0;
>>>
>>> static void
>>> cleanup_handler(void *arg)
>>> {
>>>    printf("Called clean\-up handler\\n");
>>>    cnt =3D 0;
>>> }
>>>
>>> static void *
>>> thread_start(void *arg)
>>> {
>>>    time_t start, curr;
>>>
>>>    printf("New thread started\\n");
>>>
>>>    pthread_cleanup_push(cleanup_handler, NULL);
>>>
>>>    curr =3D start =3D time(NULL);
>>>
>>>    while (!done) {
>>>        pthread_testcancel();           /* A cancellation point */
>>>        if (curr < time(NULL)) {
>>>            curr =3D time(NULL);
>>>            printf("cnt =3D %d\\n", cnt);  /* A cancellation point *=
/
>> printf() is not a mandatory CP (but is a CP on Linux).
>=20
> Yes, but I think no change is required -- or do you think something i=
s required.

No. Just wanted to make you aware that your program might break on=20
platform where printf() is not a CP. But I Agree: this is just=20
irrelevant here ;-)

>>>            cnt++;
>>>        }
>>>    }
>>>
>>>    pthread_cleanup_pop(cleanup_pop_arg);
>>>    return NULL;
>>> }
>>>
>>> int
>>> main(int argc, char *argv[])
>>> {
>>>    pthread_t thr;
>>>    int s;
>>>    void *res;
>>>
>>>    s =3D pthread_create(&thr, NULL, thread_start, (void *) 1);
>> Why (void*) 1 as arg?
>=20
> Because I failed to clean-up after extracting code from another examp=
le...
 >
> Fixed now.

I'd have bet...

>>>    if (s !=3D 0)
>>>        handle_error_en(s, "pthread_create");
>>>
>>>    sleep(2);           /* Allow new thread to run a while */
>>>
>>>    if (argc > 1) {
>>>        if (argc > 2)
>>>            cleanup_pop_arg =3D atoi(argv[2]);
>>>        done =3D 1;
>>>
>>>    } else {
>>>        printf("Canceling thread\\n");
>>>        s =3D pthread_cancel(thr);
>>>        if (s !=3D 0)
>>>            handle_error_en(s, "pthread_cancel");
>>>    }
>>>
>>>    s =3D pthread_join(thr, &res);
>>>    if (s !=3D 0)
>>>        handle_error_en(s, "pthread_join");
>>>
>>>    if (res =3D=3D PTHREAD_CANCELED)
>>>        printf("Thread was canceled; cnt =3D %d\\n", cnt);
>>>    else
>>>        printf("Thread terminated normally; cnt =3D %d\\n", cnt);
>>>    exit(EXIT_SUCCESS);
>>> }
>> I see a major deficiency in your code. Unless I am mistaken, the glo=
bal
>> variable <done> and <cleanup_pop_arg> are accessed from two differen=
t
>> threads.
>=20
> True.
>=20
>> Following the POSIX memory model, you need mutex to synchronize the
>> visibility.
>=20
> Please educate me about the POSIX memory model ;-).  Say some more
> here please.  Are you meaning that the change made in main are not
> guaranteed to visible in the other thread, unless I use a
> synchronization mechanism?  (or, perhaps, a barrier?)

Oh, that's a long story. Tomorrow perhaps (I just came home, and I gues=
s=20
Antje would like to spend some time with me...)

>>> .fi
>>> .SH SEE ALSO
>>> .BR pthread_cancel (3),
>>> .BR pthread_cleanup_push_defer_np (3),
>>> .BR pthread_setcancelstate (3),
>>> .BR pthread_testcancel (3),
>>> .BR pthreads (7)
>>>
>> A last comment: pthread_join(3) and pthread_cond_wait(3) are CP, so =
it would
>> be nice to describe the cancellation semantic in their respective ma=
n-page.
>=20
> Well, it would be nice to explain the CP semantics of every glibc
> function, but that's a prpoblem still to be resolved, right?

Yes, you are perfectly right.

Regarding the Pthreads functions:
- for pthread_cond_wait(3), you need a cleanup handler to release the=20
mutex associated to the condvar if the thread currently waiting on this=
=20
condvar is canceled.
- for pthread_join(3), you need to describe what happens to the thread=20
that was about being joined by the thread you just canceled.


>> Besides that, you need clean-up handler if you use deferred cancella=
tion on
>> pthread_cond_wait(3). Indeed, when this function is cancelled, the m=
utex is
>> relocked.So, you need clean-up handler to unlock the mutex.
>=20
> So, I'm unclear here: what specifically are you suggesting needs to b=
e
> changed, and on what page?

I am suggesting to describe in the man-page of pthread_cond_wait(3) wha=
t=20
does happen if a thread waiting on the condvar gets canceled.

In addition, it is perhaps a good idea to add a reference <SEE also=20
pthread_cond_wait(3)> for the present man-page.

HTH,
Lo=EFc.
--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
