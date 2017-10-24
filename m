From: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Draft pthread_spin_init(2) manual page
Date: Tue, 24 Oct 2017 11:50:36 +0300
Message-ID: <CACKs7VBYTeFaMMACA+d9q6KsjXfgQNwSw6D4AmgXxSttkCGmtQ@mail.gmail.com>
References: <CAKgNAkh+wT26bTkWzyWg7K6S8CAcbbGoDx5Tha4QzP5sYKC7RA@mail.gmail.com>
 <8eebbb75-39ae-3e32-de9a-33068f08d9cb@redhat.com> <alpine.DEB.2.20.1710182115350.2477@nanos>
 <7c153af8-423c-9154-0fd7-aac651b328eb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7c153af8-423c-9154-0fd7-aac651b328eb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

On Fri, Oct 20, 2017 at 12:21 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Thomas,
>
> On 10/18/2017 09:19 PM, Thomas Gleixner wrote:
>> On Wed, 18 Oct 2017, Florian Weimer wrote:
>>
>>> On 10/18/2017 10:10 AM, Michael Kerrisk (man-pages) wrote:
>>>
>>>> DESCRIPTION
>>>>         The  pthread_spin_init() function allocates any resources requ=
ired
>>>>         for the use of the spin lock referred to by lock  and  initial=
izes
>>>>         the  lock  to be in the unlocked state.  The pshared argument =
must
>>>>         have one of the following values:
>>>
>>> I think somewhere this should say that it is not possible to change the
>>> address of a spinlock after initialization (you can't memcpy it somewhe=
re else
>>> and expect that it will keep working).  Other pthread objects have the =
same
>>> problem, of course.
>>>
>>>> NOTES
>>>>         Spin locks should be employed in conjunction with real-time sc=
hed=E2=80=90
>>>>         uling policies (SCHED_FIFO, or possibly SCHED_RR).   Use  of  =
spin
>>>>         locks   with   nondeterministic   scheduling   policies   such=
  as
>>>>         SCHED_OTHER probably indicates a design mistake.  The  problem=
  is
>>>>         that  if  a  thread operating under such a policy is scheduled=
 off
>>>>         the CPU while it holds a spin lock, then other threads will  w=
aste
>>>>         time  spinning  on  the  lock  until  the lock holder is once =
more
>>>>         rescheduled and releases the lock.
>>>
>>> Isn't the more important concern whether there are sufficient resources=
 to run
>>> all the threads that block on spinlocks?
>>
>> Of course that's also a valid problemm, but I wouldn't say its worse tha=
n
>> the others.
>
> So, Florian, I did not directly address your comments in the changes so
> far. If you have some specific words, you think I should add, beyong thos=
e
> below, let me know.
>
>> User space spinlocks are prone to priority inversion and unbound spin ti=
mes
>> by definition. A programmer using those has to be exceptionally careful =
not
>> only in the code, but also in terms of system configuration, thread
>> placement and priority assignment. User space spinlocks are not applicab=
le
>> for general locking problems and yes, the man page should make this very
>> clear.
>
> Thanks. I added the following, based pretty much directly on
> your wording:
>
>        User space spin locks are prone, by definition, to priority inver=
=E2=80=90
>        sion and unbound spin times.  A programmer using spin  locks  must
>        be  exceptionally  careful not only in the code, but also in terms
>        of system configuration, thread placement,  and  priority  assign=
=E2=80=90
>        ment.   User-space spin locks are not applicable for general lock=
=E2=80=90
>        ing problems.


Just my 2 cents - I think the explanation is a bit too wordy and
possibly not that easy to understand. From my understanding of spin
locks, when a thread tries to acquire a spin lock, it busy waits for
it. I would emphasize that, and put the other details further down in
the paragraph, since "are prone to priority inversion etc" is not as
clear as "busy waiting - bad" :).

>
> Cheers,
>
> Michael
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
