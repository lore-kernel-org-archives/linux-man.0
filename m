From: Juri Lelli <juri.lelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: sched_{set,get}attr() manpage
Date: Thu, 10 Apr 2014 09:47:37 +0200
Message-ID: <20140410094737.844921df5b4a8538fb7ecb28@gmail.com>
References: <20131217122720.950475833@infradead.org>
	<20131217123352.692059839@infradead.org>
	<CAHO5Pa3=+Zhg72tVfddSUvgirUyObir6atJVo4_16bVWB2Osgw@mail.gmail.com>
	<20140121153851.GZ31570@twins.programming.kicks-ass.net>
	<CAKgNAkgw+U44SH0wd_06ZMXaCC9nCX4NZxZHkMKUdC7E7YxBhQ@mail.gmail.com>
	<20140214161929.GL27965@twins.programming.kicks-ass.net>
	<53020C9D.1050208@gmail.com>
	<20140409092510.GQ11096@twins.programming.kicks-ass.net>
	<20140409151911.GA4041@austad.us>
	<20140409154204.GD10526@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140409154204.GD10526-ndre7Fmf5hadTX5a5knrm8zTDFooKrT+cvkQGrU6aU0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Henrik Austad <henrik-RT+80VE2nyv1P9xLtpHBDw@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dario Faggioli <raistlin-k2GhghHVRtY@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, fweisbec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, darren-P76s1CtE8BHQT0dZR+AlfA@public.gmane.org, johan.eker-IzeFyvvaP7pWk0Htik3J/w@public.gmane.org, p.faure-et3tyl94nDNyDzI6CaY1VQ@public.gmane.org, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, claudio-YOzL5CV4y4YG1A2ADO40+w@public.gmane.org, michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, fchecconi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tommaso.cucinotta-gAmJrWFzCps@public.gmane.org, nicola.manica-+cHZLFJ93xAO91npARCAeA@public.gmane.org, luca.abeni-3IIOeSMMxS4@public.gmane.org, dhaval.giani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hgu1972-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Paul McKenney <paulmck-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, insop.song-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, liming.wang-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org, jkacur-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi all,

On Wed, 9 Apr 2014 17:42:04 +0200
Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:

> On Wed, Apr 09, 2014 at 05:19:11PM +0200, Henrik Austad wrote:
> > > 	The following "real-time" policies are also supported, for
> >=20
> > why the "'s?
>=20
> I borrowed those from SCHED_SETSCHEDULER(2).
>=20
> > > 	sched_attr::sched_flags additional flags that can influence
> > > 	scheduling behaviour. Currently as per Linux kernel 3.14:
> > >=20
> > > 		SCHED_FLAG_RESET_ON_FORK - resets the scheduling policy
> > > 		to: (struct sched_attr){ .sched_policy =3D SCHED_OTHER, }
> > > 		on fork().
> > >=20
> > > 	is the only supported flag.
>=20
> ...
>=20
> > > 	The flags argument should be 0.
> >=20
> > What about SCHED_FLAG_RESET_ON_FOR?
>=20
> Different flags. The one is sched_attr::flags the other is
> sched_setattr(.flags).
>=20
> > > 	The other sched_attr fields are filled out as described in
> > > 	sched_setattr().
> > >=20
> > >    Scheduling Policies
> > >        The  scheduler  is  the  kernel  component  that decides w=
hich runnable
> > >        process will be executed by the CPU next.  Each process ha=
s an  associ=E2=80=90
> > >        ated  scheduling  policy and a static scheduling priority,=
 sched_prior=E2=80=90
> > >        ity; these are the settings that are modified by  sched_se=
tscheduler().
> > >        The  scheduler  makes it decisions based on knowledge of t=
he scheduling
> > >        policy and static priority of all processes on the system.
> >=20
> > Isn't this last sentence redundant/sliglhtly repetitive?
>=20
> I borrowed that from SCHED_SETSCHEDULER(2) again.
>=20
> > >     SCHED_DEADLINE: Sporadic task model deadline scheduling
> > > 	SCHED_DEADLINE is an implementation of GEDF (Global Earliest
> > > 	Deadline First) with additional CBS (Constant Bandwidth Server).
> > > 	The CBS guarantees that tasks that over-run their specified
> > > 	budget are throttled and do not affect the correct performance
> > > 	of other SCHED_DEADLINE tasks.
> > >=20
> > > 	SCHED_DEADLINE tasks will fail FORK(2) with -EAGAIN
> > >=20
> > > 	Setting SCHED_DEADLINE can fail with -EINVAL when admission
> > > 	control tests fail.
> >=20
> > Perhaps add a note about the deadline-class having higher priority =
than the=20
> > other classes; i.e. if a deadline-task is runnable, it will preempt=
 any=20
