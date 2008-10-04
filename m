From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: sigaction(2)
Date: Sat, 4 Oct 2008 08:51:33 +0200
Message-ID: <cfd18e0f0810032351m62a23d76s52ebdb80a0338531@mail.gmail.com>
References: <b75ef8170810031631l3b9ee93dld14ca6aa7cd744df@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b75ef8170810031631l3b9ee93dld14ca6aa7cd744df-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gergely Soos <sogerc1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Gergely,

[Best to CC linux-man on man-pages comments and bug reports; CC added]

On Sat, Oct 4, 2008 at 1:31 AM, Gergely Soos <sogerc1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Greetings,
>
> I have a suggestion for the manpage of sigaction(2): It should state that a
> signal can be blocked and the list of blocked signals is inherited from the
> parent process.
> It would have saved me hours of struggling if it did state it. (
> http://bugs.kde.org/show_bug.cgi?id=170418 )

My response to your bug report is multi-levelled ;-).

0. Since sigaction(2)'s purpose is primarily about setting signal
dispositions, that page is not really the right place for describing
the samantics of the signal mask with respect to fork(), or to explain
that a signal can be blocked.

1. These (rather fundamental) facts are already covered in signal(7),
which provides an overview of signals and attempts to point the reader
to all of the other relevant man page sfor each topic, and
sigprocmask(), which describes the details of how to block a signal.

2. This raises the question: why didn't you read signal(7)?  It is
listed in the SEE ALSO section at the bottom of the page, and also in
a couple of other places in the page.

3. Answering my own question: perhaps (probably!) the sigaction(2) man
page just isn't explicit enough about referring the reader to
signal(7).  So I added a sentence to the very first paragraph to
explicitly refer the reader to signal(7).

4. Your report actually prompted me to go through various
signal-related pages to see how well they describe the semantics with
respect to fork() and execve().  Among other things I now added text
to signal(7) describing the semantics with respect to fork() and
execve() for signal dispositions, signal mask, and pending signals.
Here's a summary (full details via git) of today's changes that I made
after your report:

signal.7: describe semantics w.r.t. fork() and execve()
sigaction.2: refer reader to signal(7) for an overview of signals
sigaction.2: explain semantics of signal disposition during fork() and execve()
sigwaitinfo.2: distinguish per-thread and process-wide signals
sigwaitinfo.2: these interfaces have per-thread semantics
sigaltstack.2: explain inheritance of alternate signal stack across fork(2)
sigpending.2: explain effect of fork() and execve() for pending signal set
sigpending.2: explain how thread's pending signal set is defined
sigprocmask.2: explain effects of fork() and execve() for signal mask
sigaction.2: refer to signal(7) for more details on signal mask.

All of these changes will be in man-pages-3.11, and are already
available via git.

Thanks for your report!

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
