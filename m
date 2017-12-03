From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH RFC] stat.2: Document that stat can fail with EINTR
Date: Sat, 2 Dec 2017 18:25:04 -0800
Message-ID: <20171203022504.GA14505@bombadil.infradead.org>
References: <20171203002359.GA17037@juliacomputing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171203002359.GA17037@juliacomputing.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Keno Fischer <keno@juliacomputing.com>
Cc: linux-man@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk, mtk.manpages@gmail.com, tuomas@tuxera.com
List-Id: linux-man@vger.kernel.org

On Sat, Dec 02, 2017 at 07:23:59PM -0500, Keno Fischer wrote:
> The catalyst for this patch was me experiencing EINTR errors when
> using the 9p file system. In linux commit 9523feac, the 9p file
> system was changed to use wait_event_killable instead of
> wait_event_interruptible, which does indeed address my problem,
> but also makes me a bit unhappy, because uninterruptable waits
> prevents things like ^C'ing the execution and some debugging
> tools which depend on being able to cancel long-running operations
> by sending signals.

Wait, wait, wait.  killable is not uninterruptible.  It's "can accept
a signal if the signal is fatal".  ie userspace will never see it.
So, no, it doesn't prevent ^C.  It does prevent the debugging tool you're
talking about from working, because it's handling the signal, so it's not
fatal.

> I realize I'm probably 20 years too late here, but it feels like
> clarificaion on what to expect from the kernel would still go a long
> way here.  

A change to user-visible behaviour has to be opt-in.  So here's an idea --
a prctl() (or whatever) that says "I can handle EINTR on any syscall".
It would effectively change the *_killable logic to return EINTR on any
signal, not just fatal ones.  Best of luck auditing every syscall your
application  makes ... and every library it uses ... maybe dlopen()ed
like PAM modules ...

But we could do it!  And it's more sensible than "I want to change
individual syscalls one at a time as I notice each one is a problem".
