From: =?utf-8?B?U3TDqXBoYW5l?= Aulery <saulery-GANU6spQydw@public.gmane.org>
Subject: Re: undocumented man pages
Date: Mon, 9 Mar 2015 09:10:49 +0100
Message-ID: <20150309081049.GB1341@free.fr>
References: <20150307145716.GA24297@free.fr>
 <54FC0369.3010705@gmail.com>
 <20150308111240.GA1839@free.fr>
 <CAKgNAkhvGtPMwq1kdf-ZJZ=FNGQqLjHuyakgbaUqLbdhAueL-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkhvGtPMwq1kdf-ZJZ=FNGQqLjHuyakgbaUqLbdhAueL-A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Le lundi 09 mars 2015 =C3=A0 08:06:30, Michael Kerrisk (man-pages) a =C3=
=A9crit :
> On 8 March 2015 at 12:12, St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org> wrot=
e:
> >
> > Le dimanche 08 mars 2015 =C3=A0 09:08:09, Michael Kerrisk (man-page=
s) a =C3=A9crit :
> >>
> >> On 03/07/2015 03:57 PM, St=C3=A9phane Aulery wrote:
> >> >
> >> > What do you think about to add a "undocumented" page for each se=
ction (as
> >> > undocumented.3) and create each missing pages with a reference t=
o the
> >> > appropriate "undocumented" page. Thus we can also encourage user=
s to become
> >> > contributors and avoid unnecessary reports.
> >>
> >> My problem with this idea is that my simple test when wondering if
> >> a man page exists for an API is to look in the appropriate man?/
> >> directory for a file with the right name. With the scheme above, I=
 then
> >> need to look inside the file to see if it is a link to undocumente=
d.x.
> >> That would be a small inconvenience.
> >
> > How is obtained the list of missing pages? Another solution would b=
e to
> > provide a script that generates the missing pages with the redirect=
ion.
>=20
> I worked from scripts shown at
> https://www.kernel.org/doc/man-pages/missing_pages.html
> but manual work on top of that was also needed.
>=20
> >> Yes, the reports about missing pages are a minor irritation, but I=
'm
> >> a little doubtful that such an "undocumented" page would encourage=
 much
> >> contribution. (I could be wrong, that's just my guess.)
> >
> > I too could be wrong. I'm probably too optimistic. I feel that if t=
he
> > user sees clearly that the page is not yet written and needs of its
> > contribution, it is better information for him and a better chance =
for
> > us.
>=20
> Maybe. So, here's another idea. Since I don't really want to pollute
> the Git repo with a lot of useless links, another possibility would b=
e
> a release-time script that generates the "undocumented" pages from
> plain test file lists (e.g., one function name per line). Those lists
> could live in the Git repo, and then be used to autogenerate a page
> such as undocumented(3) (which does *not* list  a lot of the
> undocumented functions, and has no links). Thoughts?

I was thinking about that too. If I can help for anything, I will.

>=20
> > PS: Thank you for patches, you are very responsive !
>=20
> Not always, unfortunately. Things get dropped too often. You should
> ping when I don't respond to patches in a week or two.

Okay. Next days/weeks, I will need your advices about a bunch of bug re=
ports.
I will not send all to you in one shot !

Cheers,

--=20
St=C3=A9phane Aulery
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
