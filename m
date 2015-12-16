From: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
Subject: Re: The time(2) man page conflicts with glibc
Date: Wed, 16 Dec 2015 16:59:56 -0500
Message-ID: <20151216215955.GJ238@brightrain.aerifal.cx>
References: <CAMe9rOoJLk8VzyJKmkOvbmBxhCj4mVA2huYtHJsdxpatbkgJ1g@mail.gmail.com>
 <CAKCAbMj-X+wLKX3=MDm9z3L9zyikemxCNggu2bfw6=o6K5PGgg@mail.gmail.com>
 <20151215145517.GR11489@vapier.lan>
 <CAKCAbMh2ysZPQe3oOSjcPsx1_pcnCAQ6yf+gMbv6iDmvfnGXZA@mail.gmail.com>
 <20151215183826.GY11489@vapier.lan>
 <20151216070839.GE238@brightrain.aerifal.cx>
 <20151216203432.GR11489@vapier.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151216203432.GR11489-UgUKS2FnFs9+urZeOPWqwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org>, "H.J. Lu" <hjl.tools-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Dec 16, 2015 at 03:34:32PM -0500, Mike Frysinger wrote:
> On 16 Dec 2015 02:08, Rich Felker wrote:
> > On Tue, Dec 15, 2015 at 01:38:26PM -0500, Mike Frysinger wrote:
> > > On 15 Dec 2015 10:19, Zack Weinberg wrote:
> > > > On Tue, Dec 15, 2015 at 9:55 AM, Mike Frysinger wrote:
> > > > > On 15 Dec 2015 09:14, Zack Weinberg wrote:
> > > > >> Given the extreme obsolescence of the argument to `time`, I would
> > > > >> recommend that the *kernel* be changed to fire an actual SIGSEGV
> > > > >> instead of returning -EFAULT from the syscall version of `time`, and
> > > > >> then that can be the documented behavior, with the historic behavior
> > > > >> relegated to the BUGS section of the manpage.
> > > > >
> > > > > meh.  it would be out of character for the kernel to do this.
> > > > 
> > > > Why?
> > > 
> > > because it returns EFAULT for other syscalls when you pass bad pointers.
> > > projects like LTP utilize that to verify edge case functionality.
> > 
> > Programs could also be calling the syscall directly (using syscall()
> > or asm) and using it as a (very cheap, fail-safe) way to verify that
> > an address is writable before attempting to write to it. Breaking this
> > would be a kernel API regression. However the library function time()
> > has UB for invalid pointers and no obligation to support them.
> 
> sure, but that still doesn't mean the kernel should be sending SEGV.
> which is what this subthread was about.

The kernel is not causing SIGSEGV as far as I can tell; it's purely
the library function time that's causing this.

Rich
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
