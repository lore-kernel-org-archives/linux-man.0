From: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Fri, 24 Oct 2014 09:48:50 -0200
Message-ID: <or38adofh9.fsf@free.home>
References: <544118FA.3070003@gmail.com>
	<CAE2sS1jbGRT4uvBBVAPJkX2Mi4gHG=ii_G713MHhQzyGxO4yyw@mail.gmail.com>
	<54461F16.2080705@cn.fujitsu.com> <oroat3wbsl.fsf@free.home>
	<1414056576.8483.79.camel@triegel.csb>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414056576.8483.79.camel-I2ZjUw8blINjztcc/or7kQ@public.gmane.org> (Torvald Riegel's message
	of "Thu, 23 Oct 2014 11:29:36 +0200")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man@vger.kernel.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Oct 23, 2014, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> I don't think it's easy to classify something as a harmless race.

In general, I'd agree with you.

But writing the same data onto the same memory range with code under our
entire control that completes execution on any thread before returning
control to any potental reader can access it is such a case IMHO.

> In this case, you must make assumptions about strcpy's implementation

I did, and I'm quite comfortable with them.

Do you have any evidence that they don't hold, or that they might not
hold, or are you just making wild speculations about compliant but
entirely nonsensical implementations of strcpy that we'd likely never
bring into glibc?


> It could also use funny SIMD instructions or such that don't work like
> normal memory accesses in a concurrent setting.

As long as they don't write outside the memory area of the static char[]
where we're to store the constant string forever, they should still be
safe, because callers can only get to the data after their own thread
finishes writing to the string.  And if the caller wishes to pass the
string on to another thread, then it must ensure the transfer is
properly synchronized.


So the only potentially dangerous case really is that of strcpy writing
intermediate nonsense, or the case I discussed in my previous email, of
larger-than-byte read-modify-write cycles that pick up uninitialized
fragments and then, after another thread initializes those fragments,
overwrite parts of the same word with the uninitialized fragments they
read before.


> I think there's also hardware being designed on which synchronizing
> loads/stores differ from nonsynchronizing ones.

It *still* wouldn't be a problem.  A reader only gets a chance to read
after its own writer completed (over?)writing the memory area with the
bits that shall remain there forever.


Given this more detailed explanation of the conditions that apply and
that IMHO make it perfectly safe, do you still see any concrete error
situation here?

-- 
Alexandre Oliva, freedom fighter    http://FSFLA.org/~lxoliva/
You must be the change you wish to see in the world. -- Gandhi
Be Free! -- http://FSFLA.org/   FSF Latin America board member
Free Software Evangelist|Red Hat Brasil GNU Toolchain Engineer
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
