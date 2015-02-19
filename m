From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: GSoc 2015 man-pages proposal: a parser for glibc feature test
 macros
Date: Thu, 19 Feb 2015 09:43:33 -0500
Message-ID: <54E5F695.1060400@redhat.com>
References: <CAKgNAkgXgVjNDU=aSVXfdZ5xmo6TZ6qCXhVRNBqte69u6Kas3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkgXgVjNDU=aSVXfdZ5xmo6TZ6qCXhVRNBqte69u6Kas3A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 02/19/2015 03:30 AM, Michael Kerrisk (man-pages) wrote:
> Hi Carlos,
> 
> I wonder if I might be able to engage you as a backup mentor for a
> GSoC project that I am proposing here:
> https://www.kernel.org/doc/man-pages/gsoc_2015.html
> 
> The basic idea is to produce a parser for glibc code to tell answer
> the questions: what feature test macros (FTMs) can be defined to
> expose the definition of function foo(). The purpose is then to use
> that information to update FTM information contained in the man pages.
> However, it would of course also be useful information for the glibc
> manual, should the project wish to start documenting such things. (I
> believe this information is little documented in the manual at the
> moment.)
> 
> What do you think of the idea? And would you be willing to be a backup
> mentor? (I expect little effort to be involved on your part, but GSoc
> requires two mentors for a proposal.)
> 
> BTW, if any other glibc maintainer would be willing to act as a backup
> mentor, I'd be happy hear from you.

I would be happy to be a backup mentor.

The idea sounds interesting. I don't know that all combinations of
FTMs are designed to be allowed, and I expect that the result will
always need some human expert cleanup. Therefore it would be good
to have glibc developer review of the results. I'm not suggesting
I should be that reviewer, but the community should review to make
sure it's correct.

Cheers,
Carlos.


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
