From: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Subject: Re: [patch], iso_8859-*.7: Explanation of SOFT HYPHEN and the code
 for it
Date: Wed, 15 Aug 2012 22:16:20 +0000
Message-ID: <20120815221620.GA25304@rhi.hi.is>
References: <20120510194231.GA13127@rhi.hi.is>
 <CAKgNAkiw4yhNMM2vHdQ4yd2u_T0tLd34wpmUbuH9_ndPpEsg6Q@mail.gmail.com>
 <20120608211539.GA14325@rhi.hi.is>
 <CAKgNAkhWmVyJnsNTdOnascHOEQKY9Gesutyxn2kHeeRo2kx6_A@mail.gmail.com>
 <20120619193019.GA710@rhi.hi.is>
 <CAKgNAkjKkHSKf1C5p5yts8Uuv9LoYFRQFr2JATNxf5fSh+8A_w@mail.gmail.com>
 <20120710234614.GA9921@rhi.hi.is>
 <CAKgNAkip2ddHEmE8wMcA98O7hy5_esTB4_mxidkuMKLYYJ8N=w@mail.gmail.com>
 <20120814153210.GA12221@rhi.hi.is>
 <CAKgNAkgOeRVmFTVMRgxzBYAwuuWEkPbR+6XoQ76ADZ7uhePkhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkgOeRVmFTVMRgxzBYAwuuWEkPbR+6XoQ76ADZ7uhePkhA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, Aug 14, 2012 at 09:16:26PM +0200, Michael Kerrisk (man-pages) w=
rote:
> Hello Bjarni,
>=20
> On Tue, Aug 14, 2012 at 5:32 PM, Bjarni Ingi Gislason
> <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org> wrote:
>=20

[text removed]

> > 2) The column for "Char" should show the graphic character (glyph)
> > for the code, and not repeap column 3 (with extra < >)
>=20
> I don't understand this comment. Could you say some more.
>=20
  An example is missing.  I see for example

>>  252    170     AA      <AA>    FEMININE ORDINAL INDICATOR

  but it should be (with tabs inserted)

>>  252	170	AA	=AA	FEMININE ORDINAL INDICATOR

  So there is a bug or false configuration

> > 3) There are no tabs in the table!  Have been changed to spaces!
>=20
> Ahh -- sorry, that was because I did a GUI cut+paste into my mail. Th=
e
> tabs still exist in the source file.
>=20

  Also here is a bug or false configuration.

####

  The history (what is actually in the mail (text), not necessary
what the mail programm shows):

=46rom me (Date: Thu, 10 May 2012 19:42:31 +0000)

 252	170	AA	=AA	FEMININE ORDINAL INDICATOR

=46rom you (Date: Fri, 8 Jun 2012 00:08:26 +1200)

> =3DA0252 =3DA0 =3DA0170 =3DA0 =3DA0 AA =3DA0 =3DA0 =3DA0=3DAA =3DA0 =3D=
A0 =3DA0 FEMININE ORDINAL =3D
INDICATOR

=46rom you (Date: Fri, 8 Jun 2012 00:09:36 +1200)

>> =3DA0252 =3DA0 =3DA0170 =3DA0 =3DA0 AA =3DA0 =3DA0 =3DA0=3DAA =3DA0 =
=3DA0 =3DA0 FEMININE ORDINAL=3D
 INDICATOR

=46rom you (Date: Tue, 14 Aug 2012 00:07:50 +0200)

 252    170     AA      <AA>    FEMININE ORDINAL INDICATOR

[removed text]

--=20
Bjarni I. Gislason
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
