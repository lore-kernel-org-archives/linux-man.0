From: =?utf-8?B?U3TDqXBoYW5l?= Aulery <saulery-GANU6spQydw@public.gmane.org>
Subject: Re: undocumented man pages
Date: Sun, 8 Mar 2015 12:12:40 +0100
Message-ID: <20150308111240.GA1839@free.fr>
References: <20150307145716.GA24297@free.fr>
 <54FC0369.3010705@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54FC0369.3010705-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Michael,

Le dimanche 08 mars 2015 =C3=A0 09:08:09, Michael Kerrisk (man-pages) a=
 =C3=A9crit :
>=20
> On 03/07/2015 03:57 PM, St=C3=A9phane Aulery wrote:
> >=20
> > What do you think about to add a "undocumented" page for each secti=
on (as
> > undocumented.3) and create each missing pages with a reference to t=
he
> > appropriate "undocumented" page. Thus we can also encourage users t=
o become
> > contributors and avoid unnecessary reports.
>=20
> My problem with this idea is that my simple test when wondering if
> a man page exists for an API is to look in the appropriate man?/=20
> directory for a file with the right name. With the scheme above, I th=
en
> need to look inside the file to see if it is a link to undocumented.x=
=2E
> That would be a small inconvenience.

How is obtained the list of missing pages? Another solution would be to
provide a script that generates the missing pages with the redirection.

> Yes, the reports about missing pages are a minor irritation, but I'm
> a little doubtful that such an "undocumented" page would encourage mu=
ch
> contribution. (I could be wrong, that's just my guess.)

I too could be wrong. I'm probably too optimistic. I feel that if the
user sees clearly that the page is not yet written and needs of its
contribution, it is better information for him and a better chance for
us.

PS: Thank you for patches, you are very responsive !

Cheers,

--=20
St=C3=A9phane Aulery
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
