From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: futex(3) man page, final draft for pre-release review
Date: Wed, 16 Dec 2015 16:40:55 +0100
Message-ID: <56718607.2080600@gmail.com>
References: <56701916.4090203@gmail.com> <20151215224119.GA28877@linux-uzut.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151215224119.GA28877-95RKjC4jbl+7r5TWoziOLQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Davidlohr Bueso <dave-h16yJtLeMjHk1uMJSBkQmQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org>, Jakub Jelinek <jakub-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, bill o gallmeister <bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bert hubert <bert.hubert-dxZxOz86jR8sYtaaK7K+xw@public.gmane.org>, Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>, Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Daniel Wagner <wagi-kQCPcA+X3s7YtjvyW6yDsg@public.gmane.org>, Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>, Jonathan Wakely <jwakely-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi David,

On 12/15/2015 11:41 PM, Davidlohr Bueso wrote:
> On Tue, 15 Dec 2015, Michael Kerrisk (man-pages) wrote:
> 
>>       When executing a futex operation that requests to block a thread,
>>       the kernel will block only if the futex word has the  value  that
>>       the  calling  thread  supplied  (as  one  of the arguments of the
>>       futex() call) as the expected value of the futex word.  The load???
>>       ing  of the futex word's value, the comparison of that value with
>>       the expected value, and the actual blocking  will  happen  atomi???
>>
>> FIXME: for next line, it would be good to have an explanation of
>> "totally ordered" somewhere around here.
>>
>>       cally  and totally ordered with respect to concurrently executing
>>       futex operations on the same futex word.
> 
> So there are two things here regarding ordering. One is the most obvious
> which is ordered due to the taking/dropping the hb spinlock. Secondly, its
> the cases which Peter brought up a while ago that involves atomic futex ops
> futex_atomic_*(), which	do not have clearly defined semantics, and you get
> inconsistencies with certain archs (tile being the worst iirc).
> 
> But anyway, the important thing users need to know about is that the atomic
> futex operation must be totally ordered wrt any other user tasks that are trying
> to access that address. This is not necessarily the case for kernel ops. Peter
> illustrates this nicely with lock stealing example; 
> (see https://lkml.org/lkml/2015/8/26/596).

Thanks. I reworded things here a little.

> Internally, I believe we decided that making it fully ordered (as opposed to
> making use of implicit barriers for ACQUIRE/RELEASE), so you'd endup having
> an MB ll/sc MB kind of setup.
> 
> [...]
> 
>>       #include <stdio.h>
>>       #include <errno.h>
>>       #include <stdlib.h>
>>       #include <unistd.h>
>>       #include <sys/wait.h>
>>       #include <sys/mman.h>
>>       #include <sys/syscall.h>
>>       #include <linux/futex.h>
>>       #include <sys/time.h>
>>
>>       #define errExit(msg)    do { perror(msg); exit(EXIT_FAILURE); \
>>                               } while (0)
> 
> Nit, but for this we have err(3).

I don't much like them though (not in POSIX).

Thanks for the help David.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
