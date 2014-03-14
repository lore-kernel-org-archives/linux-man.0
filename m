From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] new Page: isalpha__3(3)
Date: Fri, 14 Mar 2014 12:05:34 +0100
Message-ID: <CAKgNAkin692aniSVcN6ByDEyNDWHDaNx6KFtoHAeeBrhuFywQw@mail.gmail.com>
References: <5315F2B5.2040009@bfs.de> <531DBD1F.5090400@gmail.com> <CACKs7VCcOGugkbs-=Rmu0XiBtiWEvHU8oyCKqKtdLMw2AfDJMQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACKs7VCcOGugkbs-=Rmu0XiBtiWEvHU8oyCKqKtdLMw2AfDJMQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bruno Haible <bruno-nWNVUoHt2MvYtjvyW6yDsg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[CC restored, since I think this is a point that others may have comments on]

Hi Stefan,

On Thu, Mar 13, 2014 at 1:23 PM, Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Michael,
>
> Small nit about your wcstombs example below:
>
> On Mon, Mar 10, 2014 at 3:24 PM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> [...]
>> ---8x------8x------8x------8x------8x------8x------8x------8x------8x---
> [...]
>>     printf("Length of source string (excluding terminator):\n");
>>     printf("    %ld bytes\n", (long) strlen(argv[2]));
>>     printf("    %ld multibyte characters\n\n", (long) mbslen);
>
> Why not use %zu for mbslen and strlen(argv[2])? Both are size_t as far
> as I can tell. Then you wouldn't need the cast.

The 'z' specifier is a C99 invention as I recall, and it took a few
years before it became widespread. For example, it wasn't on Sun's
libc for Solaris 8, and reading some man pages suggests that it wasn't
there on Solaris 9 (released in 2002), though it was there by Solaris
10 (2005). Likewise, FreeBSD seems to have since it version 5 (2003).

So although glibc has had 'z' for a long time (at least as far back as
glibc 2.1 at the start of 1999, though I suspect a little earlier as
well), there were even a few years ago a lot of installed non-Linux
systems that didn't support it.

So, for portable code, I've tended to almost reflexively use
%ld+(long). Probably, the need to do that is less pressing now. There
are many fewer of those installed legacy systems these days. I'll
change that code for the mbstowcs() page to use %zu.

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
