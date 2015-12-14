From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: fopen64?
Date: Mon, 14 Dec 2015 18:11:07 +0100
Message-ID: <CAKgNAkjHfsuGO+6Gj6pRuuBvpSks_X63FGe8n3HY7+9Ot_zXvw@mail.gmail.com>
References: <CAA9w_=e0m-qge6Ak6iqqDP5UJYDRxEGxZ+prTWTEhfDfVT6G_Q@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAA9w_=e0m-qge6Ak6iqqDP5UJYDRxEGxZ+prTWTEhfDfVT6G_Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Klaas van Gend <klaas-HLxaoXkP2nncuFa4XdTGZAC/G2K4zDHf@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Klaas,

On 14 December 2015 at 16:14, Klaas van Gend <klaas-HLxaoXkP2nncuFa4XdTGZAC/G2K4zDHf@public.gmane.org> wrote:
> Hi Michael and other man page maintainers,
>
> I just noticed that fopen64() is not mentioned in the man pages.
>
> http://www.gnu.org/software/libc/manual/html_node/Opening-Streams.html
>
> It apparently is very similar to fopen(), but automatically sets the large
> files flag.

Yes.

> If I understand the gnu page correctly, on a 64-bit system like mine,
> fopen64() is identical to fopen(), it's only on 32-bit systems that there is
> an actual difference.

Yes.

> Also, fopen64() is not actually POSIX.
> Still, it may be good to actually mention this in the man page.
> Unfortunately, I don't feel comfortable to actually write a patch. Sorry
> about that.
> Love to hear your thoughts!

There's actually many such APIs in glibc. The come from LFS:
http://www.unix.org/version2/whatsnew/lfs20mar.html

Historically, they were important, but not much so these days. Ideally
all of these would have man pages, but there's unfortunately limited
time and higher priorities (for me).

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
