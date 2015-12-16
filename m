From: Rich Felker <dalias@libc.org>
Subject: Re: The time(2) man page conflicts with glibc
Date: Wed, 16 Dec 2015 17:44:32 -0500
Message-ID: <20151216224432.GK238@brightrain.aerifal.cx>
References: <CAMe9rOoJLk8VzyJKmkOvbmBxhCj4mVA2huYtHJsdxpatbkgJ1g@mail.gmail.com>
 <CAKCAbMj-X+wLKX3=MDm9z3L9zyikemxCNggu2bfw6=o6K5PGgg@mail.gmail.com>
 <20151215145517.GR11489@vapier.lan>
 <CAKCAbMh2ysZPQe3oOSjcPsx1_pcnCAQ6yf+gMbv6iDmvfnGXZA@mail.gmail.com>
 <20151215183826.GY11489@vapier.lan>
 <20151216070839.GE238@brightrain.aerifal.cx>
 <20151216203432.GR11489@vapier.lan>
 <20151216215955.GJ238@brightrain.aerifal.cx>
 <CAKCAbMhks8iRT6kMYUZcLRi8Y8Xj3C55OnC_yjpOdG0j4M+V-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <libc-alpha-return-65721-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
Content-Disposition: inline
In-Reply-To: <CAKCAbMhks8iRT6kMYUZcLRi8Y8Xj3C55OnC_yjpOdG0j4M+V-Q@mail.gmail.com>
To: Zack Weinberg <zackw@panix.com>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, libc-alpha <libc-alpha@sourceware.org>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On Wed, Dec 16, 2015 at 05:27:03PM -0500, Zack Weinberg wrote:
> On Wed, Dec 16, 2015 at 4:59 PM, Rich Felker <dalias@libc.org> wrote:
> >> > Programs could also be calling the syscall directly (using syscall()
> >> > or asm) and using it as a (very cheap, fail-safe) way to verify that
> >> > an address is writable before attempting to write to it. Breaking this
> >> > would be a kernel API regression. However the library function time()
> >> > has UB for invalid pointers and no obligation to support them.
> >>
> >> sure, but that still doesn't mean the kernel should be sending SEGV.
> >> which is what this subthread was about.
> >
> > The kernel is not causing SIGSEGV as far as I can tell; it's purely
> > the library function time that's causing this.
> 
> .... Do you consider the vDSO to be part of the kernel, or part of the C library?

The vdso is library code provided by the kernel, but there's no
fundamental reason to expect it to behave identically to the system
call. Applications making the system call themselves directly will
never end up calling the vdso code, so it doesn't matter if its
behavior in corner cases like this is the same as the syscall.

Said differently, the vdso function is a _new_ stable kernel API
that's functionally similar to the syscall, not the same API, since
you call it in a very different way.

Rich
