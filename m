From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: For review: pthread_setcancelstate.3
Date: Mon, 24 Nov 2008 13:23:37 -0500
Message-ID: <cfd18e0f0811241023n55ef2a9dk3ed77455b5c36841@mail.gmail.com>
References: <cfd18e0f0811140926r40781376t8a6340479bf8426f@mail.gmail.com>
	 <4927AEAF.6060802@domaigne.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4927AEAF.6060802-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, =?ISO-8859-1?Q?Loic_Domaign=E9?= <loic-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Loic,

Thanks for reviewing.

[...]

>> Setting the cancelability type to
>> .B PTHREAD_CANCEL_ASYNCHRONOUS
>> is rarely useful.
>> Since the thread could be canceled at
>> .I any
>> time, it cannot reserve resources (e.g., allocating memory),
>> acquire mutexes, semaphores, or locks, and so on,
>> since, when the thread is canceled,
>> the application has no way of knowing what the state of these resources
>> is;
>> that is, did the canceled thread manage to release the resources or not?
>> (Among other things, this means that clean-up handlers cease to be useful,
>> since they can't determine the state of resources that
>> they are intended to clean up.)
>> In general, most library functions, including most pthreads functions,
>> can't be safely called from an asynchronously cancelable thread.
>> (POSIX.1-2001 only requires that
>> .BR pthread_cancel (3),
>> .BR pthread_setcancelstate (),
>> and
>> .BR pthread_setcanceltype ()
>> be safe to call from an asynchronously cancelable thread.)
>> One of the few circumstances in which asynchronous cancelability is useful
>> is for cancellation of a thread that is in a pure compute-bound loop.
>
> The paragraph is important, but I found it somewhat difficult to read.

Yes, I see.  There was at least one clumsy wording "Since...since"
which made that over-long sentence had to parse.

> I
> don't pretend to compete with a native speaker, but find below a reworked
> version:
>
> Setting the cancelability type to *PTHREAD_CANCEL_ASYNCHRONOUS* is rarely
> useful. The cancelation could occur at any time, for instance in a middle of
> a library call, like malloc(), leaving possibly inconsistent state. The
> application is not aware of those internal library states, and as no
> possibly to recover from possible inconsistencies. That is, clean-up
> handlers cease to be useful.  Functions that can be safely asynchronously
> canceled are called async-cancel-safe functions. POSIX.1-2001 only requires
> pthread_cancel(3), pthread_setcancelstate(3) and pthread_setcanceltype(3) to
> be async-cancel-safe. One of the few circumstances in which asynchronous
> cancelability is useful is for cancellation of a thread that is in a pure
> compute-bound loop.

Thanks Loic.  I took some pieces of your suggestion, and arrived at
the following

       Setting  the  cancelability type to PTHREAD_CANCEL_ASYNCHRONOUS
       is rarely useful.  Since the thread could be  canceled  at  any
       time, it cannot safely reserve resources (e.g., allocating mem-
       ory with malloc(3)), acquire mutexes, semaphores, or locks, and
       so  on.   Reserving  resources is unafe because the application
       has no way of knowing what the state of these resources is when
       the  thread is canceled; that is, did cancellation occur before
       the resources were reserved, while they were reserved, or after
       they  were  released?  Consequently, clean-up handlers cease to
       be useful.  Functions that can be  safely  asynchronously  can-
       celed  are  called  async-cancel-safe  functions.  POSIX.1-2001
       only requires that pthread_cancel(3), pthread_setcancelstate(),
       and  pthread_setcanceltype() be async-cancel-safe.  In general,
       other library functions can't be safely called  from  an  asyn-
       chronously  cancelable thread.  One of the few circumstances in
       which asynchronous cancelability is useful is for  cancellation
       of a thread that is in a pure compute-bound loop.

Look okay to you?

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
