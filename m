From: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Subject: Re: [patch], mdoc(7): Fixing a warning and a table
Date: Thu, 7 Jun 2012 20:31:22 +0000
Message-ID: <20120607203122.GA2595@rhi.hi.is>
References: <20120511195430.GA28822@rhi.hi.is>
 <CAKgNAkjiK4=cDo712__HrS5M4U8AFiyXFYc1vk2c5e7vc=YNmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkjiK4=cDo712__HrS5M4U8AFiyXFYc1vk2c5e7vc=YNmA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Jun 07, 2012 at 11:58:15PM +1200, Michael Kerrisk (man-pages) w=
rote:
> Bjarni,
>=20
> On Sat, May 12, 2012 at 7:54 AM, Bjarni Ingi Gislason
> <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org> wrote:
> > Package: man-pages
> > Version: 3.40
> > Severity: minor
> > Tags: patch
> >
> > =A0From "groff -ww ..." (or "man --warnings=3Dw ..."):
> >
> > <groff: mdoc.7>:294: warning: tab character in unquoted macro argum=
ent
> >
> > =A0In one table the distance between columns is too small in the
> > "ps" output. =A0(Bug in the groff "doc.tmac" macro?)
>=20
> Thanks. Applied for 3.42.
>=20

  My patch from that day is a crude one, as I did not know enough.=20
The third one (from 14th May) is the correct (best) one.

=2EBl -column ".Fl bullet" -compact
  etc.

--=20
Bjarni I. Gislason
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
