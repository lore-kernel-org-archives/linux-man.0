From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: futex(3) man page, final draft for pre-release review
Date: Sat, 19 Dec 2015 07:56:27 +0100
Message-ID: <5674FF9B.7070002@gmail.com>
References: <56701916.4090203@gmail.com>
 <20151215211816.GR11972@malice.jf.intel.com>
 <1450437714.26597.53.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450437714.26597.53.camel-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org>, Davidlohr Bueso <dave-h16yJtLeMjHk1uMJSBkQmQ@public.gmane.org>, Jakub Jelinek <jakub-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, bill o gallmeister <bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bert hubert <bert.hubert-dxZxOz86jR8sYtaaK7K+xw@public.gmane.org>, Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>, Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Daniel Wagner <wagi-kQCPcA+X3s7YtjvyW6yDsg@public.gmane.org>, Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>, Jonathan Wakely <jwakely-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 12/18/2015 12:21 PM, Torvald Riegel wrote:
> On Tue, 2015-12-15 at 13:18 -0800, Darren Hart wrote:
>> On Tue, Dec 15, 2015 at 02:43:50PM +0100, Michael Kerrisk (man-pages=
) wrote:
>>>
>>>        When executing a futex operation that requests to block a th=
read,
>>>        the kernel will block only if the futex word has the  value =
 that
>>>        the  calling  thread  supplied  (as  one  of the arguments o=
f the
>>>        futex() call) as the expected value of the futex word.  The =
load=E2=80=90
>>>        ing  of the futex word's value, the comparison of that value=
 with
>>>        the expected value, and the actual blocking  will  happen  a=
tomi=E2=80=90
>>>
>>> FIXME: for next line, it would be good to have an explanation of
>>> "totally ordered" somewhere around here.
>>>
>>>        cally  and totally ordered with respect to concurrently exec=
uting
>>
>> Totally ordered with respect futex operations refers to semantics of=
 the
>> ACQUIRE/RELEASE operations and how they impact ordering of memory re=
ads and
>> writes. The kernel futex operations are protected by spinlocks, whic=
h ensure
>> that that all operations are serialized with respect to one another.
>>
>> This is a lot to attempt to define in this document. Perhaps a refer=
ence to
>> linux/Documentation/memory-barriers.txt as a footnote would be suffi=
cient? Or
>> perhaps for this manual, "serialized" would be sufficient, with a fo=
otnote
>> regarding "totally ordered" and a pointer to the memory-barrier docu=
mentation?
>=20
> I'd strongly prefer to document the semantics for users here. =20

Yes, please.

> And I
> don't think users use the kernel's memory model -- instead, if we ass=
ume
> that most users will call futex ops from C or C++, then the best we h=
ave
> is the C11 / C++11 memory model. =20

Agreed.

> Therefore, if we want to expand that,

I think we should. And by we, I mean you ;-)

> we should specify semantics in terms of as-if equivalence to C11 pseu=
do
> code.  I had proposed that in the past but, IIRC, Michael didn't want=
 to
> add a C11 "dependency" in the semantics back then, at least for the
> initial release.

I'd like to avoid it if possible, since many of us don't understand
all the details of those C11 semantics--and by us, I mean
me :-/. But maybe I'll be forced to educate myself better.

> Here's what I wrote back then (atomic_*_relaxed() is like C11
> atomic_*(..., memory_order_relaxed), lock/unlock have normal C11 mute=
x
> semantics):
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>=20
> For example, we could say that futex_wait is, in terms of
> synchronization semantics, *as if* we'd execute a piece of C11 code.
> Here's a part of the docs for a glibc-internal futex wrapper that I'm
> working on; this is futex_wait ... :
>=20
> /* Atomically wrt other futex operations, this blocks iff the value a=
t
>    *FUTEX matches the expected value.  This is semantically equivalen=
t to:=20
>      l =3D <get lock associated with futex> (FUTEX);
>      wait_flag =3D <get wait_flag associated with futex> (FUTEX);
>      lock (l);
>      val =3D atomic_load_relaxed (FUTEX);
>      if (val !=3D expected) { unlock (l); return EAGAIN; }
>      atomic_store_relaxed (wait_flag, 1);
>      unlock (l);
>      // Now block; can time out in futex_time_wait (see below)
>      while (atomic_load_relaxed(wait_flag));
>=20
>    Note that no guarantee of a happens-before relation between a woke=
n
>    futex_wait and a futex_wake is documented; however, this does not =
matter
>    in practice because we have to consider spurious wake-ups (see bel=
ow),
>    and thus would not be able to reason which futex_wake woke us anyw=
ay.
>=20
>=20
> ... and this is futex_wake:
>=20
> /* Atomically wrt other futex operations, this unblocks the specified
>    number of processes, or all processes blocked on this futex if the=
re are
>    fewer than the specified number.  Semantically, this is equivalent=
 to:
>      l =3D <get lock associated with futex> (futex);
>      lock (l);
>      for (res =3D 0; processes_to_wake > 0; processes_to_wake--, res+=
+) {
>        if (<no process blocked on futex>) break;
>        wf =3D <get wait_flag of a process blocked on futex> (futex);
>        // No happens-before guarantee with woken futex_wait (see abov=
e)
>        atomic_store_relaxed (wf, 0);
>      }
>      return res;
>=20
> This allows a programmer to really infer the guarantees he/she can ge=
t
> from a futex in terms of synchronization, without the docs having to =
use
> prose to describe that.  This should also not constrain the kernel in
> terms of how to implement it, because it is a conceptual as-if relati=
on
> (e.g., the kernel won't spin-wait the whole time, and we might want t=
o
> make this clear for the PI case).
>=20
> Of course, there are several as-if representations we could use, and =
we
> might want to be a bit more pseudo-code-ish to make this also easy to
> understand for people not familiar with C11 (e.g., using mutex + cond=
var
> with some relaxation of condvar guaranteees).

Okay -- I'm open to all of the above.

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
