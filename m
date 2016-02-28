From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: backtrace(3): Inconsistency and missing indentation
Date: Sun, 28 Feb 2016 20:21:48 +0100
Message-ID: <CAKgNAkj11DGcUAUFdby6R1hEA+=h+Rbbaj25Ktjs1fWr-jksLQ@mail.gmail.com>
References: <56CD772C.8030606@gmx.de> <56D07349.10901@gmail.com>
 <CAAHpriNbkVCsH-mrVi97Y57ahw=6yO=kh+C7OuLzfQXrJiJO-Q@mail.gmail.com>
 <56D0B704.8050001@gmail.com> <56D0BEBD.50908@gmx.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D0BEBD.50908-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Gebert <Murphy.Gebert-Mmb7MZpHnFY@public.gmane.org>
Cc: Keith Thompson <keithsthompson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Keith Thompson <Keith.S.Thompson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 26 February 2016 at 22:08, Martin Gebert <Murphy.Gebert-Mmb7MZpHnFY@public.gmane.org> wrote:
> Hi Keith!
>
>> I suggest leaving it as it was, apart from using SIZE in the definition > of buffer. > > It's common for preprocessor directives to be
> left-justified rather > than aligned with the surrounding code.  (They
> mostly appear at file > scope, so it's not usually an issue.)  It's
> perfectly valid to indent > the #define, but it's a bit misleading,
> since it implies that SIZE has > a scope (it doesn't, it's visible to
> the end of the translation unit).
>
> While I agree with you concerning the scope, I would then expect the
> SIZE macro be placed between the includes and the function header, as
> everything that has not a block scope. It just seems misplaced in the
> middle of the function (more exactly between the variable definitions),
> but outdented.
> More generally, if somebody wants to make clear that a macro has only
> meaning in the local block I would prefer to place it there, but indent
> it with the rest of the code. If it's supposed to be used file-wide I
> would expect it before the first function, but without indention. IMHO
> the given code snippet is a wild mix that caught my eye as being quite
> unpleasing and unintuitive. So I suggest doing it the one /or/ the other
> way; I would've preferred Michael's solution in the first place, but
> obviously that's not universal enough for a man page.
> And as a disclaimer, that's my built-in, intuitive style guide speaking,
> as I'm by no means an authority of C code formatting.

Okay, I made it

   Program source

       #include <execinfo.h>
       #include <stdio.h>
       #include <stdlib.h>
       #include <unistd.h>

       #define BT_BUF_SIZE 100

       void
       myfunc3(void)
       {
           int j, nptrs;
           void *buffer[BT_BUF_SIZE];
           char **strings;

           nptrs = backtrace(buffer, BT_BUF_SIZE);
       [...]

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
