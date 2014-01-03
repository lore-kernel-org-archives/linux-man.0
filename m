From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: "Writing" instead of "Warning" in dlopen(3) manpage
Date: Fri, 3 Jan 2014 15:51:14 +1300
Message-ID: <CAKgNAkh_=+i_Z6guth23WeS1ZuKSUTuQ7pXyf3q2DacomOcq6A@mail.gmail.com>
References: <20131231124209.GA4814@darkstar> <201401020733.11627.vapier@gentoo.org>
 <CAKgNAkjeDs21b36mULBF6VFQeoKeVOEDnRj=7GPTmchci-xDzA@mail.gmail.com> <201401021445.17586.vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201401021445.17586.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: noname <noname-CuI0ZDT4mYnsrOwW+9ziJQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Jan 3, 2014 at 8:45 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> On Thursday 02 January 2014 14:20:50 Michael Kerrisk (man-pages) wrote:
>>     /* According to the ISO C standard, casting between function
>>        pointers and 'void *', as done above, produces undefined results.
>>        POSIX.1-2003 and POSIX.1-2008 accepted this state of affairs and
>>        proposed the following workaround:
>>
>>            *(void **) (&cosine) = dlsym(handle, "cos");
>>
>>        This (clumsy) cast conforms with ISO C standard and will avoid
>>        any compiler warnings.
>
> "with the ISO C standard"

Thanks.

>>        The 2013 Technical Corrigendum to POSIX.1-2008 (a.k.a.
>>        POSIX.1-2013)
>
> i thought you wanted to avoid "a.k.a." ?  or does that not apply to
> parenthetical asides too ?
>
> should all these random preferences be added in man-pages(7) ?  off the top of
> my head:
>         - userspace vs user space vs user-space
>         - a.k.a. / e.g. / i.e. usage
>         - NUL usage (or lack thereof)
>         - HISTORY should be a .SS of NOTES
>         - wrapping based on periods/commas
>         - preference for 75 cols

It's one of those things that's been on my TODO list for an age. I've
made a start now, by creating a STYLE GUIDE section in man-page(7).

> some of these could even be checks added to scripts/ ...

Yes, one day...

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
