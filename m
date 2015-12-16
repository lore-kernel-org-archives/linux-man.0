From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: futex(3) man page, final draft for pre-release review
Date: Wed, 16 Dec 2015 16:54:06 +0100
Message-ID: <5671891E.404@gmail.com>
References: <56701916.4090203@gmail.com> <20151215211816.GR11972@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151215211816.GR11972-Z5kFBHtJu+EzCVHREhWfF0EOCMrvLtNR@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org>, Davidlohr Bueso <dave-h16yJtLeMjHk1uMJSBkQmQ@public.gmane.org>, Jakub Jelinek <jakub-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, bill o gallmeister <bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bert hubert <bert.hubert-dxZxOz86jR8sYtaaK7K+xw@public.gmane.org>, Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>, Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Daniel Wagner <wagi-kQCPcA+X3s7YtjvyW6yDsg@public.gmane.org>, Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>, Jonathan Wakely <jwakely-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Darren,

On 12/15/2015 10:18 PM, Darren Hart wrote:
> On Tue, Dec 15, 2015 at 02:43:50PM +0100, Michael Kerrisk (man-pages)=
 wrote:

[...]

>>        When executing a futex operation that requests to block a thr=
ead,
>>        the kernel will block only if the futex word has the  value  =
that
>>        the  calling  thread  supplied  (as  one  of the arguments of=
 the
>>        futex() call) as the expected value of the futex word.  The l=
oad=E2=80=90
>>        ing  of the futex word's value, the comparison of that value =
with
>>        the expected value, and the actual blocking  will  happen  at=
omi=E2=80=90
>>
>> FIXME: for next line, it would be good to have an explanation of
>> "totally ordered" somewhere around here.
>>
>>        cally  and totally ordered with respect to concurrently execu=
ting
>=20
> Totally ordered with respect futex operations refers to semantics of =
the
> ACQUIRE/RELEASE operations and how they impact ordering of memory rea=
ds and
> writes. The kernel futex operations are protected by spinlocks, which=
 ensure
> that that all operations are serialized with respect to one another.
>=20
> This is a lot to attempt to define in this document. Perhaps a refere=
nce to
> linux/Documentation/memory-barriers.txt as a footnote would be suffic=
ient? Or
> perhaps for this manual, "serialized" would be sufficient, with a foo=
tnote
> regarding "totally ordered" and a pointer to the memory-barrier docum=
entation?

I think I'll just settle for writing serialized in the man page, and be=
=20
done with it :-).

>>        futex operations on the same futex word.  Thus, the futex wor=
d is
>>        used to connect the synchronization in user space with the im=
ple=E2=80=90
>>        mentation of blocking by the kernel.  Analogously  to  an  at=
omic
>>        compare-and-exchange  operation  that  potentially changes sh=
ared
>>        memory, blocking via a futex is an atomic compare-and-block o=
per=E2=80=90
>>        ation.
>=20
> ...
>=20
>>    Futex operations
>>        The futex_op argument consists of two parts: a command that s=
pec=E2=80=90
>>        ifies  the  operation to be performed, bit-wise ORed with zer=
o or
>>        or more options that modify the behaviour of the operation.  =
 The
>>        options that may be included in futex_op are as follows:
>=20
> ...
>=20
>>
>>        FUTEX_CLOCK_REALTIME (since Linux 2.6.28)
>>               This   option   bit   can   be   employed  only  with =
 the
>>               FUTEX_WAIT_BITSET and FUTEX_WAIT_REQUEUE_PI operations=
=2E
>=20
> That caught me by surprise, but it's true. We reject FUTEX_WAIT |
> FUTEX_CLOCK_REALTIME, even though FUTEX_WAIT treated as FUTEX_WAIT_BI=
TSET with
> val3=3DFUTEX_BITSET_MATCH_ANY.

You uncover all sorts of interesting stuff when you document APIs ;-).

>=20
> Thomas, this looks like an oversight to me - do you recall if we inte=
ntionally
> disallow FUTEX_CLOCK_REALTIME with FUTEX_WAIT?
>=20
>>               If this option is set, the kernel  treats  timeout  as=
  an
>>               absolute time based on CLOCK_REALTIME.
>>
>>               If  this  option  is not set, the kernel treats timeou=
t as
>>               relative time, measured against the CLOCK_MONOTONIC cl=
ock.
>=20
> ...
>=20
>>    Priority-inheritance futexes
>=20
> ...
>=20
>>        *  If  the lock is owned and there are threads contending for=
 the
>>           lock, then the FUTEX_WAITERS bit shall be  set  in  the  f=
utex
>>           word's value; in other words, this value is:
>>
>>               FUTEX_WAITERS | TID
>>
>>
>>           (Note that is invalid for a PI futex word to have no owner=
 and
>=20
>                       ^ it
>=20
>>           FUTEX_WAITERS set.)
> ...
>=20
>>        FUTEX_TRYLOCK_PI (since Linux 2.6.18)
>>               This operation tries to acquire the futex at uaddr.  I=
t is
>>               invoked when a user-space atomic acquire did  not  suc=
ceed
>>               because the futex word was not 0.
>>
>>
>> FIXME(Next sentence) The wording "The trylock in kernel" below=20
>> needs clarification. Suggestions?
>>
>>               The trylock in kernel might succeed because the futex =
word
>=20
> The lock acquisition might succeed in the kernel because the futex wo=
rd

Already did some rewording here which I think makes things better.

>>               contains     stale     state     (FUTEX_WAITERS     an=
d/or
>>               FUTEX_OWNER_DIED).   This can happen when the owner of=
 the
>>               futex died.  User space cannot handle this condition i=
n  a
>>               race-free  manner,  but  the  kernel  can  fix this up=
 and
>>               acquire the futex.
>>
>>               The uaddr2, val, timeout, and val3 arguments are ignor=
ed.
>=20
> ...
>=20
>>    EXAMPLE
>>
>> FIXME I think it would be helpful here to say a few more words about
>>       the difference(s) between FUTEX_LOCK_PI and FUTEX_TRYLOCK_PI.
>>       Can someone propose something?
>=20
> Hrm. It seems pretty straightforward to me. I guess I'm too close to =
it. What
> about it seems unclear and needs clarification?

On reflection, I agree that the difference is perhaps well-enough expla=
ined.

Thanks for the comments, Darren.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
