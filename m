From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: dlopen(3) and RTLD_NODELETE
Date: Fri, 15 Mar 2013 08:49:08 +0100
Message-ID: <CAKgNAkhZkmiCRL4gcmBMAisb87WBGUVnNHkgoqVCPLLhD8QAhQ@mail.gmail.com>
References: <CACKs7VDM8w7U1g0pQZjTK=_uLFq22kwoPG8WA-Hd4X=jhXTXgg@mail.gmail.com>
 <CAKgNAkge90n18PN5LW3Ff1x9vFiYsJ9G36UOP+v44GR6UJ8R+w@mail.gmail.com> <CACKs7VDh1UwO_+D0pFPOCtxaY+=G5OKq4FNGEsaPBHZkYtjzOg@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACKs7VDh1UwO_+D0pFPOCtxaY+=G5OKq4FNGEsaPBHZkYtjzOg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Mar 15, 2013 at 8:36 AM, Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi,
>
>> What you say sounds reasonable, but I'd like to verify. Are you able
>> to provide a very simple program for testing this, and a demo script
>> of how to demonstrate it?
>
> Not right now, let me have a look, it shouldn't be too complicated. Do
> you want something that could be incorporated as an example in the man
> page (hmm, probably not), or simply something to demonstrate the
> behavior?

The latter.

> If you're interested in the latter, I can hack something on
> top of the TLPI examples.

I don't mind too much as long as it's simple and easy to reproduce.

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
