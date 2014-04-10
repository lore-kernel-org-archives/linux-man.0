From: Claudio Scordino <claudio@evidence.eu.com>
Subject: Re: sched_{set,get}attr() manpage
Date: Thu, 10 Apr 2014 11:59:19 +0200
Message-ID: <53466B77.9040401@evidence.eu.com>
References: <20131217122720.950475833@infradead.org>	<20131217123352.692059839@infradead.org>	<CAHO5Pa3=+Zhg72tVfddSUvgirUyObir6atJVo4_16bVWB2Osgw@mail.gmail.com>	<20140121153851.GZ31570@twins.programming.kicks-ass.net>	<CAKgNAkgw+U44SH0wd_06ZMXaCC9nCX4NZxZHkMKUdC7E7YxBhQ@mail.gmail.com>	<20140214161929.GL27965@twins.programming.kicks-ass.net>	<53020C9D.1050208@gmail.com>	<20140409092510.GQ11096@twins.programming.kicks-ass.net>	<20140409151911.GA4041@austad.us>	<20140409154204.GD10526@twins.programming.kicks-ass.net> <20140410094737.844921df5b4a8538fb7ecb28@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140410094737.844921df5b4a8538fb7ecb28@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Juri Lelli <juri.lelli@gmail.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Henrik Austad <henrik@austad.us>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Dario Faggioli <raistlin@linux.it>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, rostedt@goodmis.org, Oleg Nesterov <oleg@redhat.com>, fweisbec@gmail.com, darren@dvhart.com, johan.eker@ericsson.com, p.faure@akatech.ch, Linux Kernel <linux-kernel@vger.kernel.org>, michael@amarulasolutions.com, fchecconi@gmail.com, tommaso.cucinotta@sssup.it, nicola.manica@disi.unitn.it, luca.abeni@unitn.it, dhaval.giani@gmail.com, hgu1972@gmail.com, Paul McKenney <paulmck@linux.vnet.ibm.com>, insop.song@gmail.com, liming.wang@windriver.com, jkacur@redhat.com, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Il 10/04/2014 09:47, Juri Lelli ha scritto:
> Hi all,
>
> On Wed, 9 Apr 2014 17:42:04 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:
>
>> On Wed, Apr 09, 2014 at 05:19:11PM +0200, Henrik Austad wrote:
>>>> 	The following "real-time" policies are also supported, for
>>> why the "'s?
>> I borrowed those from SCHED_SETSCHEDULER(2).
>>
>>>> 	sched_attr::sched_flags additional flags that can influence
>>>> 	scheduling behaviour. Currently as per Linux kernel 3.14:
>>>>
>>>> 		SCHED_FLAG_RESET_ON_FORK - resets the scheduling policy
>>>> 		to: (struct sched_attr){ .sched_policy =3D SCHED_OTHER, }
>>>> 		on fork().
>>>>
>>>> 	is the only supported flag.
>> ...
>>
>>>> 	The flags argument should be 0.
>>> What about SCHED_FLAG_RESET_ON_FOR?
>> Different flags. The one is sched_attr::flags the other is
>> sched_setattr(.flags).
>>
>>>> 	The other sched_attr fields are filled out as described in
>>>> 	sched_setattr().
>>>>
>>>>     Scheduling Policies
>>>>         The  scheduler  is  the  kernel  component  that decides w=
hich runnable
>>>>         process will be executed by the CPU next.  Each process ha=
s an  associ=E2=80=90
>>>>         ated  scheduling  policy and a static scheduling priority,=
 sched_prior=E2=80=90
