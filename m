From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Erroneous text about EINTR in futex man page
Date: Thu, 15 Jan 2015 10:00:14 +0100
Message-ID: <54B7819E.3050409@gmail.com>
References: <20141204190846.GA25606@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141204190846.GA25606-C3MtFaGISjmo6RMmaWD+6Sb1p8zYI1N1@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Rich,

On 12/04/2014 08:08 PM, Rich Felker wrote:
> The following text in the futex(2) man page seems incorrect:
> 
>        EINTR  A FUTEX_WAIT operation was interrupted by a signal (see
>               signal(7)) or a spurious wakeup.
> 
> I see no code in the kernel whereby a "spurious wakeup", or anything
> other than interruption by a signal handler that's not SA_RESTART, can
> cause futex to fail with EINTR. In general, overloading of EINTR
> and/or spurious EINTRs from a syscall make it impossible to use that
> syscall for implementing any function where EINTR is a mandatory
> failure on interruption-by-signal, since there is no way for userspace
> to distinguish whether the EINTR occurred as a result of an
> interrupting signal or some other reason. The kernel folks have gone
> to great lengths to fix spurious EINTRs (see signal(7) for history),
> especially by non-interrupting signal handlers, including in futex,
> and allowing EINTR here would be contrary to that goal.
> 
> It's my belief that the "or a spurious wakeup" text should simply be
> removed.
> 
> The reason I'm raising this topic is its relevance to a thread on
> libc-alpha:
> [RFC] mutex destruction (#13690): problem description and workarounds

I do not know whether your belief is correct or not. However, I am 
currently working on a fairly large revision of the futex(2) man page, 
and I've dropped your question in as a FIXME for reviewer comment. 
You'll be CCed on the review mail when the new draft of the page goes
out (hopefully soon).

Cheers,

Michael

PS Reports like this could be made more useful by providing
actual links to the bug and mailing list discussion.
As it is, I am forced to guess which bug tracker you refer to
(okay -- fairly obvious, but still...) and hunt the mailing list
archive, in order to get these links:

https://sourceware.org/bugzilla/show_bug.cgi?id=13690
https://sourceware.org/ml/libc-alpha/2014-12/threads.html#00011

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
