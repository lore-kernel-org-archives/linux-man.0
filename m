From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: sched_{set,get}attr() manpage
Date: Mon, 05 May 2014 09:41:08 +0200
Message-ID: <53674094.2020307@gmail.com>
References: <CAKgNAkgw+U44SH0wd_06ZMXaCC9nCX4NZxZHkMKUdC7E7YxBhQ@mail.gmail.com> <20140214161929.GL27965@twins.programming.kicks-ass.net> <53020C9D.1050208@gmail.com> <20140428081858.GX13658@twins.programming.kicks-ass.net> <535FA467.2070403@gmail.com> <20140429160441.GU11096@twins.programming.kicks-ass.net> <5360D9E5.9080206@gmail.com> <20140430130937.GH30445@twins.programming.kicks-ass.net> <20140503124355.5d927080518051ca507bc381@gmail.com> <536735E0.7020204@gmail.com> <20140505072114.GY11096@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140505072114.GY11096-ndre7Fmf5hadTX5a5knrm8zTDFooKrT+cvkQGrU6aU0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Juri Lelli <juri.lelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dario Faggioli <raistlin-k2GhghHVRtY@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, fweisbec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, darren-P76s1CtE8BHQT0dZR+AlfA@public.gmane.org, johan.eker-IzeFyvvaP7pWk0Htik3J/w@public.gmane.org, p.faure-et3tyl94nDNyDzI6CaY1VQ@public.gmane.org, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, claudio-YOzL5CV4y4YG1A2ADO40+w@public.gmane.org, michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, fchecconi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tommaso.cucinotta-gAmJrWFzCps@public.gmane.org, nicola.manica-+cHZLFJ93xAO91npARCAeA@public.gmane.org, luca.abeni-3IIOeSMMxS4@public.gmane.org, dhaval.giani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hgu1972-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Paul McKenney <paulmck-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, insop.song-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, liming.wang-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org, jkacur-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/05/2014 09:21 AM, Peter Zijlstra wrote:
> On Mon, May 05, 2014 at 08:55:28AM +0200, Michael Kerrisk (man-pages) wrote:
>> Hi Peter,
>>
>> Looks like a good set of comments from Juri. Could you revise and 
>> resubmit?
> 
> Yeah, I'll try and get it done today, but there's a few icky bugs
> waiting for my attention as well, I'll do me bestest :-)
> 
>> By the way, I assume you are just writing this page as raw text.
>> While I'd prefer to get proper man markup source, I'll add that
>> if you if you don't :-/. 
> 
> Well, learning *roff will likely take me more time than writing this
> text + all revisions so far :/ But yeah, I appreciate the grief.
> 
> Is there a TeX variant one could use to generate the *roff muck? While
> my TeX isn't entirely fresh its at least something I've done lots of.

Don't worry -- just send me the plain text; I'll do it. I appreciate 
you writing the text in the first place; I'll handle the rest--it won't
take me too long, and probably I'll find things to fix/check on the way.

>> But, in that case, I need to know the
>> copyright and license you want to use. Please see
>> https://www.kernel.org/doc/man-pages/licenses.html
> 
> GPLv2 + DOC (not v2+) sounds good.

I'm a little unclear here. Do you or don't you mean
https://www.kernel.org/doc/man-pages/licenses.html#gpl
?

(Note, I'd really prefer to stick to one of those licenses
(without variants). (My personal preference is the "verbatim"
license, which is the most widely used one.) There's already
do many licenses in in man-pages...

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
