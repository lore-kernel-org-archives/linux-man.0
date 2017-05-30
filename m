From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: signals: Bug or manpage inconsistency?
Date: Tue, 30 May 2017 19:04:14 +0200
Message-ID: <20170530170414.GA22463@redhat.com>
References: <alpine.DEB.2.20.1705301402270.1950@nanos>
 <alpine.DEB.2.20.1705301750390.1950@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <libc-alpha-return-79833-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1705301750390.1950@nanos>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Michael Kerrisk <mtk.manpages@gmail.com>, linux-man@vger.kernel.org, libc-alpha@sourceware.org
List-Id: linux-man@vger.kernel.org

On 05/30, Thomas Gleixner wrote:
>
> So I found at least some explanation by studying the spec some more.
>
> There are two variants of ignored signals:
>
>   1) handler is SIG_IGN
>
>   2) handler is SIG_DFL and default action is 'ignore'

Yes, and note that sys_rt_sigaction() discard the pending signal in both cases.
So even with this change the logic won't look 100% consistent.

I can't comment, I never tried to understand the rationality behind the current
behaviour. But at least the sending path should never drop a blocked SIG_DFL
signal, there is no other way to ensure you won't miss a signal during exec.

> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -70,6 +70,13 @@ static int sig_handler_ignored(void __us
>  		(handler == SIG_DFL && sig_kernel_ignore(sig));
>  }
>
> +static int sig_handler_is_sigign(struct task_struct *t, int sig)
> +{
> +	void __user *handler = sig_handler(t, sig);
> +
> +	return handler == SIG_IGN;
> +}
> +
>  static int sig_task_ignored(struct task_struct *t, int sig, bool force)
>  {
>  	void __user *handler;
> @@ -91,7 +98,7 @@ static int sig_ignored(struct task_struc
>  	 * unblocked.
>  	 */
>  	if (sigismember(&t->blocked, sig) || sigismember(&t->real_blocked, sig))
> -		return 0;
> +		return sig_handler_is_sigign(t, sig);

we can probably make a simpler change, but this doesn't matter.

Obviously this is a user-visible change and it can break something. Say, an
application does sigwaitinfo(SIGCHLD) and SIGCHLD is ignored (SIG_IGN), this
will no longer work.

I won't argue, but perhaps it is too late change this historical behaviour.




Although perhaps we can cleanup do_sigtimedwait() for the start. ->real_blocked
doesn't look nice. I think we can replace it with task->sigwait_mask and then
change sig_handler() to do

	sigismember(sigwait_mask, sig) ? SIG_ERR :
		t->sighand->action[sig - 1].sa.sa_handler;

this needs other changes, say, sig_fatal() will need to use sig_handler() too.
Then it would be more safe to drop the SIG_IGN signals unconditionally.

Oleg.
