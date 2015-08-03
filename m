From: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: For review: nptl(7) man page
Date: Mon, 03 Aug 2015 17:45:40 +0200
Message-ID: <1438616740.20974.81.camel@localhost.localdomain>
References: <550ED3F4.1080403@gmail.com>	<550F363B.801@gmail.com>
		<55B1EFFA.9070608@gmail.com>
	 <CAODz2cDq4o85NOzqCDg9cH8eCvqt3Tq5QXKMMJtXbik5h5bL+Q@mail.gmail.com>
	 <55B54215.6070502@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55B54215.6070502-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nicholas Miell <nmiell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sun, 2015-07-26 at 22:24 +0200, Michael Kerrisk (man-pages) wrote:
> On 07/24/2015 05:51 PM, Nicholas Miell wrote:
> > PTHREAD_PROCESS_SHARED says any thread with access to the memory co=
ntaining
> > the mutex can operate on the mutex and POSIX basically ignores the =
idea
> > that different processes could be running completely incompatible
> > executables or whatever.
> >=20
> > pthread_mutex_t has a bunch of #ifdefs in the middle of it that cha=
nge the
> > structure size and layout between i386 and x86_64.
> >=20
> > Most importantly, the positions of the __nusers and __kind fields a=
re
> > swapped (this looks to be an oversight dating back to 2003 when __n=
users
> > was first introduced and carefully preserved when the separate i386=
 and
> > x86_64 versions of pthreadtypes.h were merged into the single x86 v=
ersion),
> > which means that when the lock and unlock functions attempt to figu=
re out
> > what kind of mutex it is (recursive/adaptive/whatever), they'll loo=
k at the
> > wrong field if the mutex is from the wrong architecture and then th=
ings
> > will break.
> >=20
> > And then there's the fact that the rest of the struct is a union in=
 the
> > 32-bit version and flat in the 64-bit version, but that could have =
been
> > worked around if you put a flag in the __kind field that tells the =
64-bit
> > pthread library that it is looking at a 32-bit mutex.
>=20
> Thanks for the additional detail, Nicholas. So, how about a paragraph=
 such=20
> as the following for the manual page:
>=20
>        POSIX says that any thread in any process with access to the m=
em=E2=80=90
>        ory containing a  process-shared  (PTHREAD_PROCESS_SHARED)  mu=
tex
>        can  operate  on that mutex.  However, on 64-bit x86 systems, =
the
>        mutex definition for x86-64 is incompatible with the mutex  de=
fi=E2=80=90
>        nition  for  i386,  meaning that 32-bit and 64-bit binaries ca=
n't
>        share mutexes on x86-64 systems.

In general, I don't think we promise that one can use share
PTHREAD_PROCESS_SHARED data structures between processes that do not us=
e
the same glibc.  A 32b glibc build and an x86_64 build will differ
(e.g., the new semaphore implemenation uses a different algorithm if 64=
b
atomic operations are available instead of just 32b ones).  The sizes
and aligment of the data structures are ABI, but I do not believe that
the way in that glibc uses those bits is part of the ABI too.

However, I haven't checked whether POSIX makes any statements about thi=
s
situation.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
