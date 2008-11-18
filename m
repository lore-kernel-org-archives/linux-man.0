From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: For review: pthread_testcancel.3
Date: Tue, 18 Nov 2008 08:49:46 -0500
Message-ID: <4922C7FA.3070609@gmail.com>
References: <cfd18e0f0811141046t66b013dev7abc0fb9a36a96bf@mail.gmail.com> <4921C98B.9000603@domaigne.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4921C98B.9000603-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Loic Domaigne wrote:
> Fine with me,

Thanks for checking the page over Loic.

Cheers,

Michael

>> Okay -- really the last one for today.  Any reviewers for 
>> pthread_testcancel.3
>>
>> Cheers,
>>
>> Michael
>>
>> .\" Copyright (c) 2008 Linux Foundation, written by Michael Kerrisk
>> .\"     <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> .\"
>> .\" Permission is granted to make and distribute verbatim copies of this
>> .\" manual provided the copyright notice and this permission notice are
>> .\" preserved on all copies.
>> .\"
>> .\" Permission is granted to copy and distribute modified versions of 
>> this
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
>> .TH PTHREAD_TESTCANCEL 3 2008-11-14 "Linux" "Linux Programmer's Manual"
>> .SH NAME
>> pthread_testcancel \- request delivery of any pending cancellation 
>> request
>> .SH SYNOPSIS
>> .nf
>> .B #include <pthread.h>
>>
>> .B void pthread_testcancel(void);
>> .sp
>> Compile and link with \fI\-pthread\fP.
>> .SH DESCRIPTION
>> Calling
>> .BR pthread_testcancel ()
>> creates a cancellation point within the calling thread,
>> so that a thread that is otherwise executing code that contains
>> no cancellation points will respond to a cancellation request.
>>
>> If cancelability is disabled (using
>> .BR pthread_setcancelstate (3)),
>> or no cancellation request is pending,
>> then a call to
>> .BR pthread_cancel ()
>> has no effect.
>> .SH RETURN VALUE
>> This function does not return a value.
>> If the calling thread is cancelled as a consequence of a call
>> to this function, then the function does not return.
>> .SH ERRORS
>> This function always succeeds.
>> .\" SH VERSIONS
>> .\" Available since glibc 2.0
>> .SH CONFORMING TO
>> POSIX.1-2001.
>> .SH EXAMPLE
>> See
>> .BR pthread_cleanup_push (3).
>> .SH SEE ALSO
>> .BR pthread_cancel (3),
>> .BR pthread_cleanup_push (3),
>> .BR pthread_setcancelstate (3),
>> .BR pthreads (7)
>>
> 
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
