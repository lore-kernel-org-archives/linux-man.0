From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ptrace.2: explain WNOHANG behavior and EINTR bug better
Date: Fri, 3 Aug 2012 06:33:28 +0200
Message-ID: <CAKgNAkg7tUQOkGq8E-sU-LhNKx5MR9zCf6w_7ih_Z1ePOv4q4A@mail.gmail.com>
References: <CAK1hOcOn3TLvvm4EUqr2YZSc_srDdFmQ4hBVqVoxQGKHAR9sfg@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK1hOcOn3TLvvm4EUqr2YZSc_srDdFmQ4hBVqVoxQGKHAR9sfg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denys Vlasenko <vda.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[Adding linux-man@ to CC. Always best to CC the list please.]

Hi Denys,

On Tue, Jul 3, 2012 at 3:46 PM, Denys Vlasenko <vda.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Michael,
>
> Please review the next patch for ptrace.2 man page.

Thanks! I tweaked the formatting and language a little, but otherwise
applied as you gave it.

Thanks for this further work on the page. That page saw little love
for years, and you've improved hugely in the last year or so.

Cheers,

Michael

> (I have to attach the patch instead of pasting it inline,
> gmail's web interface will mangle it. Sorry...)
>
> Changes:
>
> I didn't like "SIGKILL operates similarly, with exceptions"
> phrase (if it's different, then it's not "similar", right?),
> and now I got around to changing it. Now it says simply:
> "SIGKILL does not generate signal-delivery-stop and therefore
> the tracer can't suppress it."
>
> Replaced "why WNOHANG is not reliable" example with a more
> realistic one (the one which actually inspired to add this
> information to man page in the first place): we got
> ESRCH - process is gone! - but waitpid(WNOHANG) can still
> confusingly return 0 "no processes to wait for".
>
> Replaced "This means that unneeded trailing arguments may
> be omitted" part with a much better recommendation
> to never do that and to supply zero arguments instead.
> (The part about "undocumentedness" of gcc behavior was bogus,
> btw - deleted).
>
> Expanded BUGS section with the explanation and an example
> of visible strace behavior on the buggy syscalls which
> exit with EINTR on ptrace attach. I hope this will lead
> to people submitting better bug reports to lkml about
> such syscalls.
>
> --
> vda



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
