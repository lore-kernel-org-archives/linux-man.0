From: Nicholas Miell <nmiell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: For review: nptl(7) man page
Date: Tue, 4 Aug 2015 11:50:09 -0700
Message-ID: <3848244D-C3FE-4FD1-B137-AF7AD6252659@gmail.com>
References: <550ED3F4.1080403@gmail.com> <550F363B.801@gmail.com> <55B1EFFA.9070608@gmail.com> <CAODz2cDq4o85NOzqCDg9cH8eCvqt3Tq5QXKMMJtXbik5h5bL+Q@mail.gmail.com> <55B54215.6070502@gmail.com> <1438616740.20974.81.camel@localhost.localdomain> <20150803200825.GJ16376@brightrain.aerifal.cx> <20150804150648.9E9F42C3B01@topped-with-meat.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150804150648.9E9F42C3B01-j1d2VQoJOwwHfwO+Tb3JRVaTQe2KTcn/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org>
Cc: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Aug 4, 2015, at 8:06 AM, Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org> wrote:

> I think we are asserting that they are exactly that by dint of the confstr
> results for _CS_POSIX_V7_ILP32_OFF32_CFLAGS et al.  So the question is what
> POSIX actually does or doesn't say about process-shared synchronization
> objects being shared between processes running programs built in different
> POSIX compilation environments.
> 
> The other relevant question is whether 32/64 sharing of each particular
> pshared object has in fact worked reliably under glibc in the past.  Since
> we haven't been clear and explicit about the subject before AFAIK, then if
> in fact it worked before then people might well have inferred that we made
> such an ABI guarantee.  (I hope not, since if so we just broke it.)

The relevant questions aren't what's the least useful behavior that POSIX lets us get away with or can we leave it broken because it never worked;'the questions are what do the other operating systems do and what do the users want. 

IIRC, the first I ever heard of this issue was Keith Packard complaining that he couldn't put a mutex in shared memory because then 32-bit X clients couldn't talk to a 64-bit X server and it was too bad it didn't work on Linux because it does work on Solaris. --
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
