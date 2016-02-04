From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: poll(2) and select(2) should document spurious EAGAIN for
 portable programs
Date: Thu, 4 Feb 2016 12:36:02 +0100
Message-ID: <CAKgNAkiLzwDoXnJaxvN6vDCiLi=Dza=BJQiqwDuacV7=N9A5qA@mail.gmail.com>
References: <20150823073212.GA20753@x>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150823073212.GA20753@x>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Josh,


On 23 August 2015 at 09:32, Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org> wrote:
> On some systems (reported by Jeremy Sequoia as occurring on Darwin),
> poll(2) and select(2) can spuriously return EAGAIN if they fail to
> allocate kernel-internal resources, rather than ENOMEM as Linux does.
> The spec allows this for poll(2):
> http://pubs.opengroup.org/onlinepubs/9699919799/functions/poll.html says
> poll may return EAGAIN if "The allocation of internal data structures
> failed but a subsequent request may succeed."  The spec for select(2)
> at http://pubs.opengroup.org/onlinepubs/9699919799/functions/select.html
> doesn't specify EAGAIN, but apparently Darwin can return it in that case
> too.
>
> I'd suggest the following text for poll(2)'s NOTES section:
>
> Some other UNIX systems can return EAGAIN if they fail to allocate
> kernel-internal resources, rather than ENOMEM as Linux does.  The Single
> Unix Specification allows this behavior for poll(2).  Portable programs
> may wish to check for EAGAIN and loop, just as with EINTR.
>
>
> And the following text for select(2)'s NOTES section:
>
> Some other UNIX systems can return EAGAIN if they fail to allocate
> kernel-internal resources, rather than ENOMEM as Linux does.  The Single
> Unix Specification allows this behavior for poll(2), but not for
> select(2); nonetheless, some systems do return EAGAIN from select(2).
> Portable programs may wish to check for EAGAIN and loop, just as with
> EINTR.

I've added text to both pages similar to what you proposed above.

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
