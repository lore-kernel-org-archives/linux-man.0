From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: futex(3) man page, final draft for pre-release review
Date: Tue, 15 Dec 2015 17:02:45 +0100
Message-ID: <567039A5.9050109@gmail.com>
References: <56701916.4090203@gmail.com> <1450193693.27311.115.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450193693.27311.115.camel-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org>, Davidlohr Bueso <dave-h16yJtLeMjHk1uMJSBkQmQ@public.gmane.org>, Jakub Jelinek <jakub-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, bill o gallmeister <bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bert hubert <bert.hubert-dxZxOz86jR8sYtaaK7K+xw@public.gmane.org>, Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>, Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Daniel Wagner <wagi-kQCPcA+X3s7YtjvyW6yDsg@public.gmane.org>, Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>, Jonathan Wakely <jwakely-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Torvald,

On 12/15/2015 04:34 PM, Torvald Riegel wrote:
> On Tue, 2015-12-15 at 14:43 +0100, Michael Kerrisk (man-pages) wrote:
>> Hello all,
>>
>> After much too long a time, the revised futex man page *will*
>> go out in the next man pages release (it has been merged
>> into master).
>>
>> There are various places where the page could still be improved,
>> but it is much better (and more than 5 times longer) than the
>> existing page.
>=20
> This looks good to me; I just saw minor things (see below).  Thank yo=
u
> for all the work you put into this (and to everybody who contributed)=
!

Hey Torvald, you were one of the biggest contributors, so, thanks!

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
> Maybe -- should we just say that it refers to the mathematical notion=
 of
> a total order (or, technically, a strict total order in this case)?

I added a sentence along those lines.

> Though I would hope that everyone using futexes is roughly aware of t=
he
> differences between partial and total orders.

>>        FUTEX_TRYLOCK_PI (since Linux 2.6.18)
>>               This operation tries to acquire the futex at uaddr.  I=
t is
>=20
> s/futex/lock/ to make it consistent with FUTEX_LOCK.

Done.

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
> What about "The acquisition of the lock might suceed if performed by =
the
> kernel in cases when the futex word contains stale state...".

Sounds good to me. Changed.

>>        FUTEX_WAIT_REQUEUE_PI (since Linux 2.6.31)
>>               Wait  on  a  non-PI  futex  at  uaddr  and  potentiall=
y be
>>               requeued (via a FUTEX_CMP_REQUEUE_PI operation in  ano=
ther
>>               task)  onto  a  PI futex at uaddr2.  The wait operatio=
n on
>>               uaddr is the same as for FUTEX_WAIT.
>>
>>               The waiter can be removed from the wait on  uaddr  wit=
hout
>>               requeueing on uaddr2 via a FUTEX_WAKE operation in ano=
ther
>>               task.  In this case, the  FUTEX_WAIT_REQUEUE_PI  opera=
tion
>>               returns with the error EWOULDBLOCK.
>=20
> This should be EAGAIN, I suppose, or the enumeration of errors should
> include EWOULDBLOCK.

Changed. BTW, under ERRORS there is already this text:

              Note:  on Linux, the symbolic names EAGAIN and EWOULDBLOC=
K
              (both of which appear in different  parts  of  the  kerne=
l
              futex code) have the same value.

Thanks for the comments, Torvald!

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
