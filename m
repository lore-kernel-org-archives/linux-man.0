From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Non utf8 characters in page standards.7
Date: Sun, 12 Apr 2015 09:22:49 +0200
Message-ID: <CAKgNAkhQKtQ-hDyi2NzWZ-icWwVP3ECc-NBXPy89Lu-UY=2a-w@mail.gmail.com>
References: <CAGc9EveXMqUoTRDtjWE0h6rqXNcchdxghJZ9DMd0xR399aZMBQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGc9EveXMqUoTRDtjWE0h6rqXNcchdxghJZ9DMd0xR399aZMBQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 9 October 2014 at 13:24, Jonny Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
> http://man7.org/linux/man-pages/man7/standards.7.html
>
> Hello
> I noticed this page has come corrupt bytes in HTML source:
>
> under the auspices of the Austin group
> ??<a href="http://www.opengroup.org/austin/">http://www.opengroup.org/austin/</a>??.
>
>
> See ?? in my quote above.
>
> In hex, the bytes are E2 9F A8  and  E2 9F A9
>
> Any ideas?
>
> There are other occurances with other links too. may affect other pages too

These are the characters generated to the .UR/.UE macro pair (see groff_man(7)).

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
