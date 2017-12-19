From: Andrea Parri <parri.andrea-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: sched(7)
Date: Tue, 19 Dec 2017 12:50:24 +0100
Message-ID: <20171219115024.GA12190@andrea>
References: <CAPZ9YJY=PYMWQf7V8fFZ3fLkqAq9TUrxNAkyVLTK4CRCKjsgJg@mail.gmail.com>
 <bf488d46-030c-c46e-9d8f-45c4a8d3ca86@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <bf488d46-030c-c46e-9d8f-45c4a8d3ca86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, Dec 19, 2017 at 10:34:28AM +0100, Michael Kerrisk (man-pages) wrote:
> [widening the CC]
> 
> Hello Andrea,
> 
> On 01/20/2016 06:48 AM, Andrea Parri wrote:
> > Dear Michael,
> > 
> > I point out that the semantics of sched_setscheduler(2) for RT threads
> > indicated in sched(7) and, in particular, in
> > 
> >    "A call to sched_setscheduler(2), sched_setparam(2), or
> >     sched_setattr(2) will put the SCHED_FIFO (or SCHED_RR) thread
> >     identified by pid at the start of the list if it was runnable."
> > 
> > does not "reflect" the current implementation of this syscall(s) that, in
> > turn; based on the source, I think a more appropriate description of this
> > semantics would be:
> > 
> >    "... the effect on its position in the thread list depends on the
> > direction
> >     of the modification, as follows:
> > 
> >       a. if the priority is raised, the thread becomes the tail of the
> > thread list.
> >       b. if the priority is unchanged, the thread does not change position
> > in
> >           the thread list.
> >       c. if the priority is lowered, the thread becomes the head of the
> > thread
> >           list."
> > 
> > (copied from
> > http://pubs.opengroup.org/onlinepubs/9699919799/functions/V2_chap02.html#tag_15_08_04_01
> > ).
> > 
> > Regards,
> >   Andrea Parri
> > 
> 
> So, I did some testing, and can confirm that the above is the behavior 
> on Linux for changes to scheduling priorities for RT processes.
> (My tests consisted of creating a multithreaded process where all
> threads are confined to the same CPU with taskset(), and each thread
> is in a CPU-bound loop. I then maipulated their priorities with
> chrt(1) and watched the CPU time being consumed with ps(1).)
> 
> Back in SUSv2 there was this text:
> 
> [[
> 6. If a thread whose policy or priority has been modified is a running 
>    thread or is runnable, it then becomes the tail of the thread list
>    for its new priority.
> ]]
> 
> And certainly Linux used to behave this way. I remember testing it, 
> and when one looks at the Linux 2.2 source code for example, one can
> see that there is a call to move_first_runqueue() in this case. At some
> point, things changed, and I have not investigated exactly where that
> change occurred (but I imagine it was quite a long time ago).
> 
> Looking at SUSv4, let's expand the range of your quote, since
> point 7 is interesting. Here's text from Section 2.8.4 
> "Process Scheduling" in POSIX.1-2008/SUSv4 TC2:
> 
> [[
> 7. If a thread whose policy or priority has been modified other 
>    than by pthread_setschedprio() is a running thread or is runnable,
>    it then becomes the tail of the thread list for its new priority.
> 8. If a thread whose priority has been modified by pthread_setschedprio()
>    is a running thread or is runnable, the effect on its position in the
>    thread list depends on the direction of the modification, as follows:
>    a. If the priority is raised, the thread becomes the tail of the 
>       thread list.
>    b. If the priority is unchanged, the thread does not change position 
>       in the thread list.
>    c. If the priority is lowered, the thread becomes the head of the
>       thread list.
> ]]
> 
> (Note that the preceding points mention variously sched_setscheduler(),
> sched_setsparam(), and pthread_setschedprio(), so that the mention of
> just pthread_setschedprio() in points 7 and 8 is significant.)
> 
> Now, since chrt(1) uses sched_setscheduler(), rather than 
> pthread_setschedprio(), then arguably the Linux behavior is a
> violation of POSIX. (Indeed, buried in the man-pages source, I find 
> that I many years ago wrote the comment:
> 
>     In 2.2.x and 2.4.x, the thread is placed at the front of the queue
>     In 2.0.x, the Right Thing happened: the thread went to the back -- MTK
> 
> But the Linux behavior seems reasonable to me and I'm inclined
> to just document it (see the patch below). But I CCed Peter and Thomas 
> in case they have some thoughts on the topic.

IAC, thank you for this info/patch.

  Andrea


> 
> Cheers,
> 
> Michael
> 
> diff --git a/man7/sched.7 b/man7/sched.7
> index ea865b1d5..198e267b7 100644
> --- a/man7/sched.7
> +++ b/man7/sched.7
> @@ -165,18 +165,38 @@ blocked again.
>  When a blocked \fBSCHED_FIFO\fP thread becomes runnable, it
>  will be inserted at the end of the list for its priority.
>  .IP 3)
> -A call to
> +If a call to
>  .BR sched_setscheduler (2),
>  .BR sched_setparam (2),
> +.BR sched_setattr (2),
> +.BR pthread_setschedparam (3),
>  or
> -.BR sched_setattr (2)
> -will put the
> -\fBSCHED_FIFO\fP thread identified by
> -\fIpid\fP at the start of the list if it was runnable.
> -As a consequence, it may preempt the currently running thread if
> -it has the same priority.
> -(POSIX.1 specifies that the thread should go to the end
> -of the list.)
> +.BR pthread_setschedprio (3)
> +changes the priority of the running or runnable
> +.B SCHED_FIFO
> +thread identified by
> +.I pid
> +the effect on the thread's position in the list depends on
> +the direction of the change to threads priority:
> +.RS
> +.IP \(bu 3
> +If the thread's priority is raised,
> +it is placed at the end of the list for its new priority.
> +As a consequence,
> +it may preempt a currently running thread with the same priority.
> +.IP \(bu
> +If the thread's priority is unchanged,
> +its position in the run list is unchanged.
> +.IP \(bu
> +If the thread's priority is lowered,
> +it is placed at the front of the list for its new priority.
> +.RE
> +.IP
> +According to POSIX.1-2008,
> +changes to a thread's priority (or policy) using any mechanism other than
> +.BR pthread_setschedprio (3)
> +should result in the thread being placed at the end of
> +the list for its priority.
>  .\" In 2.2.x and 2.4.x, the thread is placed at the front of the queue
>  .\" In 2.0.x, the Right Thing happened: the thread went to the back -- MTK
>  .IP 4)
> 
> 
> -- 
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
