From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: For review: pthread_setschedparam.3
Date: Mon, 17 Nov 2008 13:23:49 -0500
Message-ID: <cfd18e0f0811171023l38ae6a0ci1bbece2dcc9e441d@mail.gmail.com>
References: <cfd18e0f0811060945n3224567du5e98adecb074b5e@mail.gmail.com>
	 <491F3AA6.6050303@domaigne.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <491F3AA6.6050303-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, "brian m. carlson" <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, =?ISO-8859-1?Q?Loic_Domaign=E9?= <loic-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>, Stefan Puiu <stefanpuiuro-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Lo=EFc,

On Sat, Nov 15, 2008 at 4:09 PM, Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org> wrot=
e:
> Hallo Michael,
>
> enclosed my review comments.


Thanks for yet another review!

[...]

>> .TH PTHREAD_SETSCHEDPARAM 3 2008-11-07 "Linux" "Linux Programmer's M=
anual"
>> .SH NAME
>> pthread_setschedparam, pthread_setschedparam \- set/get
>> scheduling policy and parameters of a thread
>> .SH SYNOPSIS
>> .nf
>> .B #include <pthread.h>
>>
>> .BI "pthread_setschedparam(pthread_t " thread ", int " policy ,
>> .BI "                      const struct sched_param *" param );
>> .BI "pthread_getschedparam(pthread_t " thread ", int *" policy ,
>> .BI "                      struct sched_param *" param );
>> .sp
>> Compile and link with \fI\-pthread\fP.
>
> One question regarding the synopsis. Is there a reason with the "rest=
rict"
> keyword is not used for pthread_getschedparam(). Accordingly to
> /usr/include/pthread.h:

The only real reason is that to date *no* man pages include it.

> extern int pthread_getschedparam (pthread_t __target_thread,
>                                  int *__restrict __policy,
>                                  struct sched_param *__restrict __par=
am);
>
>
[...]

>> .I policy
>> specifies the new scheduling policy for
>> .IR thread .
>> The supported values for
>> .IR policy ,
>> and their semantics, are described in
>> .BR sched_setscheduler (2).
>> .\" FIXME . pthread_setschedparam() places no restriction on the pol=
icy,
>> .\" but pthread_attr_setschedpolicy() restricts policy to RR/FIFO/OT=
HER
>> .\" http://sourceware.org/bugzilla/show_bug.cgi?id=3D7013
>
> Perhaps it's my poor english... But why "new scheduling policy"? I ma=
y just
> want to change the priority, within the same scheduling policy...

I see what you are saying, but I'm not sure this matters too much --
yes, the new policy can be the same policy as the old.

>> The structure pointed to by
>> .I param
>> specifies the new scheduling parameters for
>> .IR thread .
>
> Similar comment here. I may just want to change the scheduling policy=
,
> without changing the priority. ( I admit, this one is seldom compared=
 to the
> previous one ).

Same comment as above ;-).

>> Scheduling parameters are maintained in the following structure:
>>
>> .in +4n
>> .nf
>> struct sched_param {
>>    int sched_priority;     /* Scheduling priority */
>> };
>> .fi
>> .in
>>
>> As can be seen, only one scheduling parameter is supported
>> (this is the only parameter specified by POSIX.1-2001.)
>
> No, it think this is not correct? If a system support SCHED_SPORADIC,=
 then
> the sched_param structure has additional fields.

Yes.  Strictly speaking you are right.  Of course, Linux doesn't
support SCHED_SPORADIC.  I think the simplest solution is just to
remove the part "(this is the only parameter specified by
POSIX.1-2001.)", and I've also done that in
pthread_attr_setschedparam.3.

[...]

>> The
>> .BR pthread_getschedparam ()
>> function returns the scheduling policy and parameters of the thread
>> .IR thread ,
>> in the buffers pointed to by
>> .I policy
>> and
>> .IR param ,
>> respectively.
>> The returned priority value is that set by the most recent
>> .BR pthread_setschedparam (),
>> .BR pthread_setschedprio (3),
>> or
>> .BR pthread_create (3)
>> call that affected
>> .IR thread .
>
> Hmm, that's perfectly right from a POSIX point of view. Knowing how L=
inux
> implements threads, I have been interested about the effect of
> sched_setscheduler() on a MT-process (since NPTL uses 1:1 model, this=
 should
> be a NOP).
>
> I tested the following program against the stable glibc-2.7... Appare=
ntly,
> it seems that sched_setscheduler() might affect the main thread prior=
ity as
> well.
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
>   struct sched_param param;
>   int policy;
>   int rc;
>
>   rc =3D pthread_getschedparam(pthread_self(), &policy, &param);
>   if (rc!=3D0) printf("##%d\n", rc);
>   printf("%s > Policy=3D%s, prio=3D%d\n",
>          thread,
>          (policy=3D=3DSCHED_FIFO) ? "FIFO" : "*NOT* FIFO",
>          param.sched_priority);
> }
>
> // dummy thread...
> //
> void*
> thread(void* ignore)
> {
>   sleep(3);
>   print_schedinfo("dummy thread");
>   pthread_exit(NULL);
> }
>
> int
> main()
> {
>   struct sched_param param;
>   int    policy;
>   int    rc;
>   pthread_t tid;
>
>   // create dummy thread
>   //
>   pthread_create(&tid, NULL, thread, NULL);
>   param.sched_priority=3D1;
>
>   // now we shall change the process policy/prio using
>   // sched_setscheduler().
>   // Normally: this should be a NOP. But due to the way Linux
>   // implements threads, I am suspecting that this shall affect
>   // the main thread
>   //
>   rc=3Dsched_setscheduler(0, SCHED_FIFO, &param);
>   if (rc=3D=3D-1) printf("sched_setscheduler FAILED\n");
>
>   // print my scheduling info
>   //
>   print_schedinfo("main");
>
>   // join dummy thread and terminate
>   //
>   pthread_join(tid, NULL);
>   return 0;
> }

