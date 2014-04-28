From: Juri Lelli <juri.lelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: sched_{set,get}attr() manpage
Date: Mon, 28 Apr 2014 09:39:01 +0200
Message-ID: <20140428093901.c76e118c570df5da728b8310@gmail.com>
References: <20131217123352.692059839@infradead.org>
	<CAHO5Pa3=+Zhg72tVfddSUvgirUyObir6atJVo4_16bVWB2Osgw@mail.gmail.com>
	<20140121153851.GZ31570@twins.programming.kicks-ass.net>
	<CAKgNAkgw+U44SH0wd_06ZMXaCC9nCX4NZxZHkMKUdC7E7YxBhQ@mail.gmail.com>
	<20140214161929.GL27965@twins.programming.kicks-ass.net>
	<53020C9D.1050208@gmail.com>
	<20140409092510.GQ11096@twins.programming.kicks-ass.net>
	<20140409151911.GA4041@austad.us>
	<20140409154204.GD10526@twins.programming.kicks-ass.net>
	<CAKgNAki5BkOyckf1zxJCRs2tq-eG9bWW_yRGi3hDynz12wz+QQ@mail.gmail.com>
	<20140427193449.GB17778@laptop.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140427193449.GB17778-RM5+C6weyIYnLiPH7yDmwOa11wxjtiyuLtmvbW2Dspo@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Henrik Austad <henrik-RT+80VE2nyv1P9xLtpHBDw@public.gmane.org>, Dario Faggioli <raistlin-k2GhghHVRtY@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, =?ISO-8859-1?Q?Fr=E9d=E9ric?= Weisbecker <fweisbec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, darren-P76s1CtE8BHQT0dZR+AlfA@public.gmane.org, johan.eker-IzeFyvvaP7pWk0Htik3J/w@public.gmane.org, p.faure-et3tyl94nDNyDzI6CaY1VQ@public.gmane.org, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Claudio Scordino <claudio-YOzL5CV4y4YG1A2ADO40+w@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Fabio Checconi <fchecconi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tommaso Cucinotta <tommaso.cucinotta-gAmJrWFzCps@public.gmane.org>, nicola.manica-+cHZLFJ93xAO91npARCAeA@public.gmane.org, luca.abeni-3IIOeSMMxS4@public.gmane.org, Dhaval Giani <dhaval.giani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, hgu1972-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Paul McKenney <paulmck-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Insop Song <insop.song-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, liming.wang-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org, jkacur-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sun, 27 Apr 2014 21:34:49 +0200
Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:

> On Sun, Apr 27, 2014 at 05:47:25PM +0200, Michael Kerrisk (man-pages) wrote:
> > Hi Peter,
> > 
> > Following the review comments that one or two people sent, are you
> > planning to send in a revised version of this page?
> 
> Yes, I just suck at getting around to it :-(, I'll do it first thing
> tomorrow.
> 
> > Also, is there any test code lying about somewhere that I could play with?
> 
> Juri?

Yes. I use this two tools:

- rt-app (to create periodic workload, also not RT/DL)
  https://github.com/gbagnoli/rt-app

- schedtool-dl (patched version of schetool)
  https://github.com/jlelli/schedtool-dl

Both are aligned to the last interface.

Best,

- Juri
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
