From: Rich Felker <dalias@libc.org>
Subject: Re: The time(2) man page conflicts with glibc
Date: Wed, 16 Dec 2015 02:08:39 -0500
Message-ID: <20151216070839.GE238@brightrain.aerifal.cx>
References: <CAMe9rOoJLk8VzyJKmkOvbmBxhCj4mVA2huYtHJsdxpatbkgJ1g@mail.gmail.com>
 <CAKCAbMj-X+wLKX3=MDm9z3L9zyikemxCNggu2bfw6=o6K5PGgg@mail.gmail.com>
 <20151215145517.GR11489@vapier.lan>
 <CAKCAbMh2ysZPQe3oOSjcPsx1_pcnCAQ6yf+gMbv6iDmvfnGXZA@mail.gmail.com>
 <20151215183826.GY11489@vapier.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <libc-alpha-return-65660-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
Content-Disposition: inline
In-Reply-To: <20151215183826.GY11489@vapier.lan>
To: Zack Weinberg <zackw@panix.com>, "H.J. Lu" <hjl.tools@gmail.com>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, libc-alpha <libc-alpha@sourceware.org>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On Tue, Dec 15, 2015 at 01:38:26PM -0500, Mike Frysinger wrote:
> On 15 Dec 2015 10:19, Zack Weinberg wrote:
> > On Tue, Dec 15, 2015 at 9:55 AM, Mike Frysinger wrote:
> > > On 15 Dec 2015 09:14, Zack Weinberg wrote:
> > >> Given the extreme obsolescence of the argument to `time`, I would
> > >> recommend that the *kernel* be changed to fire an actual SIGSEGV
> > >> instead of returning -EFAULT from the syscall version of `time`, and
> > >> then that can be the documented behavior, with the historic behavior
> > >> relegated to the BUGS section of the manpage.
> > >
> > > meh.  it would be out of character for the kernel to do this.
> > 
> > Why?
> 
> because it returns EFAULT for other syscalls when you pass bad pointers.
> projects like LTP utilize that to verify edge case functionality.

Programs could also be calling the syscall directly (using syscall()
or asm) and using it as a (very cheap, fail-safe) way to verify that
an address is writable before attempting to write to it. Breaking this
would be a kernel API regression. However the library function time()
has UB for invalid pointers and no obligation to support them.

Rich