I have to look into this further.

>> The returned priority does not reflect any temporary priority adjust=
ments
>> as a result of calls to any priority inheritance or
>> priority ceiling functions (see, for example,
>> .BR pthread_mutexattr_setprioceiling (3)
>> and
>> .BR pthread_mutexattr_setprotocol (3)).
>> .\" FIXME . nptl/pthread_setschedparam.c has the following
>> .\"   /* If the thread should have higher priority because of some
>> .\"      PTHREAD_PRIO_PROTECT mutexes it holds, adjust the priority.=
 */
>> .\" Eventually (perhaps after writing the mutexattr pages), we
>> .\" may want to add something on the topic to this page.
>
> If I understood correctly, the thread can't lower the priority that h=
e has
> resulting from priority inheritance/ceiling. That makes perfectly sen=
se to
> me, otherwise this could defeat the purpose of such schemes, among ot=
hers
> avoiding priority inversion.

Okay.  I may revise the text later (once I write the other pages).

[...]

>> .B ESRCH
>> No thread with the ID
>> .I thread
>> could be found.
>
> Should the ERSCH error description be consistent across pthread_* lin=
ux
> man-pages? See for instance pthread_attr_setaffinity_np().

Yes, I haven't been too consistent on that point.  I changed the ESRCH
text in all the pages to be just:

"No thread with the ID _thread_ could be found."

>> .PP
>> .BR pthread_setschedparam ()
>> may additionally fail with the following errors:
>> .TP
>> .B EINVAL
>> .I policy
>> is not a recognized policy, or
>> .I param
>> does not make sense for the
>> .IR policy .
>
> I got troubled by the "may additionally", as "may" has a particular m=
eaning
> in POSIX.1...
>
> But I guess, you just want to express that pthread_setschedparam() sh=
all
> fail if the policy or the param is invalid, right?

Yes.

[...]

>> .PP
>> POSIX.1-2001 also documents an
>> .B ENOTSUP
>> ("attempt was made to set the policy or scheduling parameters
>> to an unsupported value") error for
>> .BR pthread_setschedparam ().
>
> ... but it doesn't seem to be used by Linux/Glibc...

Exactly.  That's why I don't list it in the ERRORS proper, just as an
add-on sentence.

[...]

>> .SH EXAMPLE

[...]

>> The next run is the same as the previous,
>> except that the inherit scheduler attribute is set to
>> .BR PTHREAD_INHERIT_SCHED ,
>> meaning that threads created using the thread attributes object shou=
ld
>> ignore the scheduling attributes specified in the attributes object
>> and instead take their scheduling attributes from the creating threa=
d.
>>
>> .in +4n
>> .nf
>> # \fB./a.out \-mf10 \-ar20 \-i i\fP
>> Scheduler settings of main thread
>>    policy=3DSCHED_FIFO, priority=3D10
>>
>> Scheduler settings in \(aqattr\(aq
>>    policy=3DSCHED_RR, priority=3D20
>>    inheritsched is INHERIT
>>
>> Scheduler attributes of new thread
>>    policy=3DSCHED_FIFO, priority=3D10
>> .fi
>> .in
>>
>> In the above output, one can see that the scheduling policy and prio=
rity
>> were taken from the creating thread,
>> rather than the thread attributes object.
>
> A classical trap is that people don't set inheritsched to explicit, a=
nd by
> default it is inherit... You could illustrate this by the following e=
xample:
> ./a.out -mf10 -ar20.
>
> ( I don't know however if it is the right place to speak about such t=
hings
> ).

I added a sentence noting that if we omit the "-i i" option in the
second run, then the result would be the same, since the default is
INHERIT.

[...]

Thanks for the review Loic!

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
=46ound a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
