From: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: sched_{set,get}attr() manpage
Date: Wed, 9 Apr 2014 17:42:04 +0200
Message-ID: <20140409154204.GD10526@twins.programming.kicks-ass.net>
References: <20131217122720.950475833@infradead.org>
 <20131217123352.692059839@infradead.org>
 <CAHO5Pa3=+Zhg72tVfddSUvgirUyObir6atJVo4_16bVWB2Osgw@mail.gmail.com>
 <20140121153851.GZ31570@twins.programming.kicks-ass.net>
 <CAKgNAkgw+U44SH0wd_06ZMXaCC9nCX4NZxZHkMKUdC7E7YxBhQ@mail.gmail.com>
 <20140214161929.GL27965@twins.programming.kicks-ass.net>
 <53020C9D.1050208@gmail.com>
 <20140409092510.GQ11096@twins.programming.kicks-ass.net>
 <20140409151911.GA4041@austad.us>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140409151911.GA4041-RT+80VE2nyv1P9xLtpHBDw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Henrik Austad <henrik-RT+80VE2nyv1P9xLtpHBDw@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dario Faggioli <raistlin-k2GhghHVRtY@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, fweisbec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, darren-P76s1CtE8BHQT0dZR+AlfA@public.gmane.org, johan.eker-IzeFyvvaP7pWk0Htik3J/w@public.gmane.org, p.faure-et3tyl94nDNyDzI6CaY1VQ@public.gmane.org, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, claudio-YOzL5CV4y4YG1A2ADO40+w@public.gmane.org, michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, fchecconi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tommaso.cucinotta-gAmJrWFzCps@public.gmane.org, juri.lelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nicola.manica-+cHZLFJ93xAO91npARCAeA@public.gmane.org, luca.abeni-3IIOeSMMxS4@public.gmane.org, dhaval.giani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hgu1972-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Paul McKenney <paulmck-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, insop.song-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, liming.wang-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org, jkacur-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Apr 09, 2014 at 05:19:11PM +0200, Henrik Austad wrote:
> > 	The following "real-time" policies are also supported, for
>=20
> why the "'s?

I borrowed those from SCHED_SETSCHEDULER(2).

> > 	sched_attr::sched_flags additional flags that can influence
> > 	scheduling behaviour. Currently as per Linux kernel 3.14:
> >=20
> > 		SCHED_FLAG_RESET_ON_FORK - resets the scheduling policy
> > 		to: (struct sched_attr){ .sched_policy =3D SCHED_OTHER, }
> > 		on fork().
> >=20
> > 	is the only supported flag.

=2E..

> > 	The flags argument should be 0.
>=20
> What about SCHED_FLAG_RESET_ON_FOR?

Different flags. The one is sched_attr::flags the other is
sched_setattr(.flags).

> > 	The other sched_attr fields are filled out as described in
> > 	sched_setattr().
> >=20
> >    Scheduling Policies
> >        The  scheduler  is  the  kernel  component  that decides whi=
ch runnable
> >        process will be executed by the CPU next.  Each process has =
an  associ=E2=80=90
> >        ated  scheduling  policy and a static scheduling priority, s=
ched_prior=E2=80=90
> >        ity; these are the settings that are modified by  sched_sets=
cheduler().
> >        The  scheduler  makes it decisions based on knowledge of the=
 scheduling
> >        policy and static priority of all processes on the system.
>=20
> Isn't this last sentence redundant/sliglhtly repetitive?

I borrowed that from SCHED_SETSCHEDULER(2) again.

> >     SCHED_DEADLINE: Sporadic task model deadline scheduling
> > 	SCHED_DEADLINE is an implementation of GEDF (Global Earliest
> > 	Deadline First) with additional CBS (Constant Bandwidth Server).
> > 	The CBS guarantees that tasks that over-run their specified
> > 	budget are throttled and do not affect the correct performance
> > 	of other SCHED_DEADLINE tasks.
> >=20
> > 	SCHED_DEADLINE tasks will fail FORK(2) with -EAGAIN
> >=20
> > 	Setting SCHED_DEADLINE can fail with -EINVAL when admission
> > 	control tests fail.
>=20
> Perhaps add a note about the deadline-class having higher priority th=
an the=20
> other classes; i.e. if a deadline-task is runnable, it will preempt a=
ny=20
> other SCHED_(RR|FIFO) regardless of priority?

