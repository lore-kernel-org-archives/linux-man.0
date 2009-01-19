From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: New manpage for betoh64() and friends
Date: Mon, 19 Jan 2009 13:51:36 +1300
Message-ID: <cfd18e0f0901181651h2f9b86b4lfdad1141194b0224@mail.gmail.com>
References: <4873E122.1010504@ii.nl> <496DBD70.2010601@gmail.com>
	 <4973C4D6.8010902@ii.nl>
	 <cfd18e0f0901181628v7d860dedw91bf4c68655e3cd8@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0901181628v7d860dedw91bf4c68655e3cd8-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nanno Langstraat <nlcom_os-lQF5CfOoLd8@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Jan 19, 2009 at 1:28 PM, Michael Kerrisk
<mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> Hi Nanno,
>
> On Mon, Jan 19, 2009 at 1:09 PM, Nanno Langstraat <nlcom_os-lQF5CfOoLd8@public.gmane.org> wrote:
>> Michael Kerrisk wrote:
>>> The version of the page that is currently committed for release in
>>> man-pages-3.17 is shown below.  Let me know if you see anything
>>> that needs fixing.
>>>
>>> .SH "CONFORMING TO"
>>> These functions are non-standard, but present on the BSDs,
>>> where the required header file is
>>> .I <sys/endian.h>
>>> instead of
>>> .IR <endian.h> .
>>>
>>
>> Alright, so it turns out that this is not accurate because of Ulrich
>> Drepper's beNtoh() versus OpenBSD's betohN() deviation.
>
> Yes, see my previous mail.
>
>> (and FreeBSD into the mix is even more muddled: they got an earful from
>> Theo de Raadt over this issue)
>
> Muddled in what sense?  (See my comparisons of the names below.)
>
>> Suggestion:
>>
>> .SH "CONFORMING TO"
>> These functions are non-standard. The BSDs contain similar but not wholly identical functions in header file
>> .I <sys/endian.h>
>> (instead of glibc's
>> .IR <endian.h> ).
>
> Unless I've missed something, the situtation seems to be this:
> * FreeBSD, NetBSD, and glibc all use *exactly) the same naming
> convention, so that they have, e.g., le16toh.
> * OpenBSD uses a different convention, so that they have, e.g.,
> letoh16.  (This naming convention seems to me a little more sensible.)
>
> I'm guessing that the order of events went like this:
>
> 1) OpenBSD provided the first implementation.
> 2) the other BSDs added the interfaces but changed the naming convention.
> 3) Ulrich Drepper opted to follow FreeBSD's naming convention (which
> seems a reasonable thing to do, given that that is the dominat BSD).
>
> Do you know if that is the order in which things happened?

Oky -- so I found
http://thread.gmane.org/gmane.os.openbsd.tech/15161/focus=15179
and
http://thread.gmane.org/gmane.os.freebsd.devel.hackers/32852
which answer all my questions, I think.

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
