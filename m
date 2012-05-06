From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch], syscalls(2): Table too wide for line length, use text blocks
Date: Mon, 7 May 2012 09:24:23 +1200
Message-ID: <CAKgNAkgh15WpOCjaM5D03jcPh1WyvaCsbDCoyD6R7AUWLv_OHw@mail.gmail.com>
References: <20120506201024.GA1067@rhi.hi.is> <CAKgNAkhKm7-WvYnAG9XQDpvf1AX0MchFAUhgXBO++2Hor93AJQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkhKm7-WvYnAG9XQDpvf1AX0MchFAUhgXBO++2Hor93AJQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, May 7, 2012 at 9:09 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Bjarni,
>
> On Mon, May 7, 2012 at 8:10 AM, Bjarni Ingi Gislason <bjarniig-5zMUtr2BsJg@public.gmane.org=
=2Eis> wrote:
>> Package: man-pages
>> Version: 3.40
>> Severity: minor
>> Tags: patch
>>
>> =A0From "groff -ww ..." (or "man --warnings=3Dw ..."):
>>
>> warning: around line 157: table wider than line width
>>
>> =A0Have to use text blocks. =A0Move some text to its correct column.
>> =A0Split text to two columns to avoid hyphenation.
>>
>> =A0Patch:
>
> I thought further about your patch. What it needed as
> .ad l
> .ad j

I got that slightly wrong. Should be

=2Ead l
=2Ead

around the table.

Thanks,

Michael
--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
