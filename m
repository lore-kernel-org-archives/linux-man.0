From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: math_error.7 draft 4, for review
Date: Fri, 25 Jul 2008 14:56:41 +0200
Message-ID: <cfd18e0f0807250556p40ae6cd3l8b6617fadabd6411@mail.gmail.com>
References: <cfd18e0f0807210323m4912a31pa5359c2b7409167c@mail.gmail.com>
	 <cfd18e0f0807210325m7606441as19811b6802661a8c@mail.gmail.com>
	 <m3zlo6b9b8.fsf@gromit.moeb>
	 <cfd18e0f0807250236y476023fan90e97822e772859e@mail.gmail.com>
	 <m37ibab7sr.fsf@gromit.moeb>
	 <cfd18e0f0807250316k4bb6cbd1t8c6f20317f669c4a@mail.gmail.com>
	 <m3y73q9ro3.fsf@gromit.moeb>
	 <cfd18e0f0807250349jaa38928kaac968720c377322@mail.gmail.com>
	 <m3myk6cel3.fsf@gromit.moeb>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m3myk6cel3.fsf-Qr39nsLl7G5WFLYQ/5USTw@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas Jaeger <aj-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org>
Cc: Fabian Kreutz <kreutz-WMH0Fc3rTAP1qYPpFx2fzhvVK+yQ3ZXh@public.gmane.org>, Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Jul 25, 2008 at 2:50 PM, Andreas Jaeger <aj-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org> wrote:
> "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:
>
>> On Fri, Jul 25, 2008 at 12:36 PM, Andreas Jaeger <aj-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org> wrote:
>>> "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:
>>>
>>>> Well, for example, according to my tests, cos(3) does not set errno.
>>>> Is that what you would have expected?
>>>
>>> No, I wouldn't.
>>
>> (Slightly confused here, since you seem to contradict my result, but
>> then the text below seems to agree with my result.  But maybe I'm just
>> misreading your text.)
>
> I was confused as well ;)
>
>>> And double checking, it's the other way round :-(.  We
>>> test the exception handling, not the error handling, so tests like
>>> (libc/math/libm-test.inc) these
>>>
>>>  TEST_f_f (cos, plus_infty, nan_value, INVALID_EXCEPTION);
>>>  TEST_f_f (cos, minus_infty, nan_value, INVALID_EXCEPTION);
>>>
>>> test that cos with input plus/minus infinity returns a NaN and raises
>>> and invalid exception which is tested with fetestexcept.  And if you
>>> have different results, please tell me,
>>
>> When I run the program belwo, this is what I see for a domain error from cos():
>>
>> $ ./a.out inf
>> errno == 0
>> fetestexcept() says: 1 FE_INVALID
>> cos(inf)=nan
>
> Which is the correct behaviour for the exception AFAIK.

Yes.   I think all of the functions that I tested gave the right
exception (except a very few that don't give an exception, but do set
errno).

> Setting of
> errno is indeed missing - if math_errhandling has the right value which
> is unfortunately missing,

Yes.  My point is that there is no consistency across the math
functions.  (And math_errhandling only tells about error reporting
behavior across all functions, so it's presence or absence isn't
really relevant to this inconsistency.)  Some set errno and give an
exception, while some do one, but not the other.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
