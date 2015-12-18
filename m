From: Jonathan Wakely <jwakely-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: futex(3) man page, final draft for pre-release review
Date: Fri, 18 Dec 2015 15:34:02 +0000
Message-ID: <20151218153402.GV5356@redhat.com>
References: <56701916.4090203@gmail.com>
 <20151215211816.GR11972@malice.jf.intel.com>
 <5671891E.404@gmail.com>
 <1450437061.26597.45.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1450437061.26597.45.camel-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org>, Davidlohr Bueso <dave-h16yJtLeMjHk1uMJSBkQmQ@public.gmane.org>, Jakub Jelinek <jakub-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, bill o gallmeister <bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bert hubert <bert.hubert-dxZxOz86jR8sYtaaK7K+xw@public.gmane.org>, Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>, Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Daniel Wagner <wagi-kQCPcA+X3s7YtjvyW6yDsg@public.gmane.org>, Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>, Mike
List-Id: linux-man@vger.kernel.org

On 18/12/15 12:11 +0100, Torvald Riegel wrote:
>On Wed, 2015-12-16 at 16:54 +0100, Michael Kerrisk (man-pages) wrote:
>> Hello Darren,
>>
>> On 12/15/2015 10:18 PM, Darren Hart wrote:
>> > On Tue, Dec 15, 2015 at 02:43:50PM +0100, Michael Kerrisk (man-pag=
es) wrote:
>>
>> [...]
>>
>> >>        When executing a futex operation that requests to block a =
thread,
>> >>        the kernel will block only if the futex word has the  valu=
e  that
>> >>        the  calling  thread  supplied  (as  one  of the arguments=
 of the
>> >>        futex() call) as the expected value of the futex word.  Th=
e load=E2=80=90
>> >>        ing  of the futex word's value, the comparison of that val=
ue with
>> >>        the expected value, and the actual blocking  will  happen =
 atomi=E2=80=90
>> >>
>> >> FIXME: for next line, it would be good to have an explanation of
>> >> "totally ordered" somewhere around here.
>> >>
>> >>        cally  and totally ordered with respect to concurrently ex=
ecuting
>> >
>> > Totally ordered with respect futex operations refers to semantics =
of the
>> > ACQUIRE/RELEASE operations and how they impact ordering of memory =
reads and
>> > writes. The kernel futex operations are protected by spinlocks, wh=
ich ensure
>> > that that all operations are serialized with respect to one anothe=
r.
>> >
>> > This is a lot to attempt to define in this document. Perhaps a ref=
erence to
>> > linux/Documentation/memory-barriers.txt as a footnote would be suf=
ficient? Or
>> > perhaps for this manual, "serialized" would be sufficient, with a =
footnote
>> > regarding "totally ordered" and a pointer to the memory-barrier do=
cumentation?
>>
>> I think I'll just settle for writing serialized in the man page, and=
 be
>> done with it :-).
>
>I'd prefer if you'd not just use "serialized" :)  Eventually, I'd pref=
er
>if we can explain the semantics for the user in terms of the terminolo=
gy
>and semantics of the memory model of the programming language that use=
rs
>will likely use to call futex ops (ie, C11 / C++11).

=46WIW a couple of uses of "serialized" were replaced in the C++11 fina=
l
draft due to comments pointing out that term is not defined in the
standard, see http://wg21.link/lwg1494 and http://wg21.link/lwg1504

That's not quite the same, because an ISO standard is supposed to
define all terms it uses, even for something like "serialized" where
the meaning is commonly understood by those in the field.

But I do like Torvald's suggestion to describe the semantics in
similar terms to C11, because that's the user-space model that
non-kernel folks (like me) are more likely to be familiar with.

Overall I like the new page a lot, I found it clear and readable. Nice
work.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
