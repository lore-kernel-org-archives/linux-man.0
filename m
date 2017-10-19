From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Draft pthread_spin_init(2) manual page
Date: Thu, 19 Oct 2017 22:08:29 +0200
Message-ID: <f64502e8-4ce3-d3e2-6f13-8aa6b3198fb2@gmail.com>
References: <CAKgNAkh+wT26bTkWzyWg7K6S8CAcbbGoDx5Tha4QzP5sYKC7RA@mail.gmail.com>
 <CAKCAbMgPJTiv_fPGz-k6myjb-Q=y5+ZPC-Tz_H3OQ_3__UzbTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKCAbMgPJTiv_fPGz-k6myjb-Q=y5+ZPC-Tz_H3OQ_3__UzbTQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Zack,

Hello On 10/18/2017 07:44 PM, Zack Weinberg wrote:
> On Wed, Oct 18, 2017 at 4:10 AM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hello all,
>>
>> I recently drafted a manual page for the pthread_spin_init() and
>> pthread_spin_destroy() APIs. Comments and suggestions for improvements
>> would be most welcome.
> 
> This should probably cross-reference the pthread_mutex_* manpages and
> say when it is appropriate to use which.  I see you already have some
> of that...
> 
>> NOTES
>>        Spin locks should be employed in conjunction with real-time sched‐
>>        uling policies (SCHED_FIFO, or possibly SCHED_RR).   Use  of  spin
>>        locks   with   nondeterministic   scheduling   policies   such  as
>>        SCHED_OTHER probably indicates a design mistake.  The  problem  is
>>        that  if  a  thread operating under such a policy is scheduled off
>>        the CPU while it holds a spin lock, then other threads will  waste
>>        time  spinning  on  the  lock  until  the lock holder is once more
>>        rescheduled and releases the lock.
>>
>>        Warning: if threads create a deadlock  situation  while  employing
>>        spin locks, those threads will spin forever consuming CPU time.
> 
> but you might want to begin with something like "Most programs should
> use mutexes (pthread_mutex_init(3)) instead of spin locks.  Spin locks
> are primarily useful in conjunction with real-time scheduling ..."
> 
> Also, this is important enough that I'd put it in the DESCRIPTION.

Thanks. I think that's a great phrasing. I added the following at the start 
of DESCRIPTION:

       General  note:  Most  programs  should use mutexes instead of spin
       locks.  Spin locks are primarily useful in conjunction with  real-
       time scheduling policies.  See NOTES.

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
