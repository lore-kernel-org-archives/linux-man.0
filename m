From: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: ptrace.2: PTRACE_KILL needs a stopped process too
Date: Sun, 22 Apr 2012 22:04:59 +0200
Message-ID: <20120422200459.GA7519@redhat.com>
References: <20091216004533.22261.qmail@kosh.dhis.org> <CAKgNAkhtu8d0NKcTwWyCA8qWgz8Lag+GcpEE1=YMVe_Nh8XJ9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkhtu8d0NKcTwWyCA8qWgz8Lag+GcpEE1=YMVe_Nh8XJ9Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: pacman-ptgZXYu0fikgsBAKwltoeQ@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jan Kratochvil <jan.kratochvil-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pedro Alves <palves-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 04/23, Michael Kerrisk (man-pages) wrote:
>
> [widening CC]

add more CC's

> The man page says "For requests other than PTRACE_KILL,

Argh, PTRACE_KILL again.

You know, I simply do not know what it was supposed to do. I can only
see what the code actually does.

> the child process
> must be stopped."

Yes and no.

Yes, ptrace(PTRACE_KILL) "succeeds" even if the tracee is not stopped.

No, it has no effect if the tracee is not stopped.

All I can say is: PTRACE_KILL should never exist. If you want to kill
the tracee, you can do kill(SIGKILL).

Roughly, ptrace(PTRACE_KILL) is equal to ptrace(PTRACE_CONT, SIGKILL)
except it always returns 0.

> If the man page is describing actual intended kernel behavior, then it's a
> fairly long-standing kernel bug.

Perhaps. May be it should simply do kill(SIGKILL), but then it is not
clear why do we have PTRACE_KILL. And once again, I was never able to
understand the supposed behaviour.

Personally, I think we should fix the documentation. And imho the only
possible fix is to add this note: do not ever use PTRACE_KILL.

Oleg.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
