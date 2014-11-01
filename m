From: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Sat, 01 Nov 2014 13:40:31 +0100
Message-ID: <1414845631.10085.474.camel@triegel.csb>
References: <544118FA.3070003@gmail.com>
	 <CAE2sS1jbGRT4uvBBVAPJkX2Mi4gHG=ii_G713MHhQzyGxO4yyw@mail.gmail.com>
	 <54461F16.2080705@cn.fujitsu.com> <oroat3wbsl.fsf@free.home>
	 <1414056576.8483.79.camel@triegel.csb> <or38adofh9.fsf@free.home>
	 <1414152747.18538.26.camel@triegel.csb> <orioj9bfaa.fsf@free.home>
	 <544EAF20.8050509@jkqxz.net> <ork33jqmqe.fsf@free.home>
	 <1414573935.18538.74.camel@triegel.csb> <orfve5tp3e.fsf@free.home>
	 <1414694486.10085.165.camel@triegel.csb>  <oregtn8h23.fsf@free.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <oregtn8h23.fsf-pcXFJVXz+5uzQB+pC5nmwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Mark Thompson <mrt-W77v16wj1OVeoWH0uzbU5w@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sat, 2014-11-01 at 06:24 -0200, Alexandre Oliva wrote:
> On Oct 30, 2014, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> 
> > On Thu, 2014-10-30 at 16:00 -0200, Alexandre Oliva wrote:
> >> Do you see any implementations of strcpy in glibc doing that?
> 
> > Can we please fix faults even if they are not triggering a error right
> > now?
> 
> Sure!  But the way to fix that is *not* modifying a piece of
> documentation that is supposed to document current state, and that does,
> into something that doesn't, is it?
> 
> strcpy as it is implemented today makes ctermid MT-Safe.  That's what
> the current documentation states, and AFAICT that is correct.  Do you
> disagree?  If so, please point out in current code where it deviates.

The fault is in the difference between what strcpy is specified to do
(ie, it's sequential contract plus your MT-Safe annotation that,
however, requires callers to protect caller-supplied data from data
races) -- and what you rely on.  You didn't document that difference, or
your assumption, anywhere.  Even if our current implementation doesn't
trigger an issue, there's still a fault in your documentation.  That's
what I'm talking about.

> > No, it definitely does.  You made an assumption about a "perfectly
> > reasonable requirement we already place on any strcpy implementation we
> > use".
> 
> ... and that current implementations of strcpy in glibc abide by, so the
> above is tautologically correct.

Ahem, no.  Because we do not place this requirement on any strcpy
implementation, or is it documented or obvious anywhere?  The fact that
current implementations happen to abide by such a requirement does not
mean that we make this requirement.  If so, you could point me at it.
And no, referring to all other implementations and saying "do exactly
what they do" is not an implicit requirement.

> Introducing different behavior, such
> as unconditionally writing something else on the string, is indeed a
> change in the current contract.

No, it's not.  It deviates from what current implementations might do.
But the sequential contract of strcpy says that the accesses should only
go to what the abstract machine would do (ie, don't write to other
strings), and that *when strcpy* returns, it must have copied.  That's
the contract.

> > So, it seems your "perfectly reasonable requirement" is (1)
> > not so obviously clear at all
> 
> I guess it will be once you observe the existing implementations.
> Have you?

See Mark's comments.  Are you saying that the implementation possibility
he mentions is obviously wrong?  If it's not, then you don't have an
obvious requirement to not do it.

> > and (2) would be easy to break by perfectly reasonable
> > implementations.
> 
> That much is true.  Which is why ctermid safety notes have comments in
> the manual indicating what's going on in there, and why it's safe in
> spite of the potential race.

