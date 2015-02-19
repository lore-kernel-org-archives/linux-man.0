From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: GSoc 2015 man-pages proposal: a parser for glibc feature test macros
Date: Thu, 19 Feb 2015 09:30:15 +0100
Message-ID: <CAKgNAkgXgVjNDU=aSVXfdZ5xmo6TZ6qCXhVRNBqte69u6Kas3A@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Carlos,

I wonder if I might be able to engage you as a backup mentor for a
GSoC project that I am proposing here:
https://www.kernel.org/doc/man-pages/gsoc_2015.html

The basic idea is to produce a parser for glibc code to tell answer
the questions: what feature test macros (FTMs) can be defined to
expose the definition of function foo(). The purpose is then to use
that information to update FTM information contained in the man pages.
However, it would of course also be useful information for the glibc
manual, should the project wish to start documenting such things. (I
believe this information is little documented in the manual at the
moment.)

What do you think of the idea? And would you be willing to be a backup
mentor? (I expect little effort to be involved on your part, but GSoc
requires two mentors for a proposal.)

BTW, if any other glibc maintainer would be willing to act as a backup
mentor, I'd be happy hear from you.

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
