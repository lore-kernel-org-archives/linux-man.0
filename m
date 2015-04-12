From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: strcasecmp
Date: Sun, 12 Apr 2015 09:45:27 +0200
Message-ID: <CAKgNAkhfSn4s9higqgzNXJew_jywC7daR0+Z__rcjFC2pfozmg@mail.gmail.com>
References: <CAGc9EvfOOamRbXtG_jtNS8cfFkTupJtkrb74nNSu2KhF_j=zVg@mail.gmail.com>
 <CAGc9EvfXHQAK3=NiMx+1gG8YbnF48+8JGh0MpnH1JRdD52ET7A@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGc9EvfXHQAK3=NiMx+1gG8YbnF48+8JGh0MpnH1JRdD52ET7A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 2 September 2014 at 15:16, Jonny Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
> Hello
>
> http://man7.org/linux/man-pages/man3/strcasecmp.3.html
>
> Is it worth clarifying that this is a byte-wise comparison, or does it also
> check locale?

It's byte-wise, AFAIK. POSIX says:

        When the LC_CTYPE category of the locale being used is  from  the
        POSIX  locale, these functions shall behave as if the strings had
        been converted to lowercase and then a byte comparison performed.
         Otherwise, the results are unspecified.

I added some text to the man page to clarify.

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
