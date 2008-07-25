From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: math_error.7 draft 3, for review
Date: Fri, 25 Jul 2008 11:51:32 +0200
Message-ID: <cfd18e0f0807250251t2d150340pbb9673bf049a58bf@mail.gmail.com>
References: <cfd18e0f0807160647o776d8523yb2f1ed4f0d946911@mail.gmail.com>
	 <cfd18e0f0807210314s6556f15bue41b1af46e28f77d@mail.gmail.com>
	 <517f3f820807210326x30ce95dayf18d72ba0ce03588@mail.gmail.com>
	 <m3r69ib8sz.fsf@gromit.moeb>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m3r69ib8sz.fsf-Qr39nsLl7G5WFLYQ/5USTw@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabian Kreutz <kreutz-WMH0Fc3rTAP1qYPpFx2fzhvVK+yQ3ZXh@public.gmane.org>, Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

[CC-=LKML (my mistake at start of thread; += linux-man]

Hi Andreas,

On Fri, Jul 25, 2008 at 11:41 AM, Andreas Jaeger <aj-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org> wrote:
> "Michael Kerrisk" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>
>> [ooops -- sorry for the noise.  Wrong list CCed]
>>
>> On 7/21/08, Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>>> Andreas,
>>>
>>>  The latest version of the page is below.
>>>
>>>  ===
>>>
>>>  Hi Andreas,
>>>
>>>  (Andries suggested that you probably have the background knowledge to
>>>  help here.)
>>>
>>>  The math man pages in man-pages are in a somewhat sorry state, with
>>>  respect to the following:
>>>
>>>  * Few of the pages properly describe the special cases for Inf, -Inf,
>>>  NaN arguments (e.g., compare "man 3 log" with the POSIX.1 page "man 3p
>>>  log").
>>>
>>>  * There isn't a clear discussion of error cases, and how to determine
>>>  if an error occurrred using errno and/or fetestexcept(3).
>>>
>>>  I'm planning to fix each of the math man pages to address these
>>>  issues, and use a new page, math_error.7, as an anchor page referenced
>>>  by all of the math pages for discussion of how to handle errors.
>>>
>>>  Would you be willing to review this new page (below) to see whether it
>>>  correctly describes the glibc details?  Might you also be willing to
>>>  look at a sampling of the changed math page pages that I'll make later
>>>  this week/early next week in order to let me know I'm on the right
>>>  track in terms of the changes I'm making?
>
> In general glibc should follow the ISO C99 and Posix Standards and if
> there is any discrepancy between those and the glibc implementation,
> it's a bug.  That should help you to verify the details as well.
>
> I'll try to answer questions and should be able to look at them but I
> cannot double check each and every case myself.

Understood.  Actually, since I wrote the earlier message, I've got
more confident about the direction the pages are going in anyway.

See also my question in the other thread: should I provide bug reports
for the discrepant cases?

>>>  .I math_errhandling
>>>  identifier,
>>>  which is supposed to indicate which of these two mechanisms is in use;
>>>  the standards require that at least one be in use,
>>>  but permit both to be available.
>>>  Although glibc does not support this identifier,
>>>  in practice it supports both mechanisms.
>
> I just noticed something that's also in draft 4, so let me cite from the
> CONFORMANCE file of glibc:
>
>   Implementing MATH_ERRNO, MATH_ERREXCEPT and math_errhandling in
>   <math.h> needs compiler support: see
>
>   http://sources.redhat.com/ml/libc-hacker/2000-06/msg00008.html
>   http://sources.redhat.com/ml/libc-hacker/2000-06/msg00014.html
>   http://sources.redhat.com/ml/libc-hacker/2000-06/msg00015.html
>
> I check gcc and glibc and this is still missing,

Yes, understood.  But I had the impression that this piece is just
about whether we can use math_errhandling to determine which of errno
or fetestexcept() can be used to check for errors.  Glibc doesn't
provide math_errhandling, but the tendency seems to be that both
mechanisms are supported, with a few discrepancies.

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
