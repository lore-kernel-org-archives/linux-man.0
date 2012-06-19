From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch], iso_8859-*.7: Explanation of SOFT HYPHEN and the code
 for it
Date: Tue, 19 Jun 2012 09:59:32 +0200
Message-ID: <CAKgNAkjnSAGzu8DcrcZo2jzO6nodDr573ksboL=aCTB_W8E-KQ@mail.gmail.com>
References: <20120510194231.GA13127@rhi.hi.is> <CAKgNAkiw4yhNMM2vHdQ4yd2u_T0tLd34wpmUbuH9_ndPpEsg6Q@mail.gmail.com>
 <20120608211539.GA14325@rhi.hi.is> <CAKgNAkhWmVyJnsNTdOnascHOEQKY9Gesutyxn2kHeeRo2kx6_A@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkhWmVyJnsNTdOnascHOEQKY9Gesutyxn2kHeeRo2kx6_A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Bjarni,

Ping?

Thanks,

Michael


On Sat, Jun 9, 2012 at 12:50 PM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Bjarni,
>
> On Sat, Jun 9, 2012 at 9:15 AM, Bjarni Ingi Gislason <bjarniig-5zMUtr2BsJg@public.gmane.org=
=2Eis> wrote:
>> On Fri, Jun 08, 2012 at 12:08:26AM +1200, Michael Kerrisk (man-pages=
) wrote:
>>> Hi Bjarni,
>>>
>>> On Fri, May 11, 2012 at 7:42 AM, Bjarni Ingi Gislason
>>> <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org> wrote:
>>> > Package: man-pages
>>> > Version: 3.40
>>> > Severity: minor
>>> > Tags: patch
>>> >
>>> > =A0From "groff -ww ...":
>>> >
>>> > <groff: iso_8859-2.7>:89: warning: can't find special character `=
shc'
>>> >
>>> > =A0This is the only "iso_8859-*.7" file that has this (now)
>>> > undefined character. =A0The code in column four in "iso_8859-1.7"=
 is
>>> > "0x2D" ("HYPHEN, MINUS SIGN" or "HYPHEN-MINUS") instead of "0xAD"=
=2E
>>> > See Debian bug 156154 (or package "manpages").
>>> >
>>> > =A0There should be an explanation for this graphic character and =
the
>>> > code should be 0xAD in iso_8859-1.7 (as in all others), even thou=
gh
>>> > "[gn]roff" does not display a "HYPHEN" in that position of the ta=
ble.
>>> >
>>> > =A0The line with "SOFT HYPHEN" gets a footnote and a short
>>> > explanation. =A0The footnote is from the official ISO standard.
>>> >
>>> > =A0Suggested patch for one of the files:
>>>
>>> Is there any reason that the explanation should be added to only on=
e
>>> of the files? I'm somewhat inclined just to change the character, a=
nd
>>> not add the explanation (so that this page is similar to the others=
).
>>>
>>
>> =A0No, because the source of the footnote is contained in it (ISO
>> 8859-1:1987). =A0The wording in the other standards could be
>> different. =A0This note could also avoid reports of a "bug", that ar=
e
>> more than only corrections of wording.
>
> So, in other words, this change is relevant only for iso_8859-1.7, ri=
ght?
>
> Thanks,
>
> Michael
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Author of "The Linux Programming Interface"; http://man7.org/tlpi/



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
