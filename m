From: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Subject: Re: [patch], iso_8859-*.7: Explanation of SOFT HYPHEN and the code
 for it
Date: Fri, 8 Jun 2012 21:15:40 +0000
Message-ID: <20120608211539.GA14325@rhi.hi.is>
References: <20120510194231.GA13127@rhi.hi.is>
 <CAKgNAkiw4yhNMM2vHdQ4yd2u_T0tLd34wpmUbuH9_ndPpEsg6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkiw4yhNMM2vHdQ4yd2u_T0tLd34wpmUbuH9_ndPpEsg6Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Jun 08, 2012 at 12:08:26AM +1200, Michael Kerrisk (man-pages) w=
rote:
> Hi Bjarni,
>=20
> On Fri, May 11, 2012 at 7:42 AM, Bjarni Ingi Gislason
> <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org> wrote:
> > Package: man-pages
> > Version: 3.40
> > Severity: minor
> > Tags: patch
> >
> > =A0From "groff -ww ...":
> >
> > <groff: iso_8859-2.7>:89: warning: can't find special character `sh=
c'
> >
> > =A0This is the only "iso_8859-*.7" file that has this (now)
> > undefined character. =A0The code in column four in "iso_8859-1.7" i=
s
> > "0x2D" ("HYPHEN, MINUS SIGN" or "HYPHEN-MINUS") instead of "0xAD".
> > See Debian bug 156154 (or package "manpages").
> >
> > =A0There should be an explanation for this graphic character and th=
e
> > code should be 0xAD in iso_8859-1.7 (as in all others), even though
> > "[gn]roff" does not display a "HYPHEN" in that position of the tabl=
e.
> >
> > =A0The line with "SOFT HYPHEN" gets a footnote and a short
> > explanation. =A0The footnote is from the official ISO standard.
> >
> > =A0Suggested patch for one of the files:
>=20
> Is there any reason that the explanation should be added to only one
> of the files? I'm somewhat inclined just to change the character, and
> not add the explanation (so that this page is similar to the others).
>=20

  No, because the source of the footnote is contained in it (ISO
8859-1:1987).  The wording in the other standards could be
different.  This note could also avoid reports of a "bug", that are
more than only corrections of wording.

[removed text]

> > =A0.TE
> > + =A0=B9 A graphic character that is imaged by a graphic symbol
> > +identical with, or similar to, that representing HYPHEN, for use
> > +when a line break has been established wihin a word.
> > +.BR "ISO 8859-1:1987" ,
> > +paragraph 6.3.3.
> > =A0.SH "SEE ALSO"
> > =A0.BR ascii (7),
> > =A0.BR iso_8859-15 (7)


--=20
Bjarni I. Gislason
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
