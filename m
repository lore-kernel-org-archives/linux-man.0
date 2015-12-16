From: Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org>
Subject: Re: The time(2) man page conflicts with glibc
Date: Wed, 16 Dec 2015 09:50:37 -0500
Message-ID: <CAKCAbMjrKfsT7P=Q=+1zWC68552aK=ciod0HYk3=HWMvkYW26w@mail.gmail.com>
References: <CAMe9rOoJLk8VzyJKmkOvbmBxhCj4mVA2huYtHJsdxpatbkgJ1g@mail.gmail.com>
	<mvmegen94qs.fsf@hawking.suse.de>
	<CAMe9rOr_Ydg5Nr7aV8vS0vYEFehSwFBuxrMAnCFXyyVoTF4vJQ@mail.gmail.com>
	<5671696B.3070203@gmail.com>
	<CAMe9rOqsxCEia7OWqzJ-HzZWCra5BTyYqt4japjZTw0pY=fugw@mail.gmail.com>
	<56717032.7000007@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56717032.7000007-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "H.J. Lu" <hjl.tools-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andreas Schwab <schwab-l3A5Bk7waGM@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Dec 16, 2015 at 9:07 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Yes, but the raw system call can give us EFAULT. That needs to be
> documented.
>
> By the way, what's the reason that one can't tell if it returns
> an error when time() in libc.a is used?

time() in libc.a assumes that the syscall cannot fail, so it doesn't
set errno.  And -EFAULT = (time_t) -14 = 1969-12-31T23:59:46Z is
something that time() could return *without* its being an error.  It's
kind of the same problem as strtol() has, except I honestly don't see
any way libc.a could tell the difference.

Given what other people have said about not changing the kernel-level
behavior, here's a new suggestion for the manpages:

RETURN VALUE

    Time in seconds since the Epoch.

ERRORS

    EFAULT `t` is non-NULL and points outside your accessible
    address space (but see BUGS).

    On systems where the C library time() wrapper  function invokes
    an implementation provided by the vdso(7) (so that there is no
    trap into the kernel), an invalid address may instead trigger a
    SIGSEGV signal.  Note that whether vdso(7) is used may depend
    on whether a program is statically or dynamically linked.

BUGS

    Error returns from this system call are indistinguishable from
    successful reports that the time is a few seconds _before_ the
    Epoch, so the C library never sets `errno` as a result of this call.

   The `t` argument is obsolescent and should always be NULL in
   new code.  When `t` is NULL, the call cannot fail.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
