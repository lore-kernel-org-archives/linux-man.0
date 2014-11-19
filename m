From: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Tue, 18 Nov 2014 22:26:01 -0200
Message-ID: <orr3x0jasm.fsf@free.home>
References: <544118FA.3070003@gmail.com>
	<CAE2sS1jbGRT4uvBBVAPJkX2Mi4gHG=ii_G713MHhQzyGxO4yyw@mail.gmail.com>
	<54461F16.2080705@cn.fujitsu.com> <oroat3wbsl.fsf@free.home>
	<1414056576.8483.79.camel@triegel.csb> <or38adofh9.fsf@free.home>
	<1414152747.18538.26.camel@triegel.csb> <orioj9bfaa.fsf@free.home>
	<544EAF20.8050509@jkqxz.net> <ork33jqmqe.fsf@free.home>
	<1414573935.18538.74.camel@triegel.csb> <orfve5tp3e.fsf@free.home>
	<1414694486.10085.165.camel@triegel.csb> <oregtn8h23.fsf@free.home>
	<1414845631.10085.474.camel@triegel.csb> <or1tpm3hn5.fsf@free.home>
	<1414871691.10085.529.camel@triegel.csb> <orzjc8zvn6.fsf@free.home>
	<54577E17.7000109@jkqxz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54577E17.7000109-W77v16wj1OVeoWH0uzbU5w@public.gmane.org> (Mark Thompson's message of "Mon, 03
	Nov 2014 13:07:35 +0000")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Thompson <mrt-W77v16wj1OVeoWH0uzbU5w@public.gmane.org>
Cc: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man@vger.kernel.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Nov  3, 2014, Mark Thompson <mrt-W77v16wj1OVeoWH0uzbU5w@public.gmane.org> wrote:

> I disagree with this reasoning, though I am not sufficiently familiar
> with the standards involved to argue with it effectively.

> However, I do see a more concerning point here: does this argument
> also apply to memcpy()?

If the argument is correct, then I don't see why it wouldn't.  The
discussion has been ongoing in glibc-alpha, but it's not clear that any
argument any of us might bring up at this point would amount to global
consensus on what the standards actually meant, so I take it they're
more like exploring what is already defined and what isn't, to perhaps
later seek clarification from the standard bodies.

> Given that, does it not follow that the current, released,
> implementation of memcpy() in glibc for architectures using a wh64
> instruction (alpha, tilepro and tilegx) is entirely wrong?

If the argument, as stated, is correct, yes.

There's an alternative argument that wouldn't rule it out, though, that
amounts to requiring the implementation to stick to the stated
specification of *copying* data from source to destination (as opposed
to writing random bits in dest until it compares equal to source), but
with enough leeway to make copying behavior that performs cache-line
invalidation when there is certainty that the entire cache line is going
to be overwritten.  It is hard to specify that formally, but the
intuitive notion could be that, if the implementation does what the spec
says it should (namely, reading from source and storing in target),
besides ensuring the postconditions are met if the preconditions were
met to begin with, without modifying memory that shouldn't have been
modified, it could be ok.  That's not my reading, but it's a possibility
the standard bodies might consider if the intent is to rule out garbage
writing but not cache invalidation.

-- 
Alexandre Oliva, freedom fighter    http://FSFLA.org/~lxoliva/
You must be the change you wish to see in the world. -- Gandhi
Be Free! -- http://FSFLA.org/   FSF Latin America board member
Free Software Evangelist|Red Hat Brasil GNU Toolchain Engineer
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
