From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: sched_{set,get}attr() manpage
Date: Sun, 27 Apr 2014 17:47:25 +0200
Message-ID: <CAKgNAki5BkOyckf1zxJCRs2tq-eG9bWW_yRGi3hDynz12wz+QQ@mail.gmail.com>
References: <20131217122720.950475833@infradead.org> <20131217123352.692059839@infradead.org>
 <CAHO5Pa3=+Zhg72tVfddSUvgirUyObir6atJVo4_16bVWB2Osgw@mail.gmail.com>
 <20140121153851.GZ31570@twins.programming.kicks-ass.net> <CAKgNAkgw+U44SH0wd_06ZMXaCC9nCX4NZxZHkMKUdC7E7YxBhQ@mail.gmail.com>
 <20140214161929.GL27965@twins.programming.kicks-ass.net> <53020C9D.1050208@gmail.com>
 <20140409092510.GQ11096@twins.programming.kicks-ass.net> <20140409151911.GA4041@austad.us>
 <20140409154204.GD10526@twins.programming.kicks-ass.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140409154204.GD10526-ndre7Fmf5hadTX5a5knrm8zTDFooKrT+cvkQGrU6aU0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Henrik Austad <henrik-RT+80VE2nyv1P9xLtpHBDw@public.gmane.org>, Dario Faggioli <raistlin-k2GhghHVRtY@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, =?ISO-8859-1?Q?Fr=E9d=E9ric_Weisbecker?= <fweisbec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, darren-P76s1CtE8BHQT0dZR+AlfA@public.gmane.org, johan.eker-IzeFyvvaP7pWk0Htik3J/w@public.gmane.org, p.faure-et3tyl94nDNyDzI6CaY1VQ@public.gmane.org, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Claudio Scordino <claudio-YOzL5CV4y4YG1A2ADO40+w@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Fabio Checconi <fchecconi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tommaso Cucinotta <tommaso.cucinotta-gAmJrWFzCps@public.gmane.org>, Juri Lelli <juri.lelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nicola.manica-+cHZLFJ93xAO91npARCAeA@public.gmane.org, luca.abeni-3IIOeSMMxS4@public.gmane.org, Dhaval Giani <dhaval.giani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, hgu1972-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Paul McKenney <paulmck-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Insop Song <insop.song-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, liming.wang-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org, jkacur-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Kerrisk <mtk.manpa>
List-Id: linux-man@vger.kernel.org

Hi Peter,

=46ollowing the review comments that one or two people sent, are you
planning to send in a revised version of this page? Also, is there any
test code lying about somewhere that I could play with?

Thanks,

Michael


On Wed, Apr 9, 2014 at 5:42 PM, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> w=
rote:
> On Wed, Apr 09, 2014 at 05:19:11PM +0200, Henrik Austad wrote:
>> >     The following "real-time" policies are also supported, for
>>
>> why the "'s?
>
> I borrowed those from SCHED_SETSCHEDULER(2).
>
>> >     sched_attr::sched_flags additional flags that can influence
>> >     scheduling behaviour. Currently as per Linux kernel 3.14:
>> >
>> >             SCHED_FLAG_RESET_ON_FORK - resets the scheduling polic=
y
>> >             to: (struct sched_attr){ .sched_policy =3D SCHED_OTHER=
, }
>> >             on fork().
>> >
>> >     is the only supported flag.
>
> ...
>
>> >     The flags argument should be 0.
>>
>> What about SCHED_FLAG_RESET_ON_FOR?
>
> Different flags. The one is sched_attr::flags the other is
> sched_setattr(.flags).
>
>> >     The other sched_attr fields are filled out as described in
>> >     sched_setattr().
>> >
>> >    Scheduling Policies
>> >        The  scheduler  is  the  kernel  component  that decides wh=
ich runnable
>> >        process will be executed by the CPU next.  Each process has=
 an  associ=E2=80=90
>> >        ated  scheduling  policy and a static scheduling priority, =
sched_prior=E2=80=90
>> >        ity; these are the settings that are modified by  sched_set=
scheduler().
>> >        The  scheduler  makes it decisions based on knowledge of th=
e scheduling
>> >        policy and static priority of all processes on the system.
>>
>> Isn't this last sentence redundant/sliglhtly repetitive?
>
> I borrowed that from SCHED_SETSCHEDULER(2) again.
>
>> >     SCHED_DEADLINE: Sporadic task model deadline scheduling
>> >     SCHED_DEADLINE is an implementation of GEDF (Global Earliest
>> >     Deadline First) with additional CBS (Constant Bandwidth Server=
).
>> >     The CBS guarantees that tasks that over-run their specified
>> >     budget are throttled and do not affect the correct performance
>> >     of other SCHED_DEADLINE tasks.
>> >
>> >     SCHED_DEADLINE tasks will fail FORK(2) with -EAGAIN
>> >
>> >     Setting SCHED_DEADLINE can fail with -EINVAL when admission
>> >     control tests fail.
>>
>> Perhaps add a note about the deadline-class having higher priority t=
han the
>> other classes; i.e. if a deadline-task is runnable, it will preempt =
any
>> other SCHED_(RR|FIFO) regardless of priority?
>
> Yes, good point, will do.
>
>> >    SCHED_FIFO: First In-First Out scheduling
>> >        SCHED_FIFO can only be used with static priorities higher t=
han 0, which
>> >        means that when a SCHED_FIFO processes becomes runnable, it=
 will always
