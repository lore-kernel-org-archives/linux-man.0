From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: For review: CPU_SET.3
Date: Fri, 14 Nov 2008 12:01:17 -0500
Message-ID: <cfd18e0f0811140901i53ad05d3w194092e26fca880@mail.gmail.com>
References: <cfd18e0f0811130606k1586607cy7846aee91d37c53b@mail.gmail.com>
	 <36ca99e90811131045o78507ee9wd603a3d64ea79c29@mail.gmail.com>
	 <cfd18e0f0811131908y4b948844m680566bb27404666@mail.gmail.com>
	 <36ca99e90811140802w421a6846ga3c76546ffd25c5a@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <36ca99e90811140802w421a6846ga3c76546ffd25c5a-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Bert,

[...]

>>> Even I like to see the equivalent C prototypes, I think this should be
>>> noted earlier that these are actually macros.
>>
>> Well, I do mention that they are macros a number of times.  What more
>> do you think I should add?
> Hmm, I thought something like "hey these are only theoretical C prototypes"

How about this text, which I added to notes:

==
The data types for arguments and return values shown
in the SYNOPSIS are hints what about is expected in each case.
However, since these these interfaces are implemented as macros,
the compiler won't necessarily catch all type errors
if you violate the suggestions.
==

> New version looks good.

Thanks for looking it over.

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
