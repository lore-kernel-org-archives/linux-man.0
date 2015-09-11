From: Eric B Munson <emunson-JqFfY2XvxFXQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] mlock.2: mlock2.2: Add entry to for new mlock2 syscall
Date: Fri, 11 Sep 2015 10:57:12 -0400
Message-ID: <20150911145712.GA3452@akamai.com>
References: <1441030820-2960-1-git-send-email-emunson@akamai.com>
 <55F14E05.6020304@suse.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55F14E05.6020304-AlSwsSmVLrQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vlastimil Babka <vbabka-AlSwsSmVLrQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Michal Hocko <mhocko-AlSwsSmVLrQ@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Sep 2015, Vlastimil Babka wrote:

> On 08/31/2015 04:20 PM, Eric B Munson wrote:
> > Update the mlock.2 man page with information on mlock2() and the new
> > mlockall() flag MCL_ONFAULT.
> >=20
> > Signed-off-by: Eric B Munson <emunson-JqFfY2XvxFXQT0dZR+AlfA@public.gmane.org>
> > Acked-by: Michal Hocko <mhocko-IBi9RG/b67k@public.gmane.org>
>=20
> Looks like I acked v1 too late and not v2, so:
>=20
> Acked-by: Vlastimil Babka <vbabka-AlSwsSmVLrQ@public.gmane.org>
>=20
> However, looks like it won't be in Linux 4.3 so that part is outdated.
> Also, what about glibc wrapper for mlock2()? Does it have to come before =
or
> after the manpage and who gets it in?

V3 now has an updated version, hopefully mlock2 hits the 4.4 merge
window.

I don't know about the glibc wrapper, are we expected to write one
ourselves?  Will they even take it?  They haven't been the most open
minded about taking wrappers for system calls that are unique to Linux
in the past.


--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV8uvIAAoJELbVsDOpoOa9RjcQAIODa85rnz8GGMBo8OUdyWnZ
Bv70lnehp42Sc2Jkvu66gsa5Zi252m42XI8/1DJ1MPiXHCoRJbhhlONL6P3nezbG
aAgG3ejDG/BIpyWK4sqIvbX09vqJgszX/l7MOCGxtBxQq9j/xBbTxwCN29w8bIel
lfCQIBoynwkwXfUi9HqCrQ/A/76Ca9gsL2hqzA1aqwF98ohWd4+P/RmM9E2X1WLL
leMxahn33BtX2uoNp6hYpEDBoaAS1vkSmVPD+BXNuXhStNn29XRDZzVDyZ72SmvY
3o3i9j/vMuNtt0sZKhhVklnNDaVIEc1y2bytzpUN924ofPZaRCTfObz+CEmeVeUv
jBoNUrw9IiraEGAq8XZetAOTktUyESBfVOwR8WR4qQ7NS3p/QtMsSdsUy21XQQvU
RBCdkc0NoX5+7MugZpz9xQBbXrTwjhVhIVaPssluf6CK/bBvgwjRvds+Wrrsxd6b
tyimo2T6G4fE0nhQaGzm+gsN26+B8T9c6BN4OKr0zmxy/LS9tm36k5N5mIsWqdMO
WnvJsfu2zm85cpMY5wo5MIBZIGCNE5qOeK1FV2iWE3THUHW2Zqm5moaEfDYS6gIy
AuQ8zXGScE7/gmg6RHlvRQqrD/mgfQIOLkTEpWGwXS9/6ePQsKHi8XS9wZwJyRfX
mYcAlGRxq1ovIIzXpZnQ
=mgxZ
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
