From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: For review: pthread_cancel.3
Date: Mon, 24 Nov 2008 12:30:47 -0500
Message-ID: <cfd18e0f0811240930s4449cd8dn398ea6fda656057a@mail.gmail.com>
References: <cfd18e0f0811140917q5340504akc53d7ffa3eea483@mail.gmail.com>
	 <4921C900.6040302@domaigne.com> <4922C93D.1010804@gmail.com>
	 <4927AC30.6030107@domaigne.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4927AC30.6030107-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Loic,

On Sat, Nov 22, 2008 at 1:52 AM, Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org> wrote:
> Gidday Michael,
>
>>>> Asynchronous cancelability
>>>> means that the thread can be canceled at any time
>>>> (usually immediately, but the system does not guarantee this).
>>>> Deferred cancelability means that cancellation will be delayed until
>>>> the thread next calls a function that is a
>>>> .IR "cancellation point" .
>>>> A list of functions that are or may be cancellation points is provided
>>>> in
>>>> .IR pthreads (7).
>>>
>>> It is very important to document the list of functions that are/are not
>>> CP in the "may be a CP" list: this is system specific and belongs to the
>>> system documentation.
>>
>> For man-pages-3.14, I have added POSIX.1's lists of "are" and "may be"
>> cancellation points to pthreads.7.
>>
>> However, it unclear to me how one determines the list of functions
>> that are cancellation points under glibc.  Do you have some ideas
>> about this?
>
> I checked out, and I found no obvious to extract the information
> automatically from the source.

Me neither.

> We may have to ask support from the Glibc
> folks.

I just shot a note into libc-help@ (and CCed you).

>>>> .SH NOTES
>>>> On Linux, cancellation is implemented using signals.
>>>> Under the NPTL threading implementation,
>>>> the first real-time signal (i.e., signal 32) is used for this purpose.
>>>
>>> Hmmm... You are right: NPTL uses the first real-time signal (32) provided
>>> by the *kernel*. As a matter of fact, Glibc reserves kernel real-time
>>> signals 32 and 33 for NPTL; real-time queued signals available to the
>>> application ranges from SIGRTMIN (34) to SIGRTMAX(64).
>>
>> Yes... exactly.
>>
>>>> On LinuxThreads, the second real-time signal is used,
>>>> if real-time signals are available, otherwise
>>>> .B SIGUSR2
>>>> is used.
>>>
>>> IIRC, this was true on 'older LinuxThreads'. Never used real-time queued
>>> signals as well ? (To verify...)
>>
>> I'm not quite sure what you want to say there.  Can you say some
>> more please.
>
> Sorry, typo and missing words make this sentence hard to understand...
> Second try:
>
> Newer version of LinuxThreads uses RT signal as well? (this claim has to be
> verified).

Yes, more recent LinuxThreads uses RT signals as well.

[...]

Thanks,

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
