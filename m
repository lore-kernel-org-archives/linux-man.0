From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: sched_{set,get}attr() manpage
Date: Sun, 27 Apr 2014 15:45:58 -0400
Message-ID: <20140427154558.6b7c761b@gandalf.local.home>
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
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140427193449.GB17778@laptop.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Henrik Austad <henrik@austad.us>, Dario Faggioli <raistlin@linux.it>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Oleg Nesterov <oleg@redhat.com>, =?UTF-8?B?RnLDqWTDqXJpYw==?= Weisbecker <fweisbec@gmail.com>, darren@dvhart.com, johan.eker@ericsson.com, p.faure@akatech.ch, Linux Kernel <linux-kernel@vger.kernel.org>, Claudio Scordino <claudio@evidence.eu.com>, Michael Trimarchi <michael@amarulasolutions.com>, Fabio Checconi <fchecconi@gmail.com>, Tommaso Cucinotta <tommaso.cucinotta@sssup.it>, Juri Lelli <juri.lelli@gmail.com>, nicola.manica@disi.unitn.it, luca.abeni@unitn.it, Dhaval Giani <dhaval.giani@gmail.com>, hgu1972@gmail.com, Paul McKenney <paulmck@linux.vnet.ibm.com>, Insop Song <insop.song@gmail.com>, liming.wang@windriver.com, jkacur@redhat.com, linux-man <linux-man@vger.kerne>
List-Id: linux-man@vger.kernel.org

On Sun, 27 Apr 2014 21:34:49 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> > Also, is there any test code lying about somewhere that I could play with?

I have a deadline program you can play with too:

http://rostedt.homelinux.com/private/deadline.c

-- Steve
