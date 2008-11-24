From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: For review: pthread_cleanup_push.3
Date: Mon, 24 Nov 2008 17:04:10 -0500
Message-ID: <cfd18e0f0811241404o1415d18bq497ff34b29502263@mail.gmail.com>
References: <cfd18e0f0811140919g11e625a2i8546b3296d008dce@mail.gmail.com>
	 <4927B203.3000702@domaigne.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4927B203.3000702-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Loic,

On Sat, Nov 22, 2008 at 2:17 AM, Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org> wrote:
> Hi Michael,
>
> the last review for today.

Thanks!

[...]

>> A cancellation clean-up handler is popped from the stack
>> and executed in the following circumstances:
>> .IP 1. 3
>> When a thread is canceled,
>> all of the stacked clean-up handlers are popped and executed in
>> the reverse of the order in which they were pushed onto the stack.
>> .IP 2.
>> When a thread terminates by calling
>> .BR pthread_exit (3),
>> all clean-up handlers are executed as described in the preceding point.
>> (Clean-up handlers are \fInot\fP called if the thread terminates by
>> performing a
>> .I return
>> from the thread start function.)
>
> Generally speaking, it is left to the implementation to call or not
> clean-up handlers when a thread returns from the start function.

Is it?  As far as I can see POSIX.1 just says the result is
"undefined".  Does that mean it's up to the implementation?  I'm not
sure.  Anyway< I added this text to NOTES:

       POSIX.1  says that the effect of using return, break, continue,
       or   goto   to   prematurely   leave    a    block    bracketed
       pthread_cleanup_push()  and pthread_cleanup_pop() is undefined.
       Portable applications should avoid doing this.

Thanks for spotting this.

> The behavior you are describing is Linux specific; so perhaps you should put
> this in the NOTE, in the same way that you mentioned that
> pthread_cleanup_{push/pop} are macro on Gnu/Linux.

See above.

[...]

>> This loop executes a global variable,
>> .IR cnt ,
>> once each second.
>
> s/executes/increments/

Fixed.

[...]

>>> From the above, we see that the thread was canceled,
>
> garbage '>' ?

Not sure what happened there.  Maybe gmail's web UI got confused.

[...]

>>> From the above, we see that the clean-up handler was not executed
>>> (because
>
> garbage '>' ?

See above

>> .I cleanup_pop_arg
>> was 0), and therefore the value of
>> .I cnt
>> was not reset.
>>
>> In the next run, the main program sets a global variable that
>> causes the other thread to terminate normally,
>> and supplies a non-zero value for
>> .IR cleanup_pop_arg :
>>
>> .in +4n
>> .nf
>> $ \fB./a.out x 1\fP
>> New thread started
>> cnt = 0
>> cnt = 1
>> Called clean-up handler
>> Thread terminated normally; cnt = 0
>> .fi
>> .in
>>
>> In the above, we see that although the thread was not canceled,
>> the clean-up handler was executed, because the argument given to
>> .BR pthread_cleanup_pop ()
>> was non-zero.
>> .SS Program source
>> \&
>> .nf
>> #include <pthread.h>
>> #include <sys/types.h>
>> #include <stdio.h>
>> #include <stdlib.h>
>> #include <unistd.h>
>> #include <errno.h>
>>
>> #define handle_error_en(en, msg) \\
>>        do { errno = en; perror(msg); exit(EXIT_FAILURE); } while (0)
>>
>> static int done = 0;
>> static int cleanup_pop_arg = 0;
>> static int cnt = 0;
>>
>> static void
>> cleanup_handler(void *arg)
>> {
>>    printf("Called clean\-up handler\\n");
>>    cnt = 0;
>> }
>>
>> static void *
>> thread_start(void *arg)
>> {
>>    time_t start, curr;
>>
>>    printf("New thread started\\n");
>>
>>    pthread_cleanup_push(cleanup_handler, NULL);
>>
>>    curr = start = time(NULL);
>>
>>    while (!done) {
>>        pthread_testcancel();           /* A cancellation point */
>>        if (curr < time(NULL)) {
>>            curr = time(NULL);
>>            printf("cnt = %d\\n", cnt);  /* A cancellation point */
>
> printf() is not a mandatory CP (but is a CP on Linux).

Yes, but I think no change is required -- or do you think something is required.

>>            cnt++;
>>        }
>>    }
>>
>>    pthread_cleanup_pop(cleanup_pop_arg);
>>    return NULL;
>> }
>>
>> int
>> main(int argc, char *argv[])
>> {
>>    pthread_t thr;
>>    int s;
>>    void *res;
>>
>>    s = pthread_create(&thr, NULL, thread_start, (void *) 1);
>
> Why (void*) 1 as arg?

Because I failed to clean-up after extracting code from another example...

Fixed now.

>>    if (s != 0)
>>        handle_error_en(s, "pthread_create");
>>
>>    sleep(2);           /* Allow new thread to run a while */
>>
>>    if (argc > 1) {
>>        if (argc > 2)
>>            cleanup_pop_arg = atoi(argv[2]);
>>        done = 1;
>>
>>    } else {
>>        printf("Canceling thread\\n");
>>        s = pthread_cancel(thr);
>>        if (s != 0)
>>            handle_error_en(s, "pthread_cancel");
>>    }
>>
>>    s = pthread_join(thr, &res);
>>    if (s != 0)
>>        handle_error_en(s, "pthread_join");
>>
>>    if (res == PTHREAD_CANCELED)
>>        printf("Thread was canceled; cnt = %d\\n", cnt);
>>    else
>>        printf("Thread terminated normally; cnt = %d\\n", cnt);
>>    exit(EXIT_SUCCESS);
>> }
>
> I see a major deficiency in your code. Unless I am mistaken, the global
> variable <done> and <cleanup_pop_arg> are accessed from two different
> threads.

True.

> Following the POSIX memory model, you need mutex to synchronize the
> visibility.

Please educate me about the POSIX memory model ;-).  Say some more
here please.  Are you meaning that the change made in main are not
guaranteed to visible in the other thread, unless I use a
synchronization mechanism?  (or, perhaps, a barrier?)

>> .fi
>> .SH SEE ALSO
>> .BR pthread_cancel (3),
>> .BR pthread_cleanup_push_defer_np (3),
>> .BR pthread_setcancelstate (3),
>> .BR pthread_testcancel (3),
>> .BR pthreads (7)
>>
>
> A last comment: pthread_join(3) and pthread_cond_wait(3) are CP, so it would
> be nice to describe the cancellation semantic in their respective man-page.

Well, it would be nice to explain the CP semantics of every glibc
function, but that's a prpoblem still to be resolved, right?

> Besides that, you need clean-up handler if you use deferred cancellation on
> pthread_cond_wait(3). Indeed, when this function is cancelled, the mutex is
> relocked.So, you need clean-up handler to unlock the mutex.

So, I'm unclear here: what specifically are you suggesting needs to be
changed, and on what page?

Thanks for all these comments Loic!

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
