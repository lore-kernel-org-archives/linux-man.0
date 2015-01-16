From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch 0/7] Use "FILE * stream" everywhere.
Date: Fri, 16 Jan 2015 16:04:04 -0500
Message-ID: <54B97CC4.4030003@redhat.com>
References: <54B882F4.1090203@redhat.com> <54B8ABBF.8000602@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54B8ABBF.8000602-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 01/16/2015 01:12 AM, Michael Kerrisk (man-pages) wrote:
> Hello Carlos,
> 
> On 01/16/2015 04:18 AM, Carlos O'Donell wrote:
>> Harmonize all the manual pages to use "stream" for FILE*
>> instead of randomly using "fp" or "stream." Choosing something
>> and being consistent helps users scan the man pages quickly
>> and understand what they are looking at.
> 
> Agreed, and thanks for preparing the patches.
> 
>> The next 7 patches convert all instances of "FILE *fp" to
>> "FILE *stream". The vast majority of man pages already use
>> the "FILE *stream" version which I also prefer.
> 
> Yes, good. It's what POSIX uses too.
> 
> I tweaked some wordings very slightly (adding or removing "the" 
> in a couple of places), and gave the patches the title:
> 
>     Consistency fix: use "stream" as name for "FILE *" argument
> 
> I also made related changes in fmemopen(3), fopencookie(3), and
> getline(3).

Thanks!

Cheers,
Carlos.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
