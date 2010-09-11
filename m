From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: About thread-safety information in library functions' man-pages
Date: Sat, 11 Sep 2010 06:06:16 +0200
Message-ID: <AANLkTimcJ4kSuB-vZSY2_CYDs12S0ODup9-Y9yj-uQrJ@mail.gmail.com>
References: <4C7C9EA6.90609@cn.fujitsu.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4C7C9EA6.90609-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: pasky-AlSwsSmVLrQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Peng Haitao,

On Tue, Aug 31, 2010 at 8:18 AM, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> wrote:
> Hi Michael and all,
>
> When doing multithreaded programming, it is necessary to know the thread-safety
> levels of the library functions.

Yes.

> However, there is little thread-safety
> information in current man-pages.

At the moment, there is just pthreads(7), really.

> And the lack of information often makes us
> confused when programming in multithreaded environment.
>
> If we could add information about functions' thread-safety levels based on
> POSIX standard into man-pages, just like man-pages in Solaris, it will be
> more helpful to programmers who are doing multithreaded programming with GLIBC.
>
> For function whose thread-safety level is clear, I have made several patches
> which contain detailed descriptions of the thread-safety levels. The attached
> patches can be as samples. If necessary, I will gradually make more patches
> to enhance thread-safety information in man-pages. So what do you think?
>
> I am looking forward to your feedback soon!

The idea is good, but clearly there'd be a lot of work to do. Looking
at Sun's attr(5) page
http://docs.sun.com/app/docs/doc/816-0220/6m6nkoroc?l=en&a=view
suggests to me that we might be better to do this more formally, since
there are a number of attributes that may be of interest to
programmers, e.g.,

thread-safetcy
reentrant/nonreentrant
async-signal-safety
cancelation safety

By "formal" I mean that we could have a section "ATTRIBUTES" that
lists such attributes. That section could fall between VERSIONS and
CONFORMING TO (see man-pages(7)). To start with, you might write
patches that document just thread-safety, but later other pieces might
get added as well (e.g., async-signal-safety).

What do you think? If this sounds sensible, write one or two patches
in the style I suggest, and then we can discuss furtehr.

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
