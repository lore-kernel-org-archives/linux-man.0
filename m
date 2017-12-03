From: Keno Fischer <keno@juliacomputing.com>
Subject: Re: [PATCH RFC] stat.2: Document that stat can fail with EINTR
Date: Sat, 2 Dec 2017 22:15:33 -0500
Message-ID: <CABV8kRwbsjW1XbybDx12HmC9Gd1_5_C-KDhdtEz12KSZf-84_Q@mail.gmail.com>
References: <20171203002359.GA17037@juliacomputing.com> <20171203022504.GA14505@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171203022504.GA14505@bombadil.infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-man@vger.kernel.org, linux-fsdevel@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, viro@zeniv.linux.org.uk, Michael Kerrisk-manpages <mtk.manpages@gmail.com>, tuomas@tuxera.com
List-Id: linux-man@vger.kernel.org

Resending as plain text (apologies for those receiving it twice, and
those that got
an HTML copy, I'm used to my mail client switching that over
automatically, which
for some reason didn't happen here).


This is exactly the discussion I want to generate, so thank you.
I should point out that I'm not advocating for anything other
than clarity of what kernel behavior user space may assume.


On Sat, Dec 2, 2017 at 9:25 PM, Matthew Wilcox <willy@infradead.org> wrote:
> On Sat, Dec 02, 2017 at 07:23:59PM -0500, Keno Fischer wrote:
>> The catalyst for this patch was me experiencing EINTR errors when
>> using the 9p file system. In linux commit 9523feac, the 9p file
>> system was changed to use wait_event_killable instead of
>> wait_event_interruptible, which does indeed address my problem,
>> but also makes me a bit unhappy, because uninterruptable waits
>> prevents things like ^C'ing the execution and some debugging
>> tools which depend on being able to cancel long-running operations
>> by sending signals.
>
> Wait, wait, wait.  killable is not uninterruptible.  It's "can accept
> a signal if the signal is fatal".  ie userspace will never see it.
> So, no, it doesn't prevent ^C.  It does prevent the debugging tool you're
> talking about from working, because it's handling the signal, so it's not
> fatal.

This probably shows that I've been in REPL based environments too long,
that catch SIGINT ;). You are of course correct that a fatal SIGINT would
still be delivered.

>> I realize I'm probably 20 years too late here, but it feels like
>> clarificaion on what to expect from the kernel would still go a long
>> way here.
>
> A change to user-visible behaviour has to be opt-in.

I agree. However, it was my impression that stat() can return EINTR
depending on the file system. Prior to the referenced commit,
this was certainly true on 9p and I suspect it's not the only network file
system for which this is true (though prior to my experiencing this
with 9p, the only
time I've ever experienced it was on HPC clusters with who knows what
code providing the network filesystem). If it is indeed the case that
an EINTR return from stat() and similar is illegal and should be considered
a kernel bug, a statement to that extent all I'm looking for here.
