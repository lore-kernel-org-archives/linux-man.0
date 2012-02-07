From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: proc(5) and definition of loadavg
Date: Wed, 8 Feb 2012 06:22:36 +1300
Message-ID: <CAKgNAkj=BfFyrDpwQOwEAop6HLG8-i9-2WkuLnGURh9jLuuPtA@mail.gmail.com>
References: <CAGWqfiiE01fhAYbVVyATu5=GkgekgV7-WCyZ6ZZwwrSv3XbDvA@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGWqfiiE01fhAYbVVyATu5=GkgekgV7-WCyZ6ZZwwrSv3XbDvA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Elie,

On Tue, Feb 7, 2012 at 8:48 PM, Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8@public.gmane.org=
m> wrote:
> Hello all,
>
> I've got a small suggestion related to man 5 proc (
> http://www.kernel.org/doc/man-pages/online/pages/man5/proc.5.html ).
> If you go to /proc/loadavg it states
>
> <quote>
> =A0The fourth field consists of two numbers separated by a slash (/).
> The first of these is the number of currently executing kernel
> scheduling entities (processes, threads); this will be less than or
> equal to the number of CPUs. =A0The value after the slash is the numb=
er
> of kernel scheduling entities that currently exist on the system.
> </quote>
>
> When I take a look at /proc/loadavg this seems to make sense:
>
> edb@lapedb:~$ cat /proc/loadavg
> 0.04 0.65 0.59 1/284 8102
>
> However, suppose I run 4 background jobs of 'yes bla > /dev/null &'
>
> edb@lapedb:~$ yes bla > /dev/null &
> [1] 8111
> edb@lapedb:~$ yes bla > /dev/null &
> [2] 8112
> edb@lapedb:~$ yes bla > /dev/null &
> [3] 8113
> edb@lapedb:~$ yes bla > /dev/null &
> [4] 8114
> edb@lapedb:~$ cat /proc/loadavg
> 0.18 0.59 0.57 5/289 8115
> edb@lapedb:~$ cat /proc/cpuinfo | grep processor
> processor =A0 =A0 =A0 : 0
> processor =A0 =A0 =A0 : 1
>
> Then I see that the 'fourth field' before the slash is five, whereas
> the number of cpu's (dual core laptop) is only two. Hence the 'this
> will be less than or equal to the number of CPUs' in the manpage is
> not correct. Now if we take a deeper look at how this /proc/loadavg
> gets created (in fs/proc/loadavg.c):
> http://lxr.linux.no/#linux+v3.0.4/fs/proc/loadavg.c#L23
>
> We can see that the fourth value before the fraction is the result of
> 'nr_running()' which is turn lives in kern/sched.c (ref:
> http://lxr.linux.no/#linux+v3.0.4/kernel/sched.c#L3197 ) and this
> function just counts the number of runnable threads for each of the
> online cpu's. I have attached a path which rephrases this, the patch
> is rather trivial.

Thanks. I've applied this for man-pages-3.36.

Cheers,

Michael



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
