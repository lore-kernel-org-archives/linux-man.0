From: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Subject: Re: [patch], ptrace(2): Unnecessary escape before ">"
Date: Sun, 6 May 2012 21:39:50 +0000
Message-ID: <20120506213950.GA2078@rhi.hi.is>
References: <20120506200217.GA1004@rhi.hi.is>
 <CAKgNAki_0bW43ffUsYLtRG06_h_iaGbBg-tzxjczPnqS660sdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAki_0bW43ffUsYLtRG06_h_iaGbBg-tzxjczPnqS660sdg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, May 07, 2012 at 08:51:41AM +1200, Michael Kerrisk (man-pages) w=
rote:
> Bjarni,
>=20
> On Mon, May 7, 2012 at 8:02 AM, Bjarni Ingi Gislason <bjarniig-5zMUtr2BsJg@public.gmane.org=
=2Eis> wrote:
> > Package: man-pages
> > Version: 3.40
> > Severity: minor
> > Tags: patch
> >
> > =A0From "groff -ww ..." (or "man --warnings=3Dw ...":
> >
> > <standard input>:758: warning: escape character ignored before `>'
> >
> > =A0Also periods (full stop) in ellipises "protected" with "\&".
>=20
> My knowledge here is a bit thin. Can you expand on the previous sente=
nce please.
>=20

  This "protection" is actually only necessary, if the
(unprotected) ellipsis is at the start (becomes a groff macro
command) or (almost) at end of a line (last period interpreted as
an end of a sentence).  That can happen, if the paragraph (line)
gets later reformatted or changed in the source.

--=20
Bjarni I. Gislason
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
