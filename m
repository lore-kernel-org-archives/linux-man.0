From: John Spencer <maillist-musl-Am5OCHYCrcUb1SvskN2V4Q@public.gmane.org>
Subject: Re: POSIX.1-2013 man pages for review
Date: Fri, 20 Sep 2013 15:09:03 +0200
Message-ID: <523C48EF.5080309@barfooze.de>
References: <523AAEEE.5090602@gmail.com> <523AB978.2080607@barfooze.de> <CAKgNAki+jTS9rkORvcPNxWcStNjnNTnt_jqBYcfoaYm7d4GxqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAki+jTS9rkORvcPNxWcStNjnNTnt_jqBYcfoaYm7d4GxqQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: John Spencer <maillist-musl-Am5OCHYCrcUb1SvskN2V4Q@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Josey <ajosey-7882/jkIBncuagvECLh61g@public.gmane.org>, Felix Janda <felix.janda-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>, Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Matthew Dempsky <matthew-bfSpyvURsAhAfugRpC6u6w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Michael, Felix,

On 09/19/2013 01:00 PM, Michael Kerrisk (man-pages) wrote:
>> i've run a test script[0] using my own manpage viewer[1]
>> and attached the results. it seems that ~10% of the manpages use some
>> special groff features. i'd rather see these removed/replaced with something
>> nroff-compatible.
>
> I just want to check where you're coming from John. You're working on
> musl, right? Does musl not use the work from the man-pages project? I
> ask, because some of the pieces that your script doesn't like are also
> used in the man-pages project. See below.

musl itself does not use the man-pages project currently, as the 
majority of manpages are very glibc specific. so the posix manpages 
project is _imo_ currently a much better documentation for the 
interfaces provided by musl.

i can't remember the exact outcome of the previous discussion on the 
musl mailing list, ("Linux manpages (was Re: [musl] Request for 
volunteers)"), but afaik it is unlikely that the man-pages project will 
be updated as discussed in that thread before musl 1.0 is out.

however, my interest in having the POSIX manpages use portable nroff 
syntax comes from my endeavor to build a non-bloated musl-based linux 
system, which will, at least in the basic configuration, feature the 
below nroff-only manpage viewer, since groff is incredibly bloated (over 
4 MB of compressed source code! - in comparison my man.c compiles to a 
60 KB statically linked binary) and written in C++ so it's definitely 
contrary to my goals. (not to talk about that some of the groff features 
like the tbl preprocessor are just horribly misguided and completely 
unidiomatic, introducing a completely new language namespace)

as such i'd love to see the POSIX manpages project actually deliver 
portable manpages, instead of assuming that the full-blown GNU userspace 
stack is available.


>
>> [0] https://github.com/rofl0r/hardcore-utils/blob/master/tests/mantest.sh
>> [1] https://github.com/rofl0r/hardcore-utils/blob/master/man.c
>
> Looking at your log:
>
>> === status report  ===
>> total manpages        : 1143
>> buggy manpages        : 137
>> total failures        : 406
>> unique failures       : 12
>>
>> bug list:
>>      122 **** Unknown formatter command: .ne
>
> Not sure about this one. From groff(7):
>
>         .ne       Need a one-line vertical space.
>         .ne N     Need N vertical space (default scaling indicator v).
>
> I'm not sure about the circumstances where these are being applied. Felix?
>
>>      106 **** Unknown formatter command: .TS
>>      106 **** Unknown formatter command: .TE
>
> These two are heavily used for tables in the man-pages project itself.
> What's the problem/alternative?

the problem is A) that it requires groff's tbl preprocessor, which in 
turn requires the full groff install, and B) that the tag cannot simply 
be ignored becaused the content embedded into those tags follows a 
completely random new syntax - example:
http://www.podgrid.org/linux-bible/linux-bible-page607.html

the alternative is to apply the tbl preprocessor before shipping the 
manpages and instead include the preprocessed output (cleaned up from 
groffisms as well)

as for the other groff specific formatter commands, i am refering to 
Felix' response: all of them can either be left away or in case of tbl 
and eqn the preprocessed source used instead.

Thanks,
--JS
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
