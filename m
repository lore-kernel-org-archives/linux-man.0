From: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Sat, 01 Nov 2014 19:58:18 +0100
Message-ID: <1414868298.10085.488.camel@triegel.csb>
References: <544118FA.3070003@gmail.com>
	 <CAE2sS1jbGRT4uvBBVAPJkX2Mi4gHG=ii_G713MHhQzyGxO4yyw@mail.gmail.com>
	 <54461F16.2080705@cn.fujitsu.com> <oroat3wbsl.fsf@free.home>
	 <1414056576.8483.79.camel@triegel.csb> <or38adofh9.fsf@free.home>
	 <1414152747.18538.26.camel@triegel.csb> <orioj9bfaa.fsf@free.home>
	 <1414178101.18538.53.camel@triegel.csb> <orbnottnzb.fsf@free.home>
	 <1414695671.10085.180.camel@triegel.csb> <ora94b8fxl.fsf@free.home>
	 <1414838867.10085.431.camel@triegel.csb>  <orwq7e22n2.fsf@free.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <orwq7e22n2.fsf-pcXFJVXz+5uzQB+pC5nmwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sat, 2014-11-01 at 16:32 -0200, Alexandre Oliva wrote:
> On Nov  1, 2014, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> 
> > It's not surprising that this matters today (ie, when you made the
> > choices), and it's not like we've been aware of this since just
> > yesterday.
> 
> > That's why I'm arguing for being conservative
> 
> That goes both ways.  While strcpy coded for current standards might
> wish to make such optimizations, old code written for earlier standards
> that did not make allowances for the proposed strcpy optimization would
> break.

Which earlier standard are you referring to?  Did any old standard have
strcpy as something else than a sequentially-specified function?

> So we have to be conservative in strcpy to avoid breaking valid
> old programs (per the standards they were written for), and this implies
> not making the proposed optimization, which brings us back to the
> conclusion that the ctermid(NULL) implementation is MT-Safe.  And
> AS-Safe, too.
> 
> > it helps to be cautious when making assumptions about things that may
> > easily change in the future and that you can't predict.
> 
> Per the above, this one property of strcpy is not one that can *easily*
> change.  Quite the opposite.  It takes a lot of wording contortionism to
> make writing garbage fit into the strcpy contract even under current
> standards.

No it does not.  Sequential specifications for functions are before
invocation / after invocation rules -- how the function does it is not
restricted, especially if all it does is write to the destination
string, in some way.  It is not specified as operating on
volatile-qualified data, so C as-if rule applies.

Same for compilers.  If, for a piece of sequential code, the compiler
can prove that a location will be written to, then sure it is allowed to
write a speculative value early, for example.  There's a reason we have
the volatile qualifier and it's not the default.

> > In our case here, if you feel like what you require from the strcpy
> > implementation is very complex
> 
> I don't.  The requirements are the common requirements that apply to all
> historical standards that have specified strcpy.  Nothing beyond that.
> Now that's not much of a strong or surprising assumption, is it?
> 
> > Or, don't go for specifying assumptions about strcpy in the ctermid
> > docs, but rather try to solve it at the other end by documenting that
> > strcpy has to work well under concurrent execution, in particular under
> > concurrent but "idempotent" copies to a memory range.
> 
> My take is that requirement is already coded in early C standards.c
> 

They didn't specify rules for multi-threaded execution, did they?
There's volatile, and the as-if rule, but the latter really allows stuff
like speculative writes.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
