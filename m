From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: missing line in open(2)
Date: Sat, 19 Nov 2016 11:10:18 +0100
Message-ID: <CAKgNAkikCZHxYU==UqXzaRheO=joYLeRNvRQ_JZ_RWQNn+ispQ@mail.gmail.com>
References: <201611152135.uAFLZ5U6003041@coolidge.cs.Dartmouth.EDU>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201611152135.uAFLZ5U6003041-8cbNVySx9MqOSLXqXb3LzA+Np0iZ7rV0uDuwTybUTCk@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug McIlroy <doug-bJGkzYaaMJvEkZP4S/TgZg@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Doug,

On 15 November 2016 at 22:35, Doug McIlroy <doug-bJGkzYaaMJvEkZP4S/TgZg@public.gmane.org> wrote:
>
> Open(2) synopsis omits
>         #include <unistd.h>

I'm puzzled here. Linux doesn't need this header file, FreeBSD doesn't
document it, and nor do SUSv2, POSIX.1-2001, and POSIX.1-2008. Have I
misunderstood something?

> P.S. I applaud this policy about trivial fixes:
> "Please do not report such bugs via the bugzilla. Doing so creates unnecessary bugzilla administrative overhead."

My attempt to make everyone's life simpler...

Thank you for pipelines!

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
