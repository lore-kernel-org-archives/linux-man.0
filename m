From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: For review: pthread_setcancelstate.3
Date: Mon, 24 Nov 2008 17:46:19 -0500
Message-ID: <cfd18e0f0811241446x79b93ac1u37078317f328e5fa@mail.gmail.com>
References: <cfd18e0f0811140926r40781376t8a6340479bf8426f@mail.gmail.com>
	 <4927AEAF.6060802@domaigne.com>
	 <cfd18e0f0811241023n55ef2a9dk3ed77455b5c36841@mail.gmail.com>
	 <492B14E7.30403@domaigne.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <492B14E7.30403-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Loic,

On Mon, Nov 24, 2008 at 3:56 PM, Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org> wrote:
> Gidday Michael,
>
>
>>> The paragraph is important, but I found it somewhat difficult to read.
>>
>> Yes, I see.  There was at least one clumsy wording "Since...since"
>> which made that over-long sentence had to parse.
>
> [...]
>
>> Thanks Loic.  I took some pieces of your suggestion, and arrived at
>> the following
>>
>>       Setting  the  cancelability type to PTHREAD_CANCEL_ASYNCHRONOUS
>>       is rarely useful.  Since the thread could be  canceled  at  any
>>       time, it cannot safely reserve resources (e.g., allocating mem-
>>       ory with malloc(3)), acquire mutexes, semaphores, or locks, and
>>       so  on.   Reserving  resources is unafe because the application
>
> s/unafe/unsafe/

Fixed.

>>       has no way of knowing what the state of these resources is when
>>       the  thread is canceled; that is, did cancellation occur before
>>       the resources were reserved, while they were reserved, or after
>>       they  were  released?  Consequently, clean-up handlers cease to
>
> worse: the invariant of some internal structures might get violated (e.g. if
> a list is used to manage chunk of memory malloc'ed, and the thread gets
> asynchronously canceled while updating the list).

Yes, maybe it's worth emphasizing that.  I added a sentence, so now we have:

       Setting  the  cancelability type to PTHREAD_CANCEL_ASYNCHRONOUS
       is rarely useful.  Since the thread could be  canceled  at  any
       time, it cannot safely reserve resources (e.g., allocating mem-
       ory with malloc(3)), acquire mutexes, semaphores, or locks, and
       so  on.   Reserving resources is unsafe because the application
       has no way of knowing what the state of these resources is when
       the  thread is canceled; that is, did cancellation occur before
       the resources were reserved, while they were reserved, or after
       they were released?  Furthermore, some internal data structures
       (e.g., the linked list of free blocks managed by the  malloc(3)
       family  of  functions)  may be left in an inconsistent state if
       cancellation occurs in the middle of the function call.  Conse-
       quently,  clean-up handlers cease to be useful.  Functions that
       can be safely asynchronously canceled are called  async-cancel-
       safe  functions.   POSIX.1-2001 only requires that pthread_can-
       cel(3), pthread_setcancelstate(),  and  pthread_setcanceltype()
       be  async-cancel-safe.   In  general,  other  library functions
       can't  be  safely  called  from  an  asynchronously  cancelable
       thread.   One  of  the  few circumstances in which asynchronous
       cancelability is useful is for cancellation of a thread that is
       in a pure compute-bound loop.

Thanks Loic.

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
