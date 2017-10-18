From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Draft pthread_spin_init(2) manual page
Date: Wed, 18 Oct 2017 21:19:34 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1710182115350.2477@nanos>
References: <CAKgNAkh+wT26bTkWzyWg7K6S8CAcbbGoDx5Tha4QzP5sYKC7RA@mail.gmail.com> <8eebbb75-39ae-3e32-de9a-33068f08d9cb@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-262833524-1508354375=:2477"
Return-path: <libc-alpha-return-86057-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <8eebbb75-39ae-3e32-de9a-33068f08d9cb@redhat.com>
To: Florian Weimer <fweimer@redhat.com>
Cc: mtk.manpages@gmail.com, linux-man <linux-man@vger.kernel.org>, "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
List-Id: linux-man@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-262833524-1508354375=:2477
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Wed, 18 Oct 2017, Florian Weimer wrote:

> On 10/18/2017 10:10 AM, Michael Kerrisk (man-pages) wrote:
> 
> > DESCRIPTION
> >         The  pthread_spin_init() function allocates any resources required
> >         for the use of the spin lock referred to by lock  and  initializes
> >         the  lock  to be in the unlocked state.  The pshared argument must
> >         have one of the following values:
> 
> I think somewhere this should say that it is not possible to change the
> address of a spinlock after initialization (you can't memcpy it somewhere else
> and expect that it will keep working).  Other pthread objects have the same
> problem, of course.
> 
> > NOTES
> >         Spin locks should be employed in conjunction with real-time sched‐
> >         uling policies (SCHED_FIFO, or possibly SCHED_RR).   Use  of  spin
> >         locks   with   nondeterministic   scheduling   policies   such  as
> >         SCHED_OTHER probably indicates a design mistake.  The  problem  is
> >         that  if  a  thread operating under such a policy is scheduled off
> >         the CPU while it holds a spin lock, then other threads will  waste
> >         time  spinning  on  the  lock  until  the lock holder is once more
> >         rescheduled and releases the lock.
> 
> Isn't the more important concern whether there are sufficient resources to run
> all the threads that block on spinlocks?

Of course that's also a valid problemm, but I wouldn't say its worse than
the others.

User space spinlocks are prone to priority inversion and unbound spin times
by definition. A programmer using those has to be exceptionally careful not
only in the code, but also in terms of system configuration, thread
placement and priority assignment. User space spinlocks are not applicable
for general locking problems and yes, the man page should make this very
clear.

Thanks,

	tglx
--8323329-262833524-1508354375=:2477--
