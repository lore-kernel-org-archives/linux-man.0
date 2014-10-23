From: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Thu, 23 Oct 2014 04:16:42 -0200
Message-ID: <oroat3wbsl.fsf@free.home>
References: <544118FA.3070003@gmail.com>
	<CAE2sS1jbGRT4uvBBVAPJkX2Mi4gHG=ii_G713MHhQzyGxO4yyw@mail.gmail.com>
	<54461F16.2080705@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54461F16.2080705-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> (Peng Haitao's message of "Tue,
	21 Oct 2014 16:53:42 +0800")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man@vger.kernel.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Oct 21, 2014, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> wrote:

> The codes of ctermid() and cuserid() are similar to tmpnam(),

Not quite.

ctermid copies a constant string to the static buffer, so any thread
calls it with a NULL string will cause the copy to be done, and when it
is complete, nothing different will ever be stored in that buffer, so
the thread that completed the call can safely read from the static
buffer, and expect to get the constant string.

tmpnam does not copy a constant string to the static buffer, so each
call may store a different string in it, so race protection is
necessary.


cuserid is somewhere in between: as long as euid doesn't change, and the
same login name is found for that euid, the string will remain the same.
I'm concerned I may have missed the static buffer in the analysis,
though, because I didn't mention it in the comments, and I don't
remember having taking it into account (but then, I don't remember the
analysis of this particular function in any other way ;-).

I'm inclined to decide the glibc manual entry is missing a MT-Unsafe
race:cuserid/!string annotation for cuserid.

As for ctermid, I admit that, strictly speaking, there's a potential
race as defined by POSIX: one thread may be reading from the static
buffer while another is overwriting it with the same bytes, without any
intervening synchronization operation.  I decided that this is a
harmless race.  However, should a machine be unable to perform
char-sized writes, and instead resorted to larger-sized
read-modify-write cycles, then a strcpy implementation that modified one
byte at a time with such cycles could race with itself, even writing the
same sequence of bytes in the same order.  However, if we had such a
machine, and we didn't optimize strcpy to coalesce writes to bytes in
the same word into a single read-modify-write cycle, we'd be failing at
a far more fundamental level.  So I crossed my fingers and hoped we'd
always have such optimizations, so that the potential race would never
become a real problem in this case.

-- 
Alexandre Oliva, freedom fighter    http://FSFLA.org/~lxoliva/
You must be the change you wish to see in the world. -- Gandhi
Be Free! -- http://FSFLA.org/   FSF Latin America board member
Free Software Evangelist|Red Hat Brasil GNU Toolchain Engineer
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
