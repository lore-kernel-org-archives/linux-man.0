From: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Draft pthread_spin_init(2) manual page
Date: Wed, 18 Oct 2017 11:09:11 +0200
Message-ID: <8eebbb75-39ae-3e32-de9a-33068f08d9cb@redhat.com>
References: <CAKgNAkh+wT26bTkWzyWg7K6S8CAcbbGoDx5Tha4QzP5sYKC7RA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkh+wT26bTkWzyWg7K6S8CAcbbGoDx5Tha4QzP5sYKC7RA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 10/18/2017 10:10 AM, Michael Kerrisk (man-pages) wrote:

> DESCRIPTION
>         The  pthread_spin_init() function allocates any resources required
>         for the use of the spin lock referred to by lock  and  initializes
>         the  lock  to be in the unlocked state.  The pshared argument must
>         have one of the following values:

I think somewhere this should say that it is not possible to change the 
address of a spinlock after initialization (you can't memcpy it 
somewhere else and expect that it will keep working).  Other pthread 
objects have the same problem, of course.

> NOTES
>         Spin locks should be employed in conjunction with real-time sched‐
>         uling policies (SCHED_FIFO, or possibly SCHED_RR).   Use  of  spin
>         locks   with   nondeterministic   scheduling   policies   such  as
>         SCHED_OTHER probably indicates a design mistake.  The  problem  is
>         that  if  a  thread operating under such a policy is scheduled off
>         the CPU while it holds a spin lock, then other threads will  waste
>         time  spinning  on  the  lock  until  the lock holder is once more
>         rescheduled and releases the lock.

Isn't the more important concern whether there are sufficient resources 
to run all the threads that block on spinlocks?

Thanks,
Florian
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
