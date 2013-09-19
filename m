From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: POSIX.1-2013 man pages for review
Date: Thu, 19 Sep 2013 13:00:08 +0200
Message-ID: <CAKgNAki+jTS9rkORvcPNxWcStNjnNTnt_jqBYcfoaYm7d4GxqQ@mail.gmail.com>
References: <523AAEEE.5090602@gmail.com> <523AB978.2080607@barfooze.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <523AB978.2080607-Am5OCHYCrcUb1SvskN2V4Q@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Spencer <maillist-musl-Am5OCHYCrcUb1SvskN2V4Q@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Josey <ajosey-7882/jkIBncuagvECLh61g@public.gmane.org>, Felix Janda <felix.janda-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>, Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Matthew Dempsky <matthew-bfSpyvURsAhAfugRpC6u6w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi John,

Thanks for taking a look at this.

[...]

>> these pages, I would like to have further review of the pages,
>> and I am soliciting that review with this mail
>>
>> The main purposes of this review are to:
>> * detect any problems injected by the conversion process
>>    (e.g., spurious text added or deleted)
>> * find any formatting issues with the resulting pages.
>
>
>
> i've run a test script[0] using my own manpage viewer[1]
> and attached the results. it seems that ~10% of the manpages use some
> special groff features. i'd rather see these removed/replaced with something
> nroff-compatible.

I just want to check where you're coming from John. You're working on
musl, right? Does musl not use the work from the man-pages project? I
ask, because some of the pieces that your script doesn't like are also
used in the man-pages project. See below.

> [0] https://github.com/rofl0r/hardcore-utils/blob/master/tests/mantest.sh
> [1] https://github.com/rofl0r/hardcore-utils/blob/master/man.c

Looking at your log:

> === status report  ===
> total manpages        : 1143
> buggy manpages        : 137
> total failures        : 406
> unique failures       : 12
>
> bug list:
>     122 **** Unknown formatter command: .ne

Not sure about this one. From groff(7):

       .ne       Need a one-line vertical space.
       .ne N     Need N vertical space (default scaling indicator v).

I'm not sure about the circumstances where these are being applied. Felix?

>     106 **** Unknown formatter command: .TS
>     106 **** Unknown formatter command: .TE

These two are heavily used for tables in the man-pages project itself.
What's the problem/alternative?

>      24 **** Unknown formatter command: .ce

       .ce       Center the next input line.
       .ce N     Center following N input lines.

Is there an alternative?

>      14 **** Unknown formatter command: .EQ
>      14 **** Unknown formatter command: .EN

These are groff escapes to eqn(1). Is there an alternative?

>      11 **** Unknown formatter command: .nr

Not sure about this. Maybe Felix has a comment.

>       3 **** Unknown formatter command: .T&

I suspect that this is a macro that should have been converted during
the translation. Felix?

>       2 **** Unknown formatter command: .tr

groff(7) says:

       .tr abcd...
                 Translate a to b, c to d, etc. on output.

Looks like this one was in the original source. Not sure whether we
need to keep it. Felix?

>       2 **** Unknown formatter command: .in

This is heavily used in the man-pages project (albeit little used
here). Could be converted to .RS/.RE, I suppose.

>       1 **** Unknown formatter command: .Im

Looks to me as though this one should have been fixed in the
conversion, but was missed by the script. Felix, could you take a
look?

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