>> >        immediately preempt any currently running SCHED_OTHER, SCHE=
D_BATCH,  or
>> >        SCHED_IDLE  process.  SCHED_FIFO is a simple scheduling alg=
orithm with=E2=80=90
>> >        out time slicing.  For processes scheduled under the SCHED_=
=46IFO policy,
>> >        the following rules apply:
>> >
>> >        *  A  SCHED_FIFO  process that has been preempted by anothe=
r process of
>> >           higher priority will stay at the head of the list for  i=
ts  priority
>> >           and  will resume execution as soon as all processes of h=
igher prior=E2=80=90
>> >           ity are blocked again.
>> >
>> >        *  When a SCHED_FIFO process becomes runnable, it will be  =
inserted  at
>> >           the end of the list for its priority.
>> >
>> >        *  A  call  to  sched_setscheduler()  or sched_setparam(2) =
will put the
>> >           SCHED_FIFO (or SCHED_RR) process identified by pid at th=
e  start  of
>> >           the  list  if it was runnable.  As a consequence, it may=
 preempt the
>> >           currently  running  process   if   it   has   the   same=
   priority.
>> >           (POSIX.1-2001 specifies that the process should go to th=
e end of the
>> >           list.)
>> >
>> >        *  A process calling sched_yield(2) will be put at the end =
of the list.
>>
>> How about the recent discussion regarding sched_yield(). Is this cor=
rect?
>>
>> lkml.kernel.org/r/alpine.DEB.2.02.1403312333100.14882-3cz04HxQyghMPrZFtrUIWQ@public.gmane.org=
tronix.de
>>
>> Is this the correct place to add a note explaining te potentional pi=
tfalls
>> using sched_yield?
>
> I'm not sure; there's a SCHED_YIELD(2) manpage to fill with that
> nonsense.
>
> Also; I realized I have not described the DEADLINE sched_yield()
> behaviour.
>
>> >        No other events will move a process scheduled under the SCH=
ED_FIFO pol=E2=80=90
>> >        icy in the wait list of runnable processes with equal stati=
c priority.
>> >
>> >        A SCHED_FIFO process runs until either it is blocked by an =
I/O request,
>> >        it  is  preempted  by  a  higher  priority   process,   or =
  it   calls
>> >        sched_yield(2).
>> >
>> >    SCHED_RR: Round Robin scheduling
>> >        SCHED_RR  is  a simple enhancement of SCHED_FIFO.  Everythi=
ng described
>> >        above for SCHED_FIFO also applies to SCHED_RR, except that =
each process
>> >        is  only  allowed  to  run  for  a maximum time quantum.  I=
f a SCHED_RR
>> >        process has been running for a time period equal to or long=
er than  the
>> >        time  quantum,  it will be put at the end of the list for i=
ts priority.
>> >        A SCHED_RR process that has been preempted by a higher prio=
rity process
>> >        and  subsequently  resumes execution as a running process w=
ill complete
>> >        the unexpired portion of its round robin time quantum.  The=
  length  of
>> >        the time quantum can be retrieved using sched_rr_get_interv=
al(2).
>>
>> -> Default is 0.1HZ ms
>>
>> This is a question I get form time to time, having this in the manpa=
ge
>> would be helpful.
>
> Again, brazenly stolen from SCHED_SETSCHEDULER(2); but yes. Also I'm =
not
> sure I'd call RR an enhancement of anything much at all ;-)
>
>> > ERRORS
>> >        EINVAL The scheduling policy is not one  of  the  recognize=
d  policies,
>> >               param is NULL, or param does not make sense for the =
policy.
>> >
>> >        EPERM  The calling process does not have appropriate privil=
eges.
>> >
>> >        ESRCH  The process whose ID is pid could not be found.
>> >
>> >        E2BIG  The provided storage for struct sched_attr is either=
 too
>> >               big, see sched_setattr(), or too small, see sched_ge=
tattr().
>>
>> Where's the EBUSY? It can throw this from __sched_setscheduler() whe=
n it
>> checks if there's enough bandwidth to run the task.
>
> Uhhm.. it got lost :-) /me quickly adds.



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
