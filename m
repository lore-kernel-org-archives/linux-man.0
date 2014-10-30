From: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Thu, 30 Oct 2014 16:00:21 -0200
Message-ID: <orfve5tp3e.fsf@free.home>
References: <544118FA.3070003@gmail.com>
	<CAE2sS1jbGRT4uvBBVAPJkX2Mi4gHG=ii_G713MHhQzyGxO4yyw@mail.gmail.com>
	<54461F16.2080705@cn.fujitsu.com> <oroat3wbsl.fsf@free.home>
	<1414056576.8483.79.camel@triegel.csb> <or38adofh9.fsf@free.home>
	<1414152747.18538.26.camel@triegel.csb> <orioj9bfaa.fsf@free.home>
	<544EAF20.8050509@jkqxz.net> <ork33jqmqe.fsf@free.home>
	<1414573935.18538.74.camel@triegel.csb>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414573935.18538.74.camel-I2ZjUw8blINjztcc/or7kQ@public.gmane.org> (Torvald Riegel's message
	of "Wed, 29 Oct 2014 10:12:15 +0100")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Mark Thompson <mrt-W77v16wj1OVeoWH0uzbU5w@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man@vger.kernel.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Oct 29, 2014, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> On Wed, 2014-10-29 at 06:55 -0200, Alexandre Oliva wrote:
>> On Oct 27, 2014, Mark Thompson <mrt-W77v16wj1OVeoWH0uzbU5w@public.gmane.org> wrote:
>> 
>> > Now suppose we have such an implementation.  Consider two distinct
>> > threads copying the same thing which is longer than a cache line
>> 
>> "/dev/tty" (the constant string copied in the case at hand) is not
>> longer than a cache line (right? :-), so while your case is compelling,
>> it doesn't apply.

> That depends on the alignment of the strings.

No, sorry.  The alignment of a string that is smaller than a cache can't
possibly make the string itself bigger than a cache line, and any
padding introduced by alignment, before or after the string, won't make
strcpy copy more bytes than the size of the string.

Maybe you were thinking of straddling over more than one a cache line?
That still wouldn't apply: the case mark described was one in which an
*entire* cache line would be overwritten, so it didn't have to be
fetched from memory.  If a smaller-than-cache-line string is placed
entirely in a single cache line, it will require that line to be
fetched; if it straddles over two cache lines, it requires *both* to be
fetched; if it didn't, or if it straddled over more than two cache
lines, it wouldn't be smaller than the cache line.

>> > Since strcpy will always write at least one byte, can you really argue
>> > that adding "*dest = 0;" to the beginning of a strcpy function is
>> > always a bad thing?
>> 
>> Now, this one is compelling *and* fitting IMHO.
>> 
>> Of course we could rule this out in glibc, but should we?  Maybe not.
>> 
>> So I guess we're better off fixing the implementation of ctermid(NULL)
>> to return a pointer to a constant string that (per POSIX) must not be
>> modified by the caller, rather than needlessly copying it to another
>> buffer.  Then, if/when such a strcpy implementation comes up, we'll be
>> ready for it ;-)

> Yes, we either need to change the implementation, or make it MT-Unsafe
> for now.

We only have to make it MT-Unsafe for now if the scenario above, of
strcpy *always* writing a zero byte to the beginning of the destination
string, were present in any implementation of strcpy in glibc.

Do you see any implementations of strcpy in glibc doing that?


> As this example shows, they can be not "benign" without this being
> easy to spot.

As much as you might want it to be so, it doesn't show an such thing.
The example just shows that changing part of the implementation can make
other parts that rely on it racy, so changes that might affect safety
properties have to be made with a lot of care.

Now that's not much of a surprise, is it?

> Alex, when you did the MT Safety review, which other cases of "benign"
> race conditions did you see?

We've already discussed them in the list where we should have been
discussing this in the first place.

You have access to my notes in the comments added next to the safety
annotations in the manual.  That's all I got.

-- 
Alexandre Oliva, freedom fighter    http://FSFLA.org/~lxoliva/
You must be the change you wish to see in the world. -- Gandhi
Be Free! -- http://FSFLA.org/   FSF Latin America board member
Free Software Evangelist|Red Hat Brasil GNU Toolchain Engineer
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
