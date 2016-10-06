From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] proc(5): clarify the root symlink and mount namespaces
Date: Thu, 6 Oct 2016 10:23:58 -0700
Message-ID: <20161006172358.GW21655@vapier.lan>
References: <20161006013609.17481-1-vapier@gentoo.org>
 <f464f3c8-7c76-7288-d3dd-a7d7ffc05a75@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="L9fXoLhVbEF7eqMD"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <f464f3c8-7c76-7288-d3dd-a7d7ffc05a75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--L9fXoLhVbEF7eqMD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06 Oct 2016 07:51, Michael Kerrisk (man-pages) wrote:
> On 10/06/2016 03:36 AM, Mike Frysinger wrote:
> > If the target process is in a different mount namespace, the root symli=
nk
> > actually shows that view of the filesystem.  As an example:
> > /* Terminal 1 */
> > $ unshare -Urnm
> > 17168
> >=20
> > /* Terminal 2 */
>=20
> Your example appears to have been truncated. It'd be nice to have the
> complete example for the commit message. Could you send that?=20

blah, i sometimes forget that git eats lines that start with a #,
so trying to use that as your root prompt messes things up.
-mike

--L9fXoLhVbEF7eqMD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX9oiqAAoJEEFjO5/oN/WBfLgP/2PiuWbIio6x1mwOsCM1B8cj
/hNKEFPrP2QFr4+3SyJoLOy/H9lSkkufaAj/bsShuqunsg1yL60yJbUKCzA967ot
zqNb0QgCbaBDiEl7d4KgOr3p7KnXZEUTLVBpTmcsIfCq9UsiV9UuShV6sFYojwPQ
ba9o1mq5X6M3y7Ks+Txxs3Y2fS/BrO9iD9SvRd5xSsfmmTsr3075L+lhzJKt9wI/
Jpz2W+Q8fivJFOUhsWsVU3TgUiJ2KnyfNEZCSTr6Wh499Ewt/OlwIMQ92TEfl96x
rR8YYN2l+E0kIeYITQlvDzhh6GKtDtVVimBr/MLBZdfAy9HVeCBiyrBdiAZOjqka
bRh5t8N7j38oIB+R6U5OiDfWjPKRjKqGJkHJBqLKebxEYgLw8bc2hGACSTwVUCeO
YR6Rp3vydstbktHybgEIohq+GxEF+k6Xj8JiY/4+4skNduswrhseM5QYr5/wnwOQ
SlcnYc7eZZ2c36T+bZP+2Rwx8Ma5bwSrx/L4VrzbRgFvYQqfLMF7NuATOfmFmyQf
GAPyLRzPYC59GDg88WPUMzvMCgEVii0uAS9a6SliVPjib4r/dC3IehcR43RIgDs7
oVTmaObFAAGpNA+2+VHw4rtCojjPeIU84fUAlrU8PACmde4blZXZLZ1VLHznuDJL
NqEVdUMzFcZVlJ7L5o3K
=o3Jr
-----END PGP SIGNATURE-----

--L9fXoLhVbEF7eqMD--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
