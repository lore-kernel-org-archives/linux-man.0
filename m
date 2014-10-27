From: Mark Thompson <mrt-W77v16wj1OVeoWH0uzbU5w@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Mon, 27 Oct 2014 20:46:24 +0000
Message-ID: <544EAF20.8050509@jkqxz.net>
References: <544118FA.3070003@gmail.com>	<CAE2sS1jbGRT4uvBBVAPJkX2Mi4gHG=ii_G713MHhQzyGxO4yyw@mail.gmail.com>	<54461F16.2080705@cn.fujitsu.com> <oroat3wbsl.fsf@free.home>	<1414056576.8483.79.camel@triegel.csb> <or38adofh9.fsf@free.home>	<1414152747.18538.26.camel@triegel.csb> <orioj9bfaa.fsf@free.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <orioj9bfaa.fsf-pcXFJVXz+5uzQB+pC5nmwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 24/10/14 17:31, Alexandre Oliva wrote:
>
> We're not talking about the strcpy contract in the abstract.  We're
> talking about implementations we control, and that ought to be as
> efficient as possible because it's such a frequently used function.
> Writing intermediate states is not something such a function would want
> to do.
>

I don't think this assumption is reasonable.  While it is not (to my 
knowledge) violated anywhere in glibc yet, it is not a stretch that a 
correct and useful implementation of strcpy would be written in the near 
future on a currently-existing machine which does violate it.

To offer a concrete example, consider an instruction which allocates a 
cache line without reading it from memory, such as wh64 on alpha, 
tilepro or tilegx.  The point of the instruction is to avoid loading 
part of a cache line if you are going to overwrite all of it, so the 
explicit semantics from the point of view of the user are that the 
contents of the cache line addressed are replaced with unspecified data. 
  Removing the redundant load reduces the memory bandwidth used in large 
copy operations by one third, so this is certainly worth looking at for 
long strcpy.

Now suppose we have such an implementation.  Consider two distinct 
threads copying the same thing which is longer than a cache line into a 
cache-line-aligned buffer, on a uniprocessor machine:

Thread 1:
   Allocate cache line.
   Overwrite whole cache line.
   Return from call.
   Get preempted.

Enough other things happen to flush the whole cache back to memory, 
including the written line.

Thread 2:
   Allocate cache line (the line is not already present in the cache, so 
fill with unspecified data to avoid loading an old value from memory).
   Overwrite the first byte or word, but not the whole line (so it is 
now dirty, and must therefore overwrite the copy in memory if flushed).
   Get preempted.

Thread 1:
   User code reads the result, it's wrong.

This does have very strong alignment constraints so I don't know whether 
anyone would actually bother to write an optimised strcpy like this, but 
it certainly isn't a purely theoretical failing.

Note also that if the strcpy here were replaced with strlen+memcpy, it 
would already be wrong on alpha, tilepro and tilegx with currently 
released glibc, as all have an optimised memcpy implementation using 
this feature.

Regards,

- Mark


P.S.  Even the "no point in writing redundant data" straw man is made of 
surprisingly resilient straw.  Since strcpy will always write at least 
one byte, can you really argue that adding "*dest = 0;" to the beginning 
of a strcpy function is always a bad thing?  It seems to me that it 
actually helps in at least some cases if neither source nor destination 
is already present in cache, because we can then start loading the first 
destination line from memory in parallel with the load of the first 
source line without needing to wait for the data dependency on the source.


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
