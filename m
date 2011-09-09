From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: mbstowcs wcsncpy wcsnrtombs wcsrtombs
Date: Fri, 9 Sep 2011 16:09:41 +0200
Message-ID: <CAKgNAkirEaYwXJ-bqvHM=4fWAQRZYK3mFouMr8Q8jmSLc+B4eg@mail.gmail.com>
References: <BANLkTi=oB_g=L7bnOK1fOYL3VDT63xtZVA@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BANLkTi=oB_g=L7bnOK1fOYL3VDT63xtZVA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Jon,

On Thu, May 5, 2011 at 11:30 PM, Jon Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
> Hello
>
> I wonder if these man pages could refer to each other:
>
> http://www.kernel.org/doc/man-pages/online/pages/man3/mbstowcs.3.html
>
>
> http://www.kernel.org/doc/man-pages/online/pages/man3/wcsncpy.3.html
>
>
> https://www.kernel.org/doc/man-pages/online/pages/man3/wcsnrtombs.3.html
>
> https://www.kernel.org/doc/man-pages/online/pages/man3/wcsrtombs.3.html

I did the following:

    wcstombs.3: SEE ALSO: add mbstowcs(3)
    mbstowcs.3: SEE ALSO: add reference to wcstombs(3)

But I'm not sure that more is needed.

> In addition. Could I ask if it is possible to indicate if "wchar_t" is
> UTF-16 format, and if "multi-byte char" is UTF8 format? Would be
> useful to clarify that on the man pages.

If you can send me a clarification, I'd add it to the appropriate page.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