No.  All that I see is this (which you're aware of, see below):

@c This function is a stub by default; the actual implementation, for
@c posix systems, returns an internal buffer if passed a NULL string,
@c but the internal buffer is always set to /dev/tty.

Where does it talk about a potential data race?  It says that's there a
shared buffer, but it does not mention that there's something special
about how the buffer is initialized.  Nor that this affects strcpy
implementations in any way.

And how do you expect strcpy implementers to be aware of this, in
practice, with high probability?  Should they review all the callers and
look for undocumented assumptions?  Do you think that this scales well
and keeps complexity down?

> > This means that we need to be able to change
> > implementations of functions if they still satisfy the contract.
> 
> So you agree that it would be perfectly legitimate to address the
> current problem by documentng that glibc's implementatios of strcpy must
> not write to the destination any data other than what they were asked to
> write?  Or even that concurrent runs of strcpy writing the same string
> to the same destination must not introduce windows in which data other
> than what is being written or what was in there before is visible?

The latter is better.

> These are all derivable from current implementations in glibc, so it
> wouldn't be changing any contracts, just imposing further requirements
> on future implementations so as to keep the current ctermid safe.

No.  Implementations do not define the contract.  Implementations
satisfy the contract.  The point of reasoning in terms of contracts is
that those provide an abstraction, and state the requirements on
implementations.  This allows decoupling, which is critical for keeping
complexity at a maintainable level.

You can ignore all that and assume that the only contract of a function
is the union of its implementations.  But that's BAD when we have a
function like strcpy that already has a contract.  It's not so bad when
we do this in tightly coupled functions, and it would be overkill to
specify a contract for, say, a static function that just has two call
sites in the function right next to it in the same file.  But why should
strcpy and ctermid be tightly coupled?

> > In the notes for ctermid, I can't see anything that would hint at an
> > assumed benign race condition.
> 
> Are you sure you're looking at the right place?
> 
> @deftypefun {char *} ctermid (char *@var{string})
> @safety{@prelim{}@mtsafe{}@assafe{}@acsafe{}}
> @c This function is a stub by default; the actual implementation, for
> @c posix systems, returns an internal buffer if passed a NULL string,
> @c but the internal buffer is always set to /dev/tty.

Yes that.  See above...

> > Does that mean that you didn't make notes for benign race conditions
> > in general?
> 
> If you saw the above and didn't see that, we can agree they're not in a
> form you expect.  But no, I don't think I have made notes with blinking
> red letters whenever I made an assumption you'd disagree with.  We've
> covered some of them already in past discussions that led nowhere, so I
> won't repeat myself to avoid wasting both of us even more time.  I will
> just say that, after we had that conversation and I agreed to take
> additional notes of potential races involving bit operations in IOstream
> functions, I didn't find any more of those, and ctermid is certainly an
> outlier; I don't recall other situations that involved that sort of
> reasoning.

Good.  That information helps, thanks.

> Other pervasive cases I'm not sure I mentioned then have to
> do with unguarded access to constant locale data, that have only been
> annotated when the pointer to the current locale object is accessed more
> than once.

I can't quite follow that.  Do the accesses constitute data races?  Can
you give me some more pointers or background info?

> That's really all I can think of that you might find
> objectionable, but I'm sure there'd be plenty of other cases you'd have
> objected to if you had done the review.

Or maybe not.  What makes you think that way?  I'm asking to get a feel
for what else you might have assumed to be okay that I wouldn't.

> Now here's something that might make your head spin:

Sorry, but why?

If, then because this example doesn't actually support your arguments. 

I'm arguing that bringing in additional dependencies on implementation
details doesn't help keeping complexity down nor makes things less
fragile -- and you give an example that adds even more dependencies (ie,
assumptions about a specific compiler)?

Oh, and BTW, I already mentioned that one has to consider the compiler
too when dealing with "benign" race conditions, didn't I?

> here's the object
> code generated for ctermid, non-PIC (but PIC is different only in how it
> initializes %rdx with the address of the buffer):
> 
> 0000000000000000 <ctermid>:
>    0:   48 89 f8                mov    %rdi,%rax
>    3:   48 85 ff                test   %rdi,%rdi
>    6:   ba 00 00 00 00          mov    $0x0,%edx
>                         7: R_X86_64_32  .bss
>    b:   48 0f 44 c2             cmove  %rdx,%rax
>    f:   48 b9 2f 64 65 76 2f    movabs $0x7974742f7665642f,%rcx
>   16:   74 74 79
>   19:   48 89 08                mov    %rcx,(%rax)
>   1c:   c6 40 08 00             movb   $0x0,0x8(%rax)
>   20:   c3                      retq
> 
> Do you see any strcpy call in there?  Yeah, the compiler turns strcpy of
> a constant into memcpy,

So now you depend on the compiler's memcpy implementation.  Great.  We
can consider the optimized memcpy Mark mentions.  (strcpy on constant
string is strlen (known a priori) + memcpy.)

> and that in turn gets inlined into a
> word-and-byte store.  This in turn invalidates Mark Thompson's
> reasoning: now there's no longer any point in storing a NUL upfront to
> cache the dest line in *while* we load the beginning of src, because src
> is part of the instruction stream.  Writing a byte upfront would just
> waste cycles that could have been spent writing the actual data, so no
> sane optimizing compiler would do that.

Please look again at the case he described.  The src doesn't matter,
it's the destination.  The only thing that saves you here is that
cachelines will be likely longer than "/dev/tty" plus trailing zero.  So
if we would change the string and make it longer, you'd hit exactly the
issue you described if the compiler's memcpy makes the optimization.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
