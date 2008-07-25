From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: math_error.7 draft 4, for review
Date: Fri, 25 Jul 2008 12:16:24 +0200
Message-ID: <cfd18e0f0807250316k4bb6cbd1t8c6f20317f669c4a@mail.gmail.com>
References: <cfd18e0f0807210323m4912a31pa5359c2b7409167c@mail.gmail.com>
	 <cfd18e0f0807210325m7606441as19811b6802661a8c@mail.gmail.com>
	 <m3zlo6b9b8.fsf@gromit.moeb>
	 <cfd18e0f0807250236y476023fan90e97822e772859e@mail.gmail.com>
	 <m37ibab7sr.fsf@gromit.moeb>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m37ibab7sr.fsf-Qr39nsLl7G5WFLYQ/5USTw@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas Jaeger <aj-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org>
Cc: Fabian Kreutz <kreutz-WMH0Fc3rTAP1qYPpFx2fzhvVK+yQ3ZXh@public.gmane.org>, Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Jul 25, 2008 at 12:02 PM, Andreas Jaeger <aj-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org> wrote:
> "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:
>
>> On Fri, Jul 25, 2008 at 11:30 AM, Andreas Jaeger <aj-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org> wrote:
>>> "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:
>>>
>>>> [CC+= Andries]
>>>>
>>>> On Mon, Jul 21, 2008 at 12:23 PM, Michael Kerrisk
>>>> <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>>>>> [Ooops -- wrong list CCed on previous mail; and this time, I'll update
>>>>> the draft number]
>>>>>
>>>>> Andreas,
>>>>>
>>>>> The latest version of the page is below.
>>>
>>> This one looked ok to me,
>>
>> Thanks Andreas.
>>
>> So I've been testing all of the math functions lately (on glibc 2.8),
>> and I discover the following:
>>
>> a) on error, many functions set errno AND raise an exception (fetestexcept()).
>> b) on error, a few functions set errno but DON"T raise an exception
>> (fetestexcept()).
>> c) on error, a few functions DON'T set errno BUT DO raise an exception
>> (fetestexcept()).
>> d) on error, a very few functions pursue a mixture of all of the
>> above, depending on the error.
>>
>> My math_error.7 page currently implies that all functions should do
>> a).  Clearly I'll need to amend that.
>>
>> But the main question is, should I raise a pile of glibc bugs for the
>> functions in cases b), c), and d)?
>
> I suggest to discuss on the libc-alpha mailing list first.

Okay -- I have done so.

> We have not done the exception handling properly.  errno setting should
> be correct, we have tests for these,

Well, for example, according to my tests, cos(3) does not set errno.
Is that what you would have expected?

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
