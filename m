From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: aio manuals
Date: Tue, 8 May 2012 09:14:23 +1200
Message-ID: <CAKgNAkjZS0VyV4y6P-NyrLv8_a8G2K6=yFPijef3d3wfQuPwXw@mail.gmail.com>
References: <20110309180600.GA14533@saboteur.suse.cz> <x49ei6gnpsx.fsf@segfault.boston.devel.redhat.com>
 <20110316104356.GB32095@saboteur.suse.cz> <x49pqpr9m5l.fsf@segfault.boston.devel.redhat.com>
 <20110316152018.GG2096@saboteur.suse.cz> <20111013082918.GA17800@saboteur.suse.cz>
 <CAKgNAkj68CwJFkqYNvz5X5Jt+6xTwVb1eR+vSkXmFYorQvHJ5A@mail.gmail.com> <x4962c8t8b8.fsf@segfault.boston.devel.redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <x4962c8t8b8.fsf-RRHT56Q3PSP4kTEheFKJxxDDeQx5vsVwAInAS/Ez/D0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Jeff, Cyril,

On Tue, May 8, 2012 at 1:44 AM, Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>
>> On Thu, Oct 13, 2011 at 9:29 PM, Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org> wrote:
>>> Hi!
>>>> > > So should we settle for memset()? I could update send updated patch
>>>> > > then.
>>>> >
>>>> > Yeah, memset is what I typically have done.
>>>> >
>>>>
>>>> Here comes updated patch.
>>>
>>> I've checked the latest man pages git and these changes aren't there
>>> yet. Any comments?
>>
>> So, I'm struggling. What is the relationship between the io_*()
>> functions in libaio and the io_*() syscalls?
>
> The io_* library calls are wrappers around the system calls.  In some
> cases, the wrappers simply pass the arguments on to the system call.  In
> other cases, there is some work performed by the library.
>
>> The page was attempting to document the system calls, which use
>> aio_context_t structures,
>
> Well, aio_context_t is not a structure, it's just an unsigned long.

(Yep, I realized that afterward ;-).)

> I guess that we'll ultimately need the io_* syscalls documented in
> chapter 2, and the library function documented in chapter 3, right?

So, as I understand it (please correct me where I've got something
wrong), things are like this:

0. We've got the 5 kernel io_* syscalls, which use aio_context_t:
io_cancel(), io_destroy(), io_setup(), io_submit(), and
io_getevents().

1. There's a corresponding set of io_* wrappers in libaio that use
io_context_t. These wrappers are sometimes, but not always, very thin
wrappers for the system calls. Examples of thin wrappers are
io_cancel(), io_destroy(), io_setup(), and io_submit(). On the other
hand, io_getevents() is a non-thin wrapper.

2. libaio also provides a number of io_* functions that use the system
calls, but don't correspond directly to one of the kernel syscalls.
For example, io_poll() (inline in libaio.h) and io_queue_init().

3. libaio is *not* part of glibc.

4. There is a set of related man pages in the man-pages package:

a) io_*.2 pages documenting the 5 system calls. These seem to date
from early 2003, have an FSF/GPL copyright/license, and look to have
been written by Kent Yoder. These pages have seen some maintenance
over the years, but are a bit confused as to whether they are
describing the system calls or the libaio interface.

b) aio_*/lio_* pages documenting the aio interface provided by glibc.
These date from 2003 (by Andries Brouwer) and 2010 (a couple of
missing pieces and pages added by me).

(The existence of the above pages corresponds to normal man-pages
practice: man-pages aims to have a complete set if pages for for the
kernel syscalls and the glibc APIs; it's reasonably complete for the
former, but has still some gaps for the latter.

5. libaio has some man pages also. (By the way, these pages carry NO
copyright notice or license in the source file. What is the license?
One can't really imply the license from the COPYING file in the parent
directory.) These pages date from 2002, and seem to have seen no
maintenance since then. The pages are:

a) aio_*/lio_* pages documenting the aio interface provided by glibc.

b) io_*.3 pages that document interfaces provided by libaio.

c) io_*.1 pages (why ".1"?) that document the io_* system calls. But
these pages are mostly stubs. Only io_submit.1 has something like a
complete description.

Looking at the above (5a), I'm puzzled. Why is libaio providing some
man pages for glibc? It makes no sense for one library package to
provide man pages for functions implemented in a separately maintained
library. Further, it creates confusion if someone installs libaio, an
din the process overwrites man pages provided by man-pages.

Here's what I think should be done:

1) For io_submit, io_cancel, io_getevents, io_destroy, io_setup:

a) There should be .2 pages provided by man-pages that document the
raw system calls. These pages need a bit of cleaning up. These pages
should be updated to focus on the system calls, and note the existence
of libaio and the existence of the wrappers it provides.

b) There should be .3 pages provided by libaio. (The pages should be
provided by libaio, because that's the library that implements them.
If those wrappers were in glibc, then I'd have said that man-pages
should provide them.) Since the wrappers are mostly very thin, I think
it would be sufficient to have very short man pages that:
- note the need to link with "-laio"
- document io_context_t versus aio_context_t
- refer the reader to the corresponding .2 page for details of behavior.

2) For the other io_* functions provided by libaio:

a) libaio should provide man pages. (And this seems already to be the case.)

3) For the aio_* and lio_listio functions:

a) The right place to document these is man-pages, since they are
glibc interfaces, not libaio interfaces. man-pages already has such
pages.

b) The versions of these man pages in libaio should be dropped. The
pages seem to be unmaintained, and they describe interfaces that are
not even part of libaio. Along the way, we should check if there are
pieces in the libaio pages that could usefully be added to the
corresponding man-pages pages.

How does the above sound?

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