>>>>         ity; these are the settings that are modified by  sched_se=
tscheduler().
>>>>         The  scheduler  makes it decisions based on knowledge of t=
he scheduling
>>>>         policy and static priority of all processes on the system.
>>> Isn't this last sentence redundant/sliglhtly repetitive?
>> I borrowed that from SCHED_SETSCHEDULER(2) again.
>>
>>>>      SCHED_DEADLINE: Sporadic task model deadline scheduling
>>>> 	SCHED_DEADLINE is an implementation of GEDF (Global Earliest
>>>> 	Deadline First) with additional CBS (Constant Bandwidth Server).
>>>> 	The CBS guarantees that tasks that over-run their specified
>>>> 	budget are throttled and do not affect the correct performance
>>>> 	of other SCHED_DEADLINE tasks.
>>>>
>>>> 	SCHED_DEADLINE tasks will fail FORK(2) with -EAGAIN
>>>>
>>>> 	Setting SCHED_DEADLINE can fail with -EINVAL when admission
>>>> 	control tests fail.
>>> Perhaps add a note about the deadline-class having higher priority =
than the
>>> other classes; i.e. if a deadline-task is runnable, it will preempt=
 any
>>> other SCHED_(RR|FIFO) regardless of priority?
>> Yes, good point, will do.
>>
>>>>     SCHED_FIFO: First In-First Out scheduling
>>>>         SCHED_FIFO can only be used with static priorities higher =
than 0, which
>>>>         means that when a SCHED_FIFO processes becomes runnable, i=
t will always
>>>>         immediately preempt any currently running SCHED_OTHER, SCH=
ED_BATCH,  or
>>>>         SCHED_IDLE  process.  SCHED_FIFO is a simple scheduling al=
gorithm with=E2=80=90
>>>>         out time slicing.  For processes scheduled under the SCHED=
_FIFO policy,
>>>>         the following rules apply:
>>>>
>>>>         *  A  SCHED_FIFO  process that has been preempted by anoth=
er process of
>>>>            higher priority will stay at the head of the list for  =
its  priority
>>>>            and  will resume execution as soon as all processes of =
higher prior=E2=80=90
>>>>            ity are blocked again.
>>>>
>>>>         *  When a SCHED_FIFO process becomes runnable, it will be =
 inserted  at
>>>>            the end of the list for its priority.
>>>>
>>>>         *  A  call  to  sched_setscheduler()  or sched_setparam(2)=
 will put the
>>>>            SCHED_FIFO (or SCHED_RR) process identified by pid at t=
he  start  of
>>>>            the  list  if it was runnable.  As a consequence, it ma=
y preempt the
>>>>            currently  running  process   if   it   has   the   sam=
e   priority.
>>>>            (POSIX.1-2001 specifies that the process should go to t=
he end of the
>>>>            list.)
>>>>
>>>>         *  A process calling sched_yield(2) will be put at the end=
 of the list.
>>> How about the recent discussion regarding sched_yield(). Is this co=
rrect?
>>>
>>> lkml.kernel.org/r/alpine.DEB.2.02.1403312333100.14882@ionos.tec.lin=
utronix.de
>>>
>>> Is this the correct place to add a note explaining te potentional p=
itfalls
>>> using sched_yield?
>> I'm not sure; there's a SCHED_YIELD(2) manpage to fill with that
>> nonsense.
>>
>> Also; I realized I have not described the DEADLINE sched_yield()
>> behaviour.
>>
> So, for SCHED_DEADLINE we currently have this behaviour:
>
> /*
>   * Yield task semantic for -deadline tasks is:
>   *
>   *   get off from the CPU until our next instance, with
>   *   a new runtime. This is of little use now, since we
>   *   don't have a bandwidth reclaiming mechanism. Anyway,
>   *   bandwidth reclaiming is planned for the future, and
>   *   yield_task_dl will indicate that some spare budget
>   *   is available for other task instances to use it.
>   */
>
> But, considering also the discussion above, I'm less sure now that's
> what we want. Still, I think we will want some way in the future to b=
e
> able to say "I'm finished with my current job, give this remaining
> runtime to someone else", like another syscall or something.

Hi Juri, hi Peter,

my two cents:

A syscall to block the task until its next instance is definitely usefu=
l.
This way, a periodic task doesn't have to sleep anymore: the kernel=20
takes care of unblocking the task at the right moment.
This would be easier (for user-level) and more efficient too.
I don't know if using sched_yield() to get this behavior is a good=20
choice or not. You have ways more experience than me :)

Best,

         Claudio
