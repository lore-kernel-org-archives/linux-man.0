From: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Subject: Re: [patch], iso_8859-*.7: Explanation of SOFT HYPHEN and the code
 for it
Date: Tue, 19 Jun 2012 19:30:19 +0000
Message-ID: <20120619193019.GA710@rhi.hi.is>
References: <20120510194231.GA13127@rhi.hi.is>
 <CAKgNAkiw4yhNMM2vHdQ4yd2u_T0tLd34wpmUbuH9_ndPpEsg6Q@mail.gmail.com>
 <20120608211539.GA14325@rhi.hi.is>
 <CAKgNAkhWmVyJnsNTdOnascHOEQKY9Gesutyxn2kHeeRo2kx6_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkhWmVyJnsNTdOnascHOEQKY9Gesutyxn2kHeeRo2kx6_A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, Jun 09, 2012 at 10:50:50PM +1200, Michael Kerrisk (man-pages) w=
rote:
> Bjarni,
>=20
> On Sat, Jun 9, 2012 at 9:15 AM, Bjarni Ingi Gislason <bjarniig-5zMUtr2BsJg@public.gmane.org=
=2Eis> wrote:
> > On Fri, Jun 08, 2012 at 12:08:26AM +1200, Michael Kerrisk (man-page=
s) wrote:
> >> Hi Bjarni,
> >>
> >> On Fri, May 11, 2012 at 7:42 AM, Bjarni Ingi Gislason
> >> <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org> wrote:
> >> > Package: man-pages
> >> > Version: 3.40
> >> > Severity: minor
> >> > Tags: patch
> >> >
> >> > =A0From "groff -ww ...":
> >> >
> >> > <groff: iso_8859-2.7>:89: warning: can't find special character =
`shc'
> >> >
> >> > =A0This is the only "iso_8859-*.7" file that has this (now)
> >> > undefined character. =A0The code in column four in "iso_8859-1.7=
" is
> >> > "0x2D" ("HYPHEN, MINUS SIGN" or "HYPHEN-MINUS") instead of "0xAD=
".
> >> > See Debian bug 156154 (or package "manpages").
> >> >
> >> > =A0There should be an explanation for this graphic character and=
 the
> >> > code should be 0xAD in iso_8859-1.7 (as in all others), even tho=
ugh
> >> > "[gn]roff" does not display a "HYPHEN" in that position of the t=
able.
> >> >
> >> > =A0The line with "SOFT HYPHEN" gets a footnote and a short
> >> > explanation. =A0The footnote is from the official ISO standard.
> >> >
> >> > =A0Suggested patch for one of the files:
> >>
> >> Is there any reason that the explanation should be added to only o=
ne
> >> of the files? I'm somewhat inclined just to change the character, =
and
> >> not add the explanation (so that this page is similar to the other=
s).
> >>
> >
> > =A0No, because the source of the footnote is contained in it (ISO
> > 8859-1:1987). =A0The wording in the other standards could be
> > different. =A0This note could also avoid reports of a "bug", that a=
re
> > more than only corrections of wording.
>=20
> So, in other words, this change is relevant only for iso_8859-1.7, ri=
ght?
>=20
  Yes, confine it to ISO-8859-1.  I may have to change it.  I have
to clarify some issues with the Icelandic Standards (IST,
www.stadlar.is/english/) about the use of IST/ISO standards.  The
policy of ISO is now very strict about what may be used without
permission.

--=20
Bjarni I. Gislason
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
