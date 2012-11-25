From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: memcmp and strcmp man page duplication
Date: Sun, 25 Nov 2012 17:24:45 +0100
Message-ID: <CAKgNAkhJgzv4Zduof4PZVt1DViG2xiwENSrBt=dL7+1zZT2SsQ@mail.gmail.com>
References: <CAGc9EverQ1Ak1_zDkzYXchpcgszzHdB8crtaQa_kgzAqVzHdJQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGc9EverQ1Ak1_zDkzYXchpcgszzHdB8crtaQa_kgzAqVzHdJQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Jon,

On Fri, Nov 23, 2012 at 2:01 PM, Jon Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
> Hello
>
> http://man7.org/linux/man-pages/man3/memcmp.3.html
>
> "DESCRIPTION" section contains a duplicate description of the "RETURN
> VALUE" section. My suggestion would be to ask if the "DESCRIPTION"
> section should be reduced.
>
> http://man7.org/linux/man-pages/man3/strcmp.3.html
> ^ Also same duplication.

Thanks for noting this. I've fixed the problem you note in these two apges.

> Pages that are fine:
> http://man7.org/linux/man-pages/man3/wmemcmp.3.html
> http://man7.org/linux/man-pages/man3/wcsncmp.3.html
> http://man7.org/linux/man-pages/man3/wcscmp.3.html
>
>
> Secondary feedback is that I found the return value description a
> little wordy. Would be clearer to simply say:
> "
> <0: less than n bytes of s2 matched
>  0: n bytes of s1 and s2 are matched.
>>0: s1 is greater than the first n bytes of s2
> "

I'm not too worried about this though, so I'll leave it.

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