Yes, good point, will do.

> >    SCHED_FIFO: First In-First Out scheduling
> >        SCHED_FIFO can only be used with static priorities higher th=
an 0, which
> >        means that when a SCHED_FIFO processes becomes runnable, it =
will always
> >        immediately preempt any currently running SCHED_OTHER, SCHED=
_BATCH,  or
> >        SCHED_IDLE  process.  SCHED_FIFO is a simple scheduling algo=
rithm with=E2=80=90
> >        out time slicing.  For processes scheduled under the SCHED_F=
IFO policy,
> >        the following rules apply:
> >=20
> >        *  A  SCHED_FIFO  process that has been preempted by another=
 process of
> >           higher priority will stay at the head of the list for  it=
s  priority
> >           and  will resume execution as soon as all processes of hi=
gher prior=E2=80=90
> >           ity are blocked again.
> >=20
> >        *  When a SCHED_FIFO process becomes runnable, it will be  i=
nserted  at
> >           the end of the list for its priority.
> >=20
> >        *  A  call  to  sched_setscheduler()  or sched_setparam(2) w=
ill put the
> >           SCHED_FIFO (or SCHED_RR) process identified by pid at the=
  start  of
> >           the  list  if it was runnable.  As a consequence, it may =
preempt the
> >           currently  running  process   if   it   has   the   same =
  priority.
> >           (POSIX.1-2001 specifies that the process should go to the=
 end of the
> >           list.)
> >=20
> >        *  A process calling sched_yield(2) will be put at the end o=
f the list.
>=20
> How about the recent discussion regarding sched_yield(). Is this corr=
ect?
>=20
> lkml.kernel.org/r/alpine.DEB.2.02.1403312333100.14882-3cz04HxQyghirQl2xIGP3A@public.gmane.org=
ronix.de
>=20
> Is this the correct place to add a note explaining te potentional pit=
falls=20
> using sched_yield?

I'm not sure; there's a SCHED_YIELD(2) manpage to fill with that
nonsense.

Also; I realized I have not described the DEADLINE sched_yield()
behaviour.

> >        No other events will move a process scheduled under the SCHE=
D_FIFO pol=E2=80=90
> >        icy in the wait list of runnable processes with equal static=
 priority.
> >=20
> >        A SCHED_FIFO process runs until either it is blocked by an I=
/O request,
> >        it  is  preempted  by  a  higher  priority   process,   or  =
 it   calls
> >        sched_yield(2).
> >=20
> >    SCHED_RR: Round Robin scheduling
> >        SCHED_RR  is  a simple enhancement of SCHED_FIFO.  Everythin=
g described
> >        above for SCHED_FIFO also applies to SCHED_RR, except that e=
ach process
> >        is  only  allowed  to  run  for  a maximum time quantum.  If=
 a SCHED_RR
> >        process has been running for a time period equal to or longe=
r than  the
> >        time  quantum,  it will be put at the end of the list for it=
s priority.
> >        A SCHED_RR process that has been preempted by a higher prior=
ity process
> >        and  subsequently  resumes execution as a running process wi=
ll complete
> >        the unexpired portion of its round robin time quantum.  The =
 length  of
> >        the time quantum can be retrieved using sched_rr_get_interva=
l(2).
>=20
> -> Default is 0.1HZ ms
>=20
> This is a question I get form time to time, having this in the manpag=
e=20
> would be helpful.

Again, brazenly stolen from SCHED_SETSCHEDULER(2); but yes. Also I'm no=
t
sure I'd call RR an enhancement of anything much at all ;-)

> > ERRORS
> >        EINVAL The scheduling policy is not one  of  the  recognized=
  policies,
> >               param is NULL, or param does not make sense for the p=
olicy.
> >=20
> >        EPERM  The calling process does not have appropriate privile=
ges.
> >=20
> >        ESRCH  The process whose ID is pid could not be found.
> >=20
> >        E2BIG  The provided storage for struct sched_attr is either =
too
> >               big, see sched_setattr(), or too small, see sched_get=
attr().
>=20
> Where's the EBUSY? It can throw this from __sched_setscheduler() when=
 it=20
> checks if there's enough bandwidth to run the task.

Uhhm.. it got lost :-) /me quickly adds.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
