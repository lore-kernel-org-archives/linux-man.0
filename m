From: Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org>
Subject: Re: The time(2) man page conflicts with glibc
Date: Wed, 16 Dec 2015 17:51:51 -0500
Message-ID: <CAKCAbMhpuUyNK6PNt5QKsCrwUn-KQ1ARnYCpuXbu-43bcfRu7Q@mail.gmail.com>
References: <CAMe9rOoJLk8VzyJKmkOvbmBxhCj4mVA2huYtHJsdxpatbkgJ1g@mail.gmail.com>
	<CAKCAbMj-X+wLKX3=MDm9z3L9zyikemxCNggu2bfw6=o6K5PGgg@mail.gmail.com>
	<20151215145517.GR11489@vapier.lan>
	<CAKCAbMh2ysZPQe3oOSjcPsx1_pcnCAQ6yf+gMbv6iDmvfnGXZA@mail.gmail.com>
	<20151215183826.GY11489@vapier.lan>
	<20151216070839.GE238@brightrain.aerifal.cx>
	<20151216203432.GR11489@vapier.lan>
	<20151216215955.GJ238@brightrain.aerifal.cx>
	<CAKCAbMhks8iRT6kMYUZcLRi8Y8Xj3C55OnC_yjpOdG0j4M+V-Q@mail.gmail.com>
	<20151216224432.GK238@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151216224432.GK238-C3MtFaGISjmo6RMmaWD+6Sb1p8zYI1N1@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
Cc: "H.J. Lu" <hjl.tools-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Dec 16, 2015 at 5:44 PM, Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org> wrote:
> On Wed, Dec 16, 2015 at 05:27:03PM -0500, Zack Weinberg wrote:
>> > The kernel is not causing SIGSEGV as far as I can tell; it's purely
>> > the library function time that's causing this.
>>
>> .... Do you consider the vDSO to be part of the kernel, or part of the C library?
>
> The vdso is library code provided by the kernel, but there's no
> fundamental reason to expect it to behave identically to the system
> call. Applications making the system call themselves directly will
> never end up calling the vdso code, so it doesn't matter if its
> behavior in corner cases like this is the same as the syscall.

OK.  I'm just asking because the segfault happens inside the vDSO, or
anyway that's what it looks like from the debugger.

(I don't have a problem with keeping everything the way it is
behavior-wise, for the record.)

zw
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
