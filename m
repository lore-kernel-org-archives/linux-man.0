From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH] hrtimers: system-wide and per-task hrtimer slacks
Date: Wed, 25 Apr 2012 10:06:19 +1200
Message-ID: <CAHO5Pa3X9oC+kpUmJ_HYVRnckXOd-bf=7zTaUZguqN1KNL4MfQ@mail.gmail.com>
References: <1329724172-27690-1-git-send-email-dmitry.antipov@linaro.org>
	<20120404171013.ac08575d.akpm@linux-foundation.org>
	<4F7EB406.5020703@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F7EB406.5020703-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Antipov <dmitry.antipov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Dmitry,

On Fri, Apr 6, 2012 at 9:14 PM, Dmitry Antipov
<dmitry.antipov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 04/05/2012 04:10 AM, Andrew Morton wrote:
>
>> Well.. =C2=A0there are some back-incompatibilities here.
>> prctl(PR_SET_TIMERSLACK, -1) used to restore current's slack setting=
 to
>> whatever-we-inherited-at-fork, but that has been removed. =C2=A0What=
 are the
>> implications of this, and did we need to do it?
>
>
> It seems you're looking at the previous version of this patch
> (http://lkml.org/lkml/2012/2/20/55). Latest proposal is
> http://lwn.net/Articles/484162/, which defines PR_SET_TIMERSLACK
> action as:
> ...
> case PR_SET_TIMERSLACK:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (arg2 <=3D 0)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0current->timer=
_slack_ns =3D
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0default_timer_slack_ns;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (arg2 <=3D HRTIMER_MAX_SLACK)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0current->timer=
_slack_ns =3D arg2;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D -EIN=
VAL;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
> ...
>
>
>> If we do make changes in this area then the prctl manpage should be
>> updated, please. =C2=A0And if
>> http://www.spinics.net/lists/linux-man/msg01149.html represents the
>> current state of that manpage then it should be updated anyway - tha=
t
>> entry doesn't say anything about the (arg2<=3D 0) case.
>
>
> I sent a patch for man pages too, it should be one of the recent post=
s
> at http://www.spinics.net/lists/linux-man/index.html.

Your response didn't actually address Andrew's point. Your patch
changes user-visible semantics that have been in place since kernel
2.6.28. Specifically:

* The meaning of prctl(PS_SET_TIMESLACK, n) changes,
  for the n<0 case (formerly, this reverted the timer slack
  to the per-process "default", with the proposed patch, it
  reverts the timer slack to a system-wide default).
* The semantics of setting the timer slack of a new thread
  have changed.

Perhaps these changes are warranted/necessary, but they *are* ABI
changes, and so should be carefully explained and well justified.

Thanks,

Michael

PS As background to the discussion, here's the current draft of some
text I plan to add to prctl(2) that explains the current semantics,
which would change with Dmitry's patch:

prctl(2):
       PR_SET_TIMERSLACK (since Linux 2.6.28)
              Set  the  timer slack for the calling thread to the value=
 in
              arg2.  The timer slack is a value, expressed in nanosecon=
ds,
              that  is  used  by the kernel to group timer expirations =
for
              this thread that are close to one another; as a consequen=
ce,
              timer expirations for this thread may be up to the specif=
ied
              number of nanoseconds late (but will  never  expire  earl=
y).
              Grouping timer expirations can help reduce system power c=
on=E2=80=90
              sumption by minimizing CPU wake-ups.

              The timer expirations affected by timer slack are those  =
set
              by  select(2), pselect(2), poll(2), ppoll(2), epoll_wait(=
2),
              epoll_pwait(2),   clock_nanosleep(2),   nanosleep(2),    =
and
              futex(2)  (and  thus  the  library functions implemented =
via
              futexes: pthread_cond_timedwait(3),  pthread_rwlock_timed=
rd=E2=80=90
              lock(3), pthread_rwlock_timedwrlock(3), and sem_wait(3)).

              Each  thread  has  two  associated  timer  slack  values:=
  a
              "default" value, and a "current" value.  The "current" va=
lue
              is the one that governs grouping of timer expirations.  W=
hen
              a new thread is created, the two timer slack values are m=
ade
              the  same  as  the  "current"  value of the creating thre=
ad.
              Thereafter, a thread can adjust its timer  slack  value  =
via
              PR_SET_TIMERSLACK:  if  arg2  is  greater than zero, then=
 it
              specifies a new value for the "current" timer slack for  =
the
              calling  thread; if arg2 is less than or equal to zero, t=
hen
              the "current" timer slack is set  to  the  "default"  val=
ue.
              The  timer  slack value of init (PID 1), the ancestor of =
all
              threads, is 50,000 nanoseconds (50 microseconds).

fork(2):
       *  The "default" timer slack of the child is set to  the  value =
 of
          the  "current"  timer slack of the parent.  (See the descript=
ion
          of PR_SET_TIMERSLACK on prctl(2).)

--=20
Michael Kerrisk Linux man-pages maintainer;
http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface", http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
