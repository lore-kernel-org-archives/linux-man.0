From: Pedro Alves <palves@redhat.com>
Subject: Re: ptrace.2: PTRACE_KILL needs a stopped process too
Date: Wed, 09 May 2012 23:08:15 +0100
Message-ID: <4FAAEACF.3070405@redhat.com>
References: <20091216004533.22261.qmail@kosh.dhis.org> <CAKgNAkhtu8d0NKcTwWyCA8qWgz8Lag+GcpEE1=YMVe_Nh8XJ9Q@mail.gmail.com> <20120422200459.GA7519@redhat.com> <201205091109.35637.vapier@gentoo.org> <4FAAC706.6000808@redhat.com> <20120509201219.GA32051@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120509201219.GA32051@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleg Nesterov <oleg@redhat.com>
Cc: Mike Frysinger <vapier@gentoo.org>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, pacman@kosh.dhis.org, linux-man <linux-man@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Denys Vlasenko <dvlasenk@redhat.com>, Tejun Heo <tj@kernel.org>, Jan Kratochvil <jan.kratochvil@redhat.com>
List-Id: linux-man@vger.kernel.org

On 05/09/2012 09:12 PM, Oleg Nesterov wrote:

> tgkill() can kill the wrong process/thread too, although it lessens the risk.

> 
> But I don't really understand the problem. The traced thread can't go away

> until the tracer does wait/detach, and thus its pid can't be reused?


There's the non-leader thread execs and tracer didn't enable
PTRACE_O_TRACEEXEC case at least, while you try to kill the thread that just
execed, I think.  Though that's quite pedantic.  The tracer could prevent this
in other ways.

> May be, "by accident" above means something else, not pid reuse...


Pffft, who writes buggy code anyway?  ;-)

-- 
Pedro Alves
