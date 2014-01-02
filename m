From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: "Writing" instead of "Warning" in dlopen(3) manpage
Date: Thu, 2 Jan 2014 22:33:30 +1300
Message-ID: <CAKgNAkjYTw3_BGQKwVNyfs-rLmxgVMiH4hBy_gBm=9DpvSHnFA@mail.gmail.com>
References: <20131231124209.GA4814@darkstar> <201312311119.55754.vapier@gentoo.org>
 <52C4C513.7020509@gmail.com> <201401012306.40108.vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201401012306.40108.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: noname <noname-CuI0ZDT4mYnsrOwW+9ziJQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Mike,

Thanks for following up.

On Thu, Jan 2, 2014 at 5:06 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> On Wednesday 01 January 2014 20:46:59 Michael Kerrisk (man-pages) wrote:
>> --- a/man3/dlopen.3
>> +++ b/man3/dlopen.3
>>
>> /* According to the C99 standard, casting 'void *' to a function pointer
>> as shown above is forbidden. POSIX.1-2003 and POSIX.2008 followed
>> C99's requirement, and proposed the following workaround:
>
> i don't want to be pedantic, buuuuut:
>  - you want to say "ISO C" rather than "C99"

Yes, good point. Fixed now.

>  - the spec says that it is "undefined behavior" rather than "forbidden"

Likewise; fixed now.

> i wonder about deleting the "followed C99's requirement" part.  they aren't
> really following the requirement since (at least 2008) says that it must be
> supported.

Yes, the language could be better. I changed it to "[they] accepted
this state of affairs"

> the "POSIX.2008" probably should be "POSIX.1-2008".  or maybe just change it
> to "POSIX.1" ?

POSIX.1-2008.

>> +           *(void **) (&cosine) = dlsym(handle, "cos");
>> +
>> +       This (clumsy) cast conforms with C99 and will avoid any compiler
>> +       warnings.
>
> might it be worth suggesting a union too ?
>         double (*cosine)(double);
>         union {
>                 void *vptr;
>                 double (*ptr)(double);
>         } cast;
>         cast.vptr = dlsym(...);
>         cosine = cast.double;

I think I'll not worry about this.

> i think this also avoids aliasing warnings and works nicely in C++ ?  or i
> could be making this up entirely :).
>
>> The 2013 Technical Corrigendum to POSIX.1-2008 (a.k.a. POSIX.1-2013)
>> improved matters by requiring that conforming implementations support
>> casting 'void *' to a function pointer.
>
> how about adding a comment inside of the man page itself linking to the POSIX
> pages ?  making it visible to end users might be too much, but for people
> maintaining the comments (i.e. you) would be good.
> http://pubs.opengroup.org/onlinepubs/009695399/functions/dlsym.html#tag_03_112_08
> http://pubs.opengroup.org/onlinepubs/9699919799/functions/dlsym.html#tag_16_96_07

Yes, good idea.

>> Nevertheless, some compilers
>> (e.g., gcc with the '-pedantic' option) may complain about the cast
>> used in this program. */
>
> three things:
>  - i think the ISO C standard is required to at least emit a warning

Yes, but it's not quite clear to me if the POSIX.1-2013 is meaning
that compilers should not issue a warning in this case. Maybe I'm
misunderstanding something, though.

>  - i was going to suggest the -pedantic thing :)
>  - seriously, you're using "e.g." after chastising me ? :D

I don't recall chastising you as such... But, in running text using
"e.g." and "i.e." often does not work well, I find (and most style
manuals agree). As I said, mostly the only place you'll find these
forms in the man pages is in parenthetical asides, as is done here.

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
