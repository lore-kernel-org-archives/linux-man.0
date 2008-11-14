From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: For review: pthread_setaffinity_np.3
Date: Fri, 14 Nov 2008 11:04:02 -0500
Message-ID: <cfd18e0f0811140804w5380e159l4a8ecf827ab86bad@mail.gmail.com>
References: <cfd18e0f0811041447w57dd5de4he68ca780ed963074@mail.gmail.com>
	 <4916133A.8060209@domaigne.com>
	 <cfd18e0f0811140704l18e5741fgdbb5a6c52fb8cbe7@mail.gmail.com>
	 <cfd18e0f0811140738i33f2c671kc99bbb7750f2fa44@mail.gmail.com>
	 <36ca99e90811140752t1c04f87do88926777d2be614a@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <36ca99e90811140752t1c04f87do88926777d2be614a-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>, Paul Jackson <pj-sJ/iWh9BUns@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, "brian m. carlson" <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>, Stefan Puiu <stefanpuiuro-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Nov 14, 2008 at 10:52 AM, Bert Wesarg
<bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> On Fri, Nov 14, 2008 at 16:38, Michael Kerrisk
> <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>> [CC += "Paul Jackson" <pj-sJ/iWh9BUns@public.gmane.org>, who might want to Ack the patch below]
>>
>>>> This might be obvious to all of you, but it wasn't to me... The CPU set used
>>>> for the affinity is the intersection of the set passed to
>>>> pthread_setaffinity_np() and the set of processors supported by the
>>>> kernel...
>>>>
>>>> That's why your example shall work, even if the system where it runs has
>>>> less than 8 processors.
>>>
>>> It's true.  The page should say something to make this clearer.  I
>>> added this text to NOTES
>>>
>>>       After a call to  pthread_setaffinity_np(3),  the  set  of
>>>       CPUs  on which the thread will actually run is the inter-
>>>       section of the set specified in the cpuset  argument  and
>>>       the set of CPUs actually present on the system.  The sys-
>>>       tem may further restrict the set of  CPUs  on  which  the
>>>       thread  runs  if  the  "cpuset"  mechanism  described  in
>>>       cpuset(7) is  being  used.   These  restrictions  on  the
>>>       actual  set  of  CPUs  on  which  the thread will run are
>>>       silently imposed by the kernel.
>>
>> Of course, the sched_setaffinity.2 page also deserves similar text.  I
>> made the change below.
>>
>> Look ok?
> Yes.

Thanks.

-mtk

>> --- a/man2/sched_setaffinity.2
>> +++ b/man2/sched_setaffinity.2
>>
>> @@ -122,7 +122,10 @@ A supplied memory address was invalid.
>>  .B EINVAL
>>  The affinity bit mask
>>  .I mask
>> -contains no processors that are physically on the system.
>> +contains no processors that are currently physically on the system
>> +and permitted to the process according to any restrictions that
>> +may be imposed by the "cpuset" mechanism described in
>> +.BR cpuset (7).
>>  .TP
>>  .B EINVAL
>>  .RB ( sched_getaffinity ()
>> @@ -157,6 +160,19 @@ argument was removed, but was then restored in glibc 2.3.4,
>>  with type
>>  .SH "CONFORMING TO"
>>  These system calls are Linux-specific.
>>  .SH "NOTES"
>> +After a call to
>> +.BR sched_setaffinity (),
>> +the set of CPUs on which the process will actually run is
>> +the intersection of the set specified in the
>> +.I mask
>> +argument and the set of CPUs actually present on the system.
>> +The system may further restrict the set of CPUs on which the process
>> +runs if the "cpuset" mechanism described in
>> +.BR cpuset (7)
>> +is being used.
>> +These restrictions on the actual set of CPUs on which the process
>> +will run are silently imposed by the kernel.
>> +
>>  .BR sched_setscheduler (2)
>>  has a description of the Linux scheduling scheme.
>>  .PP
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
