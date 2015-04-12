From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: gethostbyname.3
Date: Sun, 12 Apr 2015 10:09:46 +0200
Message-ID: <CAKgNAkj5Z3TYe6qrdyp3Nw+-EQd1pSYurCn+fCqzL2wWUDjvuQ@mail.gmail.com>
References: <CAGc9EvetrL3i+3wfHC5=Sh8kLhvsr8w0orp+ObeR6t9TFZ6e_w@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGc9EvetrL3i+3wfHC5=Sh8kLhvsr8w0orp+ObeR6t9TFZ6e_w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Jonny,

On 15 October 2014 at 00:34, Jonny Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
> Hello
> Just looking at this page:
>
> http://man7.org/linux/man-pages/man3/gethostbyname.3.html
>
> NO_ADDRESS or NO_DATA
>               The requested name is valid but does not have an IP address.
>
> These macros are actually the same value, is there a good way to
> explain that? i.e. no way to have a switch for both.
>
> perhaps just say NO_DATA, then add the following for compatibility?
>
> #define NO_ADDRESS NO_DATA
>
> Regards, Jonny

I added this sentence:

    The constant NO_ADDRESS is a synonym for NO_DATA.

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
