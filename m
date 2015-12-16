From: Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org>
Subject: Re: The time(2) man page conflicts with glibc
Date: Wed, 16 Dec 2015 17:27:03 -0500
Message-ID: <CAKCAbMhks8iRT6kMYUZcLRi8Y8Xj3C55OnC_yjpOdG0j4M+V-Q@mail.gmail.com>
References: <CAMe9rOoJLk8VzyJKmkOvbmBxhCj4mVA2huYtHJsdxpatbkgJ1g@mail.gmail.com>
	<CAKCAbMj-X+wLKX3=MDm9z3L9zyikemxCNggu2bfw6=o6K5PGgg@mail.gmail.com>
	<20151215145517.GR11489@vapier.lan>
	<CAKCAbMh2ysZPQe3oOSjcPsx1_pcnCAQ6yf+gMbv6iDmvfnGXZA@mail.gmail.com>
	<20151215183826.GY11489@vapier.lan>
	<20151216070839.GE238@brightrain.aerifal.cx>
	<20151216203432.GR11489@vapier.lan>
	<20151216215955.GJ238@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151216215955.GJ238-C3MtFaGISjmo6RMmaWD+6Sb1p8zYI1N1@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
Cc: "H.J. Lu" <hjl.tools-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Dec 16, 2015 at 4:59 PM, Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org> wrote:
>> > Programs could also be calling the syscall directly (using syscall()
>> > or asm) and using it as a (very cheap, fail-safe) way to verify that
>> > an address is writable before attempting to write to it. Breaking this
>> > would be a kernel API regression. However the library function time()
>> > has UB for invalid pointers and no obligation to support them.
>>
>> sure, but that still doesn't mean the kernel should be sending SEGV.
>> which is what this subthread was about.
>
> The kernel is not causing SIGSEGV as far as I can tell; it's purely
> the library function time that's causing this.

... Do you consider the vDSO to be part of the kernel, or part of the C library?
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
