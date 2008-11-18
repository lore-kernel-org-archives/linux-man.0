From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: For review: pthread_attr_setinheritsched.3
Date: Tue, 18 Nov 2008 08:50:42 -0500
Message-ID: <4922C832.6020705@gmail.com>
References: <cfd18e0f0811100509y3b6ba724w45393697f68bc719@mail.gmail.com> <4921CAC2.7080502@domaigne.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4921CAC2.7080502-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, "brian m. carlson" <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>, Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Loic,


> yet another review... Enough for today ;-)

And thanks once again!

[...]

>> .SH DESCRIPTION
>> The
>> .BR pthread_attr_setinheritsched ()
>> function sets the inherit scheduler attribute of the
>> thread attributes object referred to by
>> .IR thread
> 
> should be "attr"

Thanks; fixed.

[...]

>> .SH BUGS
>> As at glibc 2.8, if a thread attributes object is initialized using
>> .BR pthread_attr_init (3),
>> then the scheduling policy of the attributes object is set to
>> .BR SCHED_OTHER
>> and the scheduling priority is set to 0.
>> However, if the inherit scheduler attribute is then set to
>> .BR PTHREAD_EXPLICIT_SCHED ,
>> then a thread created using the attribute object
>> wrongly inherits its scheduling attributes from the creating thread.
>> This bug does not occur if either the scheduling policy or
>> scheduling priority attribute is explicitly set
>> in the thread attributes object before calling
>> .BR pthread_create (3).
>> .\" FIXME . Track status of the following bug:
>> .\" http://sourceware.org/bugzilla/show_bug.cgi?id=7007
> 
> You raised an interesting issue. I checked the code responsible for
> pthread_create(). As a matter of fact, Glibc shall only take the 
> explicit scheduling if either the policy or priority has been set.

Agreed, that is what I also determined from reading the code.

> This
> makes somehow sense: if you want explicit scheduling, you should at 
> least set one of the two parameters, shouldn't you?

Yes, except that there are defaults that can be inspected in the
attr object, and these defaults are not honored when a thread is
actually created.  That seems wrong to me.

> I was wondering how other Pthreads implementation behave in this case. 
> Did you discuss this topic on Austin?

I didn't raise this on Austin, but Solaris 8 does what I would expect.

Cheers,

Michael


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
