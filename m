From: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: futex(3) man page, final draft for pre-release review
Date: Tue, 15 Dec 2015 13:18:16 -0800
Message-ID: <20151215211816.GR11972@malice.jf.intel.com>
References: <56701916.4090203@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56701916.4090203-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org>, Davidlohr Bueso <dave-h16yJtLeMjHk1uMJSBkQmQ@public.gmane.org>, Jakub Jelinek <jakub-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, bill o gallmeister <bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bert hubert <bert.hubert-dxZxOz86jR8sYtaaK7K+xw@public.gmane.org>, Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>, Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Daniel Wagner <wagi-kQCPcA+X3s7YtjvyW6yDsg@public.gmane.org>, Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>, Jonathan Wakely <jwakely-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mike Frysinger <vapier@>
List-Id: linux-man@vger.kernel.org

On Tue, Dec 15, 2015 at 02:43:50PM +0100, Michael Kerrisk (man-pages) w=
rote:
> Hello all,
>=20
> After much too long a time, the revised futex man page *will*
> go out in the next man pages release (it has been merged
> into master).
>=20
> There are various places where the page could still be improved,
> but it is much better (and more than 5 times longer) than the
> existing page.
>=20
> The rendered version of the page is shown below, so that people
> can make any final comments/suggestions for improvements
> before the release (but of course I'll also take any
> improvements after release as well). The page source is
> available from the Git repo=20
> (http://git.kernel.org/cgit/docs/man-pages/man-pages.git).
>=20
> As I mention above, there are various places where the page
> could still be better, so the rendered text below is annotated
> with some FIXMEs, in case anyone wants to address these before
> release.
>=20
> Thanks
>=20
> Michael

=46antastic! A few comments below.

=2E..

>=20
>        When executing a futex operation that requests to block a thre=
ad,
>        the kernel will block only if the futex word has the  value  t=
hat
>        the  calling  thread  supplied  (as  one  of the arguments of =
the
>        futex() call) as the expected value of the futex word.  The lo=
ad=E2=80=90
>        ing  of the futex word's value, the comparison of that value w=
ith
>        the expected value, and the actual blocking  will  happen  ato=
mi=E2=80=90
>=20
> FIXME: for next line, it would be good to have an explanation of
> "totally ordered" somewhere around here.
>=20
>        cally  and totally ordered with respect to concurrently execut=
ing

Totally ordered with respect futex operations refers to semantics of th=
e
ACQUIRE/RELEASE operations and how they impact ordering of memory reads=
 and
writes. The kernel futex operations are protected by spinlocks, which e=
nsure
that that all operations are serialized with respect to one another.

This is a lot to attempt to define in this document. Perhaps a referenc=
e to
linux/Documentation/memory-barriers.txt as a footnote would be sufficie=
nt? Or
perhaps for this manual, "serialized" would be sufficient, with a footn=
ote
regarding "totally ordered" and a pointer to the memory-barrier documen=
tation?

>        futex operations on the same futex word.  Thus, the futex word=
 is
>        used to connect the synchronization in user space with the imp=
le=E2=80=90
>        mentation of blocking by the kernel.  Analogously  to  an  ato=
mic
>        compare-and-exchange  operation  that  potentially changes sha=
red
>        memory, blocking via a futex is an atomic compare-and-block op=
er=E2=80=90
>        ation.

=2E..

>    Futex operations
>        The futex_op argument consists of two parts: a command that sp=
ec=E2=80=90
>        ifies  the  operation to be performed, bit-wise ORed with zero=
 or
>        or more options that modify the behaviour of the operation.   =
The
>        options that may be included in futex_op are as follows:

=2E..

>=20
>        FUTEX_CLOCK_REALTIME (since Linux 2.6.28)
>               This   option   bit   can   be   employed  only  with  =
the
>               FUTEX_WAIT_BITSET and FUTEX_WAIT_REQUEUE_PI operations.

That caught me by surprise, but it's true. We reject FUTEX_WAIT |
=46UTEX_CLOCK_REALTIME, even though FUTEX_WAIT treated as FUTEX_WAIT_BI=
TSET with
val3=3DFUTEX_BITSET_MATCH_ANY.

Thomas, this looks like an oversight to me - do you recall if we intent=
ionally
disallow FUTEX_CLOCK_REALTIME with FUTEX_WAIT?

>               If this option is set, the kernel  treats  timeout  as =
 an
>               absolute time based on CLOCK_REALTIME.
>=20
>               If  this  option  is not set, the kernel treats timeout=
 as
>               relative time, measured against the CLOCK_MONOTONIC clo=
ck.

=2E..

>    Priority-inheritance futexes

=2E..

>        *  If  the lock is owned and there are threads contending for =
the
>           lock, then the FUTEX_WAITERS bit shall be  set  in  the  fu=
tex
>           word's value; in other words, this value is:
>=20
>               FUTEX_WAITERS | TID
>=20
>=20
>           (Note that is invalid for a PI futex word to have no owner =
and

                      ^ it

>           FUTEX_WAITERS set.)
=2E..

>        FUTEX_TRYLOCK_PI (since Linux 2.6.18)
>               This operation tries to acquire the futex at uaddr.  It=
 is
>               invoked when a user-space atomic acquire did  not  succ=
eed
>               because the futex word was not 0.
>=20
>=20
> FIXME(Next sentence) The wording "The trylock in kernel" below=20
> needs clarification. Suggestions?
>=20
>               The trylock in kernel might succeed because the futex w=
ord

The lock acquisition might succeed in the kernel because the futex word

>               contains     stale     state     (FUTEX_WAITERS     and=
/or
>               FUTEX_OWNER_DIED).   This can happen when the owner of =
the
>               futex died.  User space cannot handle this condition in=
  a
>               race-free  manner,  but  the  kernel  can  fix this up =
and
>               acquire the futex.
>=20
>               The uaddr2, val, timeout, and val3 arguments are ignore=
d.

=2E..

>    EXAMPLE
>=20
> FIXME I think it would be helpful here to say a few more words about
>       the difference(s) between FUTEX_LOCK_PI and FUTEX_TRYLOCK_PI.
>       Can someone propose something?

Hrm. It seems pretty straightforward to me. I guess I'm too close to it=
=2E What
about it seems unclear and needs clarification?

--=20
Darren Hart
Intel Open Source Technology Center
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
