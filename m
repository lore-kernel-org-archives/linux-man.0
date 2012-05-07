From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: aio manuals
Date: Tue, 8 May 2012 08:40:46 +1200
Message-ID: <CAKgNAkh9jnybota9W_-iD6Uc6c2pJuMiTus2GLk53ysvCVhhRQ@mail.gmail.com>
References: <20110309180600.GA14533@saboteur.suse.cz> <x49ei6gnpsx.fsf@segfault.boston.devel.redhat.com>
 <20110316104356.GB32095@saboteur.suse.cz> <x49pqpr9m5l.fsf@segfault.boston.devel.redhat.com>
 <20110316152018.GG2096@saboteur.suse.cz> <20111013082918.GA17800@saboteur.suse.cz>
 <CAKgNAkj68CwJFkqYNvz5X5Jt+6xTwVb1eR+vSkXmFYorQvHJ5A@mail.gmail.com> <x4962c8t8b8.fsf@segfault.boston.devel.redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <x4962c8t8b8.fsf-RRHT56Q3PSP4kTEheFKJxxDDeQx5vsVwAInAS/Ez/D0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, May 8, 2012 at 1:44 AM, Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>
>> On Thu, Oct 13, 2011 at 9:29 PM, Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org> wrot=
e:
>>> Hi!
>>>> > > So should we settle for memset()? I could update send updated =
patch
>>>> > > then.
>>>> >
>>>> > Yeah, memset is what I typically have done.
>>>> >
>>>>
>>>> Here comes updated patch.
>>>
>>> I've checked the latest man pages git and these changes aren't ther=
e
>>> yet. Any comments?
>>
>> So, I'm struggling. What is the relationship between the io_*()
>> functions in libaio and the io_*() syscalls?
>
> The io_* library calls are wrappers around the system calls. =A0In so=
me
> cases, the wrappers simply pass the arguments on to the system call. =
=A0In
> other cases, there is some work performed by the library.
>
>> The page was attempting to document the system calls, which use
>> aio_context_t structures,
>
> Well, aio_context_t is not a structure, it's just an unsigned long.
>
> I guess that we'll ultimately need the io_* syscalls documented in
> chapter 2, and the library function documented in chapter 3, right?

Jeff,

Quick question: where is the canonical home of libaio? It's not easy
to find. I'd like to ensure I'l looking at the latest sources, ideally
by pulling from a VCS.

Cheers,

Michael
--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
