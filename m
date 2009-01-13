From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Review request: rtld-audit(7)
Date: Tue, 13 Jan 2009 13:22:29 +1300
Message-ID: <496BDEC5.9070907@gmail.com>
References: <cfd18e0f0901112107h4bfe3f64pa6e46136e2cc1e17@mail.gmail.com> <20090113170839.GD21648@machine.or.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090113170839.GD21648-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Petr 

Petr Baudis wrote:
>   Hi!
> 
>   I'm sorry, I won't have time to review the manpage in detail in the
> nearest future. :-( So three nits is all I can offer...

Thanks for taking a look anyway...

> On Mon, Jan 12, 2009 at 06:07:14PM +1300, Michael Kerrisk wrote:
>> .TH RTLD-AUDIT 7 2009-01-12 "Linux" "Linux Programmer's Manual"
>> .SH NAME
>> rtld-audit \- auditing API for the dynamic linker
>> .SH SYNOPSIS
>> .B #define _GNU_SOURCE
>>
>> .B #include <link.h>
>> .SH DESCRIPTION
>> The GNU dynamic linker (run-time linker)
> 
> The parentheses look awkward, is it necessary to have?

Better to have, IMO.

>> provides an auditing API that allows an application
>> to be notified when various dynamic linking events occur.
>> This API is very similar to the auditing interface provided by the
>> Solaris run-time linker.
> 
> So there _are_ differences? "compatible with", maybe?

Actually, I think "very similar" is probably better.  To me, "compatible"
implies something even closer to "they are the same".

>> The necessary constants and prototypes are defined by including
>> .IR <link.h> .
>>
>> To use this interface, the programmer creates a shared library
>> that implements a standard set of function names.
>> Not all of the functions need to be implemented: in most cases,
>> if the programmer is not interested in a particular class of auditing event,
>> then no implementation needs to be provided for the corresponding
>> auditing function.
>>
>> To employ the auditing interface, the environment variable
>> .BR LD_AUDIT
>> must be defined to contain a colon-separated list of shared libraries,
>> each of which can implement (parts of) the auditing API.
>> .\" FIXME Does specifying multiple audit libraries actually work
>> .\" on GNU?  My simple tests on Solaris work okay, but not on
>> .\" Linux -- mtk, Jan 2009
>> .\" glibc bug filed: http://sourceware.org/bugzilla/show_bug.cgi?id=9733
> 
> Make a BUGS section for this?

I'm still not 100% sure whether this is a bug in glibc, or a bug in my
understanding, so, I'm reluctant at this stage to write it up
in a BUGS section.

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
