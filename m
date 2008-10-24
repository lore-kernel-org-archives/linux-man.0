From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Review request: new pthread_exit(3) page
Date: Fri, 24 Oct 2008 12:41:57 -0500
Message-ID: <cfd18e0f0810241041n271b62ecsbe75fd957c36a3fa@mail.gmail.com>
References: <cfd18e0f0810221048h7d682a8ey71d1517302b18045@mail.gmail.com>
	 <36ca99e90810221358t2ac6090bh84fc5bba6af007fe@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <36ca99e90810221358t2ac6090bh84fc5bba6af007fe-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, "brian m. carlson" <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Bert,

Thanks for your review.  Follow-ups below.

On Wed, Oct 22, 2008 at 3:58 PM, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> On Wed, Oct 22, 2008 at 19:48, Michael Kerrisk
> <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>> Any reviews for pthread_exit(3)?
>>
>> .\" Copyright (c) 2008 Linux Foundation, written by Michael Kerrisk
>> .\"     <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> .\"
>> .\" Permission is granted to make and distribute verbatim copies of this
>> .\" manual provided the copyright notice and this permission notice are
>> .\" preserved on all copies.
>> .\"
>> .\" Permission is granted to copy and distribute modified versions of this
>> .\" manual under the conditions for verbatim copying, provided that the
>> .\" entire resulting derived work is distributed under the terms of a
>> .\" permission notice identical to this one.
>> .\"
>> .\" Since the Linux kernel and libraries are constantly changing, this
>> .\" manual page may be incorrect or out-of-date.  The author(s) assume no
>> .\" responsibility for errors or omissions, or for damages resulting from
>> .\" the use of the information contained herein.  The author(s) may not
>> .\" have taken the same level of care in the production of this manual,
>> .\" which is licensed free of charge, as they might when working
>> .\" professionally.
>> .\"
>> .\" Formatted or processed versions of this manual, if unaccompanied by
>> .\" the source, must acknowledge the copyright and authors of this work.
>> .\"
>> .TH PTHREAD_EXIT 3 2008-10-19 "Linux" "Linux Programmer's Manual"
>> .SH NAME
>> pthread_exit \- terminate calling thread
>> .SH SYNOPSIS
>> .nf
>> .B #include <pthread.h>
>>
>> .BI "void pthread_exit(void *" value_ptr );
> In the reminder you are talking about 'retval' not 'value_ptr' anymore.

Fixed.

>> .sp
>> Compile and link with \fI\-pthread\fP.
>> .SH DESCRIPTION
>> The
>> .BR pthread_exit ()
>> function terminates the calling thread and returns a value via
>> .I retval
>> that (if the thread is joinable)
>> is available to another thread in the process that calls
>> .BR pthread_join (3).
>>
>> Any clean-up handlers established by
>> .BR pthread_cleanup_push (3)
>> that have not yet been popped,
>> are popped (in the reverse of the order in which they were pushed)
>> and executed.
>> If the thread has any thread-specific data, then,
>> after the clean-up handlers have been executed,
>> the corresponding destructor functions are called,
>> in an unspecified order.
>>
>> When a thread terminates,
>> process-shared resources (e.g., mutexes, condition variables,
>> semaphores, and file descriptors) are not released,
>> and functions registered using
>> .BR atexit (3)
>> are not called.
>>
>> After the last thread in a process terminates,
>> the process terminates as by calling
>> .BR exit (3)
>> supplying an exit status of zero;
>> thus, process-shared resources
>> are released and functions registered using
>> .BR atexit (3)
>> are called.
>> .SH RETURN VALUE
>> This function does not return to the caller.
>> .SH ERRORS
>> This function always succeeds.
>> .SH CONFORMING TO
>> POSIX.1-2001.
>> .SH NOTES
>> Performing a return from the start function of any thread other
>> than the main thread results in an implicit call to
>> .BR pthread_exit (),
>> using the function's return value as the thread's exit status.
>>
>> To allow other threads to continue execution,
>> the main thread should terminate by calling
>> .BR pthread_create ()
>> rather than
>> .BR exit (3).
> This paragraph sounds wrong.

Can you say more please?  Wrong in what way?

> BTW, Linux behaves a little strange if you quit the main thread. For
> example in top the task is marked '<defunct>'. If I press Ctrl+Z the
> task go to sleep but I don't get my prompt back.

Yes.  Can you provide any pointers to further ino. bug reports
regarding that problem?

Cheers,

Michael

>> The value pointed to by
>> .IR retval
>> should not be on the located on the calling thread's stack,
>> since the contents of that stack are undefined after the thread terminates.
>> .SH EXAMPLE
>> See
>> .BR pthread_create (3).
>> .SH SEE ALSO
>> .BR pthread_create (3),
>> .BR pthread_join (3),
>> .BR pthreads (7)
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-man" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
