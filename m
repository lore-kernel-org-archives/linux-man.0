From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: syscall(2)
Date: Mon, 6 Mar 2017 12:01:19 +0100
Message-ID: <CAKgNAkg1iRisrd18WHn64j1NWAs2T0hrsc7dRoZs4XPV_22uhA@mail.gmail.com>
References: <CABLBYvTBKvQXSmiGx3LOUoFHZDGAMmNCofcuHTiKW51kS2bh4g@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABLBYvTBKvQXSmiGx3LOUoFHZDGAMmNCofcuHTiKW51kS2bh4g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Victor Khimenko <khim-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Changhee Han <ch0.han-Hm3cg6mZ9cc@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[Extending the CC for some other input. Changhee Han added the text
that you are asking about; Mike F has done a lot of other work on the
page. Perhaps they can comment.]

On 5 March 2017 at 09:08, Victor Khimenko <khim-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
> syscall(2) example includes the following snippet which explains how to
> call readahead on ARM:
>
>        syscall(SYS_readahead, fd, 0,
>                    (unsigned int) (offset >> 32),
>                    (unsigned int) (offset & 0xFFFFFFFF),
>                    count);
>
> But ARM EABI specifies that "A double-word sized type is passed in two
> consecutive registers (e.g., r0 and r1, or r2 and r3). The content of
> the registers is as if the value had been loaded from memory representation
> with a single LDM instruction."
>
> This would imply that arguments are swapped around in the man page, no?

So, I'm taking it that you mean the call should look like this:

       syscall(SYS_readahead, fd, 0,
                   (unsigned int) (offset & 0xFFFFFFFF),
                   (unsigned int) (offset >> 32),
                  count);

Is that what you mean?

> I've tried to experiement and with ftruncate, at least, it works like
> this...

Sounds plausible. I'm hoping that Mike or Changhee Han might comment.

Cheers,

Michael

> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