> > other SCHED_(RR|FIFO) regardless of priority?
>=20
> Yes, good point, will do.
>=20
> > >    SCHED_FIFO: First In-First Out scheduling
> > >        SCHED_FIFO can only be used with static priorities higher =
than 0, which
> > >        means that when a SCHED_FIFO processes becomes runnable, i=
t will always
> > >        immediately preempt any currently running SCHED_OTHER, SCH=
ED_BATCH,  or
> > >        SCHED_IDLE  process.  SCHED_FIFO is a simple scheduling al=
gorithm with=E2=80=90
> > >        out time slicing.  For processes scheduled under the SCHED=
_FIFO policy,
> > >        the following rules apply:
> > >=20
> > >        *  A  SCHED_FIFO  process that has been preempted by anoth=
er process of
> > >           higher priority will stay at the head of the list for  =
its  priority
> > >           and  will resume execution as soon as all processes of =
higher prior=E2=80=90
> > >           ity are blocked again.
> > >=20
> > >        *  When a SCHED_FIFO process becomes runnable, it will be =
 inserted  at
> > >           the end of the list for its priority.
> > >=20
> > >        *  A  call  to  sched_setscheduler()  or sched_setparam(2)=
 will put the
> > >           SCHED_FIFO (or SCHED_RR) process identified by pid at t=
he  start  of
> > >           the  list  if it was runnable.  As a consequence, it ma=
y preempt the
> > >           currently  running  process   if   it   has   the   sam=
e   priority.
> > >           (POSIX.1-2001 specifies that the process should go to t=
he end of the
> > >           list.)
> > >=20
> > >        *  A process calling sched_yield(2) will be put at the end=
 of the list.
> >=20
> > How about the recent discussion regarding sched_yield(). Is this co=
rrect?
> >=20
> > lkml.kernel.org/r/alpine.DEB.2.02.1403312333100.14882-3cz04HxQyghBDYKCnqQNtA@public.gmane.org=
utronix.de
> >=20
> > Is this the correct place to add a note explaining te potentional p=
itfalls=20
> > using sched_yield?
>=20
> I'm not sure; there's a SCHED_YIELD(2) manpage to fill with that
> nonsense.
>=20
> Also; I realized I have not described the DEADLINE sched_yield()
> behaviour.
>=20

So, for SCHED_DEADLINE we currently have this behaviour:

/*
 * Yield task semantic for -deadline tasks is:
 *
 *   get off from the CPU until our next instance, with
 *   a new runtime. This is of little use now, since we
 *   don't have a bandwidth reclaiming mechanism. Anyway,
 *   bandwidth reclaiming is planned for the future, and
 *   yield_task_dl will indicate that some spare budget
 *   is available for other task instances to use it.
 */

But, considering also the discussion above, I'm less sure now that's
what we want. Still, I think we will want some way in the future to be
able to say "I'm finished with my current job, give this remaining
runtime to someone else", like another syscall or something.

Thanks,

- Juri

> > >        No other events will move a process scheduled under the SC=
HED_FIFO pol=E2=80=90
> > >        icy in the wait list of runnable processes with equal stat=
ic priority.
> > >=20
> > >        A SCHED_FIFO process runs until either it is blocked by an=
 I/O request,
> > >        it  is  preempted  by  a  higher  priority   process,   or=
   it   calls
> > >        sched_yield(2).
> > >=20
> > >    SCHED_RR: Round Robin scheduling
> > >        SCHED_RR  is  a simple enhancement of SCHED_FIFO.  Everyth=
ing described
> > >        above for SCHED_FIFO also applies to SCHED_RR, except that=
 each process
> > >        is  only  allowed  to  run  for  a maximum time quantum.  =
If a SCHED_RR
> > >        process has been running for a time period equal to or lon=
ger than  the
> > >        time  quantum,  it will be put at the end of the list for =
its priority.
> > >        A SCHED_RR process that has been preempted by a higher pri=
ority process
> > >        and  subsequently  resumes execution as a running process =
will complete
> > >        the unexpired portion of its round robin time quantum.  Th=
e  length  of
> > >        the time quantum can be retrieved using sched_rr_get_inter=
val(2).
> >=20
> > -> Default is 0.1HZ ms
> >=20
> > This is a question I get form time to time, having this in the manp=
age=20
> > would be helpful.
>=20
> Again, brazenly stolen from SCHED_SETSCHEDULER(2); but yes. Also I'm =
not
> sure I'd call RR an enhancement of anything much at all ;-)
>=20
> > > ERRORS
> > >        EINVAL The scheduling policy is not one  of  the  recogniz=
ed  policies,
> > >               param is NULL, or param does not make sense for the=
 policy.
> > >=20
> > >        EPERM  The calling process does not have appropriate privi=
leges.
> > >=20
> > >        ESRCH  The process whose ID is pid could not be found.
> > >=20
> > >        E2BIG  The provided storage for struct sched_attr is eithe=
r too
> > >               big, see sched_setattr(), or too small, see sched_g=
etattr().
> >=20
> > Where's the EBUSY? It can throw this from __sched_setscheduler() wh=
en it=20
> > checks if there's enough bandwidth to run the task.
>=20
> Uhhm.. it got lost :-) /me quickly adds.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
