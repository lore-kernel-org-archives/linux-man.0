From: Zack Weinberg <zackw@panix.com>
Subject: Re: Draft pthread_spin_init(2) manual page
Date: Wed, 18 Oct 2017 13:44:22 -0400
Message-ID: <CAKCAbMgPJTiv_fPGz-k6myjb-Q=y5+ZPC-Tz_H3OQ_3__UzbTQ@mail.gmail.com>
References: <CAKgNAkh+wT26bTkWzyWg7K6S8CAcbbGoDx5Tha4QzP5sYKC7RA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <libc-alpha-return-86049-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <CAKgNAkh+wT26bTkWzyWg7K6S8CAcbbGoDx5Tha4QzP5sYKC7RA@mail.gmail.com>
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: linux-man <linux-man@vger.kernel.org>, "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
List-Id: linux-man@vger.kernel.org

On Wed, Oct 18, 2017 at 4:10 AM, Michael Kerrisk (man-pages)
<mtk.manpages@gmail.com> wrote:
> Hello all,
>
> I recently drafted a manual page for the pthread_spin_init() and
> pthread_spin_destroy() APIs. Comments and suggestions for improvements
> would be most welcome.

This should probably cross-reference the pthread_mutex_* manpages and
say when it is appropriate to use which.  I see you already have some
of that...

> NOTES
>        Spin locks should be employed in conjunction with real-time sched=
=E2=80=90
>        uling policies (SCHED_FIFO, or possibly SCHED_RR).   Use  of  spin
>        locks   with   nondeterministic   scheduling   policies   such  as
>        SCHED_OTHER probably indicates a design mistake.  The  problem  is
>        that  if  a  thread operating under such a policy is scheduled off
>        the CPU while it holds a spin lock, then other threads will  waste
>        time  spinning  on  the  lock  until  the lock holder is once more
>        rescheduled and releases the lock.
>
>        Warning: if threads create a deadlock  situation  while  employing
>        spin locks, those threads will spin forever consuming CPU time.

but you might want to begin with something like "Most programs should
use mutexes (pthread_mutex_init(3)) instead of spin locks.  Spin locks
are primarily useful in conjunction with real-time scheduling ..."

Also, this is important enough that I'd put it in the DESCRIPTION.

zw
