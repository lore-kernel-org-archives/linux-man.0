From: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: For review: timer_create.2
Date: Wed, 11 Feb 2009 09:30:30 +0100
Message-ID: <1234341030.23438.109.camel@twins>
References: <4990DE09.7020801@gmail.com>  <1234340803.23438.107.camel@twins>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1234340803.23438.107.camel@twins>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, 2009-02-11 at 09:26 +0100, Peter Zijlstra wrote:
> On Tue, 2009-02-10 at 14:53 +1300, Michael Kerrisk wrote:
> >        static void
> >        handler(int sig, siginfo_t *si, void *uc)
> >        {
> >            /* Note: calling printf() from a signal handler is not
> >               strictly correct, since printf() is not async-signal-safe;
> >               see signal(7) */
> > 
> >            printf("Caught signal %d\n", sig);
> >            print_siginfo(si);
> >            signal(SIG, SIG_IGN);
> >        }
> 
> Is that actually safe to do?
> 
> I can remember getting into deadlocks by doing this some few years ago.
> 
> The problem was that glibc uses a mutex to guard its memory area for the
> malloc memory pool, and signals can come in while the main thread of
> execution is within that mutex, if at that point the signal handler also
> tries to use anything using malloc (here, I was thinking printf()
> might), you've got a deadlock.
> 
> One thing I always enjoyed about the QNX man-pages was that it
> explicitly states which functions are and are _NOT_ signal safe, iow
> which functions can be reliably used from signal handler context.

Right, so maybe if I had read the comment this time... I'm so trained to
ignore comments in code :-)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
