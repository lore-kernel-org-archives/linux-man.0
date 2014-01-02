From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: "Writing" instead of "Warning" in dlopen(3) manpage
Date: Fri, 3 Jan 2014 08:20:50 +1300
Message-ID: <CAKgNAkjeDs21b36mULBF6VFQeoKeVOEDnRj=7GPTmchci-xDzA@mail.gmail.com>
References: <20131231124209.GA4814@darkstar> <201401012306.40108.vapier@gentoo.org>
 <CAKgNAkjYTw3_BGQKwVNyfs-rLmxgVMiH4hBy_gBm=9DpvSHnFA@mail.gmail.com> <201401020733.11627.vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201401020733.11627.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: noname <noname-CuI0ZDT4mYnsrOwW+9ziJQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Mike,

On Fri, Jan 3, 2014 at 1:33 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> On Thursday 02 January 2014 04:33:30 Michael Kerrisk (man-pages) wrote:
>> On Thu, Jan 2, 2014 at 5:06 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
>> > On Wednesday 01 January 2014 20:46:59 Michael Kerrisk (man-pages) wrote:
>> >> Nevertheless, some compilers
>> >> (e.g., gcc with the '-pedantic' option) may complain about the cast
>> >> used in this program. */
>> >
>> > three things:
>> >  - i think the ISO C standard is required to at least emit a warning
>>
>> Yes, but it's not quite clear to me if the POSIX.1-2013 is meaning
>> that compilers should not issue a warning in this case. Maybe I'm
>> misunderstanding something, though.
>
> true.  in this particular case, it's probably not worth being super pedantic
> since we covered our bases earlier on.
>
> overall question: should the new comment block live above or below the example
> call ?  it's currently below, but i kind of favor putting it before.  i know
> as the content flows, the current one makes a bit of sense (show the right
> answer, and then as an aside, mention the portability issue), but the comment
> is specifically covering this line, so putting it above the line it is
> discussing is a bit more standard i think in the coding world.

I kind of prefer it as an aside, following the code, but I've now also
added some words to more explicitly indicate that the comment refers
to the code above it.

Cheers,

Michael

    cosine = (double (*)(double)) dlsym(handle, "cos");

    /* According to the ISO C standard, casting between function
       pointers and 'void *', as done above, produces undefined results.
       POSIX.1-2003 and POSIX.1-2008 accepted this state of affairs and
       proposed the following workaround:

           *(void **) (&cosine) = dlsym(handle, "cos");

       This (clumsy) cast conforms with ISO C standard and will avoid
       any compiler warnings.

       The 2013 Technical Corrigendum to POSIX.1-2008 (a.k.a.
       POSIX.1-2013) improved matters by requiring that conforming
       implementations support casting 'void *' to a function pointer.
       Nevertheless, some compilers (e.g., gcc with the '-pedantic'
       option) may complain about the cast used in this program. */

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
