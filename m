From: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Sat, 01 Nov 2014 06:24:04 -0200
Message-ID: <oregtn8h23.fsf@free.home>
References: <544118FA.3070003@gmail.com>
	<CAE2sS1jbGRT4uvBBVAPJkX2Mi4gHG=ii_G713MHhQzyGxO4yyw@mail.gmail.com>
	<54461F16.2080705@cn.fujitsu.com> <oroat3wbsl.fsf@free.home>
	<1414056576.8483.79.camel@triegel.csb> <or38adofh9.fsf@free.home>
	<1414152747.18538.26.camel@triegel.csb> <orioj9bfaa.fsf@free.home>
	<544EAF20.8050509@jkqxz.net> <ork33jqmqe.fsf@free.home>
	<1414573935.18538.74.camel@triegel.csb> <orfve5tp3e.fsf@free.home>
	<1414694486.10085.165.camel@triegel.csb>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414694486.10085.165.camel-I2ZjUw8blINjztcc/or7kQ@public.gmane.org> (Torvald Riegel's
	message of "Thu, 30 Oct 2014 19:41:26 +0100")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Mark Thompson <mrt-W77v16wj1OVeoWH0uzbU5w@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man@vger.kernel.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Oct 30, 2014, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> On Thu, 2014-10-30 at 16:00 -0200, Alexandre Oliva wrote:
>> Do you see any implementations of strcpy in glibc doing that?

> Can we please fix faults even if they are not triggering a error right
> now?

Sure!  But the way to fix that is *not* modifying a piece of
documentation that is supposed to document current state, and that does,
into something that doesn't, is it?

strcpy as it is implemented today makes ctermid MT-Safe.  That's what
the current documentation states, and AFAICT that is correct.  Do you
disagree?  If so, please point out in current code where it deviates.

> No, it definitely does.  You made an assumption about a "perfectly
> reasonable requirement we already place on any strcpy implementation we
> use".

... and that current implementations of strcpy in glibc abide by, so the
above is tautologically correct.  Introducing different behavior, such
as unconditionally writing something else on the string, is indeed a
change in the current contract.

> So, it seems your "perfectly reasonable requirement" is (1)
> not so obviously clear at all

I guess it will be once you observe the existing implementations.
Have you?

> and (2) would be easy to break by perfectly reasonable
> implementations.

That much is true.  Which is why ctermid safety notes have comments in
the manual indicating what's going on in there, and why it's safe in
spite of the potential race.

> This means that we need to be able to change
> implementations of functions if they still satisfy the contract.

So you agree that it would be perfectly legitimate to address the
current problem by documentng that glibc's implementatios of strcpy must
not write to the destination any data other than what they were asked to
write?  Or even that concurrent runs of strcpy writing the same string
to the same destination must not introduce windows in which data other
than what is being written or what was in there before is visible?

These are all derivable from current implementations in glibc, so it
wouldn't be changing any contracts, just imposing further requirements
on future implementations so as to keep the current ctermid safe.

> In the notes for ctermid, I can't see anything that would hint at an
> assumed benign race condition.

Are you sure you're looking at the right place?

@deftypefun {char *} ctermid (char *@var{string})
@safety{@prelim{}@mtsafe{}@assafe{}@acsafe{}}
@c This function is a stub by default; the actual implementation, for
@c posix systems, returns an internal buffer if passed a NULL string,
@c but the internal buffer is always set to /dev/tty.

> Does that mean that you didn't make notes for benign race conditions
> in general?

If you saw the above and didn't see that, we can agree they're not in a
form you expect.  But no, I don't think I have made notes with blinking
red letters whenever I made an assumption you'd disagree with.  We've
covered some of them already in past discussions that led nowhere, so I
won't repeat myself to avoid wasting both of us even more time.  I will
just say that, after we had that conversation and I agreed to take
additional notes of potential races involving bit operations in IOstream
functions, I didn't find any more of those, and ctermid is certainly an
outlier; I don't recall other situations that involved that sort of
reasoning.  Other pervasive cases I'm not sure I mentioned then have to
do with unguarded access to constant locale data, that have only been
annotated when the pointer to the current locale object is accessed more
than once.  That's really all I can think of that you might find
objectionable, but I'm sure there'd be plenty of other cases you'd have
objected to if you had done the review.


Now here's something that might make your head spin: here's the object
code generated for ctermid, non-PIC (but PIC is different only in how it
initializes %rdx with the address of the buffer):

0000000000000000 <ctermid>:
   0:   48 89 f8                mov    %rdi,%rax
   3:   48 85 ff                test   %rdi,%rdi
   6:   ba 00 00 00 00          mov    $0x0,%edx
                        7: R_X86_64_32  .bss
   b:   48 0f 44 c2             cmove  %rdx,%rax
   f:   48 b9 2f 64 65 76 2f    movabs $0x7974742f7665642f,%rcx
  16:   74 74 79
  19:   48 89 08                mov    %rcx,(%rax)
  1c:   c6 40 08 00             movb   $0x0,0x8(%rax)
  20:   c3                      retq

Do you see any strcpy call in there?  Yeah, the compiler turns strcpy of
a constant into memcpy, and that in turn gets inlined into a
word-and-byte store.  This in turn invalidates Mark Thompson's
reasoning: now there's no longer any point in storing a NUL upfront to
cache the dest line in *while* we load the beginning of src, because src
is part of the instruction stream.  Writing a byte upfront would just
waste cycles that could have been spent writing the actual data, so no
sane optimizing compiler would do that.

-- 
Alexandre Oliva, freedom fighter    http://FSFLA.org/~lxoliva/
You must be the change you wish to see in the world. -- Gandhi
Be Free! -- http://FSFLA.org/   FSF Latin America board member
Free Software Evangelist|Red Hat Brasil GNU Toolchain Engineer
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
