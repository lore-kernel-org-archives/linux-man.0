From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: [Groff] How to find bugs in man pages?
Date: Tue, 9 Aug 2016 07:43:09 +1200
Message-ID: <CAKgNAkhv=sFtwT--iCa3RCw6DjWcVGiDj9JozC4mdynwt88QJg@mail.gmail.com>
References: <20160621011851.GA14952@athene.usta.de> <fb67685c-a503-f27e-3f3a-ef3839fa5a0e@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fb67685c-a503-f27e-3f3a-ef3839fa5a0e-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Xose Vazquez Perez <xose.vazquez-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Xose,

On 24 June 2016 at 20:14, Xose Vazquez Perez <xose.vazquez-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi,
>
> I asked the same question in the groff ml. Ingo Schwarze,
> mandoc current maintainer, send very detailed information:
> https://lists.gnu.org/archive/html/groff/2016-06/msg00007.html

All of the below though are for pages that use "mandoc" mark-up and
BSD tools (e.g., no "man -Tlint" in the man pager provided by the
Linux "man-db" package). Generally, man pages on Linux seem to mostly
use the "man" macros. (Almost all pages in the man-pages project use
the "man" macros. There are just three pages that use "mandoc"
macros.)

Thanks,

Michael

> -------- Forwarded Message --------
> Subject: Re: [Groff] How to find bugs in man pages?
> Date: Tue, 21 Jun 2016 03:18:51 +0200
> From: Ingo Schwarze <schwarze-mcycREo4Un4@public.gmane.org>
> To: Xose Vazquez Perez <xose.vazquez-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> CC: groff-mXXj517/zsQ@public.gmane.org
>
> Hi Xose,
>
> Ralph Corderoy wrote on Sun, Jun 19, 2016 at 04:10:15PM +0100:
>> Xose wrote:
>
>>> I'm using: groff -z -b -wall manpage.x
>>> Is there anything better?
>
>> Not as far as I know.
>
> Inside groff, that is.
>
>>  That doesn't complain about these errors.
>>
>>     $ zcat /usr/share/man/man1/bash.1.gz | grep '\. [[:upper:]]'
>>     compound commands are also limited to this range. Under certain
>>     it should be bound. The name may be specified in one of two ways:
>>     is not used. The
>>     suppressing the normal shell function lookup. Only builtin
>>     $
>>
>> Perhaps a `linter' exists?
>
> Several linters exist.
>
> See here what i'm normally using:
>
>   schwarze@isnote $ uname -a
>   OpenBSD isnote.usta.de 6.0 GENERIC.MP#1875 i386
>   schwarze@isnote $ which bash
>   which: bash: Command not found.
>   schwarze@isnote $ doas pkg_add bash
>   quirks-2.239 signed on 2016-06-20T12:38:05Z
>   bash-4.3.42p0: ok
>   schwarze@isnote $ which bash
>   /usr/local/bin/bash
>   schwarze@isnote $ man -w bash
>   /usr/local/man/man1/bash.1
>   schwarze@isnote $ man -Tlint bash > tmp.txt 2>&1
>   schwarze@isnote $ wc tmp.txt
>      488    4372   39316 tmp.txt
>
> So apparently, that is an unusually crappy manual page: The standard
> OpenBSD tool for the job reports 488 lines of warnings.
>
>   schwarze@isnote $ which igor
>   /usr/local/bin/igor
>   schwarze@isnote $ igor `man -w bash` > tmp.txt 2>&1   schwarze@isnote $ wc tmp.txt
>      489    5610   42314 tmp.txt
>
> That's the standard FreeBSD tool for the job.  It agrees that there
> are many problems and reports 489 lines of warnings, many of them
> not found by OpenBSD man.  Admittedly, a handful are due to a defect
> in igor(1) which only supports mdoc(7) and not man(7), but most
> complaints of igor are valid.
>   The standard NetBSD tool for the job is mdoclint(1), which also
> supports mdoc(7) only and not man(7):
>
>   schwarze@isnote $ perl /usr/src/regress/usr.bin/mdoclint/mdoclint \
>     `man -w bash` > tmp.txt 2>&1
>   schwarze@isnote $ wc tmp.txt
>      549    6817   57839 tmp.txt
>
> Again, most complaints of mdoclint(1) are valid.
>
> I gave a tutorial on the subject at EuroBSDCon 2014 in Sofia,
> explaining purposes and methods for quality control of manual
> pages and comparing the tools:
>
>   http://www.openbsd.org/papers/eurobsdcon2014-mandoc-paper.pdf
>     (see section 3 on pages 13 to 17)
>   http://www.openbsd.org/papers/eurobsdcon2014-mandoc-slides.pdf
>     (see section QA on pages 24 to 32)
>   https://youtu.be/csA7-SUtUcw?t=58m28s
>     (Look at that *together* with the PDF slides:  You can't read
>      the slides in the video, but the slides don't contain the
>      spoken words, so both together are most useful.  The part about
>      QA lasts from t=58m28s until the end of the video, so it's
>      about 15 minutes to watch.  A few facts are slightly outdated
>      as mandoc development has progressed a lot since 2014 - for
>      example, mandoc no longer causes any fatal errors, not even
>      for completely garbage input - but most content is still
>      accurate today.)
>
>   All these are linked from here: http://mdocml.bsd.lv/press.html
>
> You can get the software discussed above here:
>
>   Portable mandoc = OpenBSD man(1):  http://mdocml.bsd.lv/
>   Igor:  http://www.wonkity.com/~wblock/igor/
>   Mdoclint:  http://cvsweb.netbsd.org/bsdweb.cgi/pkgsrc/textproc/mdoclint/
>
> Have fun,
>   Ingo
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
