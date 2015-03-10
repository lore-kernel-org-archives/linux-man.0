From: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: Question about seccomp(2) man page example code
Date: Tue, 10 Mar 2015 10:41:26 -0700
Message-ID: <CAGXu5j+GCk9boJyMJ4nQfFsK=6eoX_dN1efFAG6MqzPnLDjM7w@mail.gmail.com>
References: <CAKgNAkhz=Dx9SRVadU_cVEiU-yxjAPxANwd2ZyJUxoWZkYUQEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkhz=Dx9SRVadU_cVEiU-yxjAPxANwd2ZyJUxoWZkYUQEQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, Mar 10, 2015 at 10:24 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Kees,
>
> I was looking further at the seccomp(2) man page we put togetehr a
> while ago, and in particular at the example [1]. I realized that from
> a readability view, the order of the statements is rather contorted,
> so that we have branches to the end of the code (labels 5 and 6) to
> handle the syscall and arch mismatch cases, rather than swapping the
> branch order on the statements labeled 0 and 1, and having the kill
> statements immediately follow the test statements.
>
> However, I presume the ordering is as it is for efficiency reasons, so
> that the common case involves no branch forward (i.e., a branch offset
> of 0). Is that the case? If so, probably something should be said in
> the man page.

I've never attempting timing tests to see if branching in the common
path is actually any more expensive, but it's not unreasonable. I
think the main reason it was written this way was actually for size.
There's 1 kill statement, which avoids repeating it, and (I think) is
more readable. Ultimately, it's really up to the author of the filter
to do what they want, but there wasn't a specific speed efficiency
goal with how it was written.

-Kees

-- 
Kees Cook
Chrome OS Security
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
