From: Daniel Colascione <dancol-CpwT7fMy01Ydnm+yROfE0A@public.gmane.org>
Subject: Re: [patch] document that O_TMPFILE works with shm_open
Date: Tue, 27 Oct 2015 15:25:24 -0700
Message-ID: <562FF9D4.6070203@dancol.org>
References: <562B2CD9.80901@dancol.org> <87ziz4c665.fsf@mid.deneb.enyo.de>
 <562FF70C.5030600@dancol.org> <87vb9sc5tx.fsf@mid.deneb.enyo.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Mr1kgXGtxXQ5EA7TtocNNule20vK0B7me"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87vb9sc5tx.fsf-ZqZwdwZz9NfTBotR3TxKnbNAH6kLmebB@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Weimer <fw-d32yF4oPJVt0XxTmqZlbVQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Mr1kgXGtxXQ5EA7TtocNNule20vK0B7me
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 10/27/2015 03:19 PM, Florian Weimer wrote:
> * Daniel Colascione:
>=20
>> On 10/27/2015 03:12 PM, Florian Weimer wrote:
>>> * Daniel Colascione:
>>>
>>>> This test program works fine. (Watch it work in strace.) This patch =
is
>>>> against git master. It's okay to document accidental features, right=
?
>>>>
>>>> int
>>>> main()
>>>> {
>>>>     int shmfd =3D shm_open(".", O_TMPFILE | O_RDWR | O_EXCL, 0600);
>>>>     ftruncate(shmfd, 1000);
>>>>     mmap(NULL, 1000, PROT_READ | PROT_WRITE, MAP_SHARED, shmfd, 0);
>>>>
>>>>     return 0;
>>>> }
>>>
>>> This looks more like a bug to me.  I wouldn't count on it continuing
>>> to work.  glibc already tightened the rules for the name once.
>>
>> I don't think they can break compatibility like that, and besides: it'=
s
>> a useful feature, not a bug.
>=20
> Names not starting with '/' do not have well-defined behavior with
> shm_open.  Applications shouldn't rely on that.

We document non-portable extensions all the time. Why not this one? In
any case, the glibc info page documents that its implementation of
shm_open accepts whatever open(2) does, and the Linux man page for
open(2) indicates that O_TMPFILE works with the shmem filesystem.

>> Is it better for people to blindly open files in /dev/shm? Because
>> that's what they do today.
>=20
> memfd_create is the official interface for this purpose.  But neither
> O_TMPFILE or memfd_create is very widely supported.

O_TMPFILE appeared in 3.11; memfd_create appeared in 3.17.


--Mr1kgXGtxXQ5EA7TtocNNule20vK0B7me
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJWL/nUAAoJEN4WImmbpWBl5nYQAIt6xsOtK6JRPyx0fmr5A4eh
CfxqB30eeNVOWHL9Hx2Fxojamu15FF9oXuVSR16rXjXbhJLvh8WGw6fTJi5kpOOD
8c7M6cTeshs86BZ/C8VlmKRpcXYruIQ7CCJWTFdjeSZmTICH0tupS30n3UpoQcRP
wFVu5ZDSyHfM5lUpTjy18qfqjmP7LCYpcPsMhLvKjzQuC9xzvh/BA/r/O/kD889v
DxGC9pmUDblAKiVpWCXnD2k24Pf6NZfrp5gOAmuikcJSVLMGn6CaUz5fB2fiiSdX
9mq6pu+vMiObITO3s9BVi5ywHS/4AQL2gtKuZcE6zrYdhsqdiTFpdQmbNql80+tc
bPZvsglOoE4AqQFiWBQKJkuqgM9UydDS2Jnn2KoGhm/csByKbbnqAZwSxELdn0Vj
tpe1URytwd110yo8nmJedfa9TwDHNynDmy7UdNLcCYnis2hwpGiMr31fGba1+WHx
zGoSCki7FnzQEa/rIilavgxKRZtKYgv/YvsHHpPAuQcoEtV/v0+juLXuRez0Aid4
MARzF0+ezJ3S1pidUIhZMbTLFRMeAHQ3C10SXq7v27APcr2ttoU/4+giTtVY4Iqf
9dnGfNEuwJq0j2q6rPHDBRZqfohV893RZsxTzq/HLZmA+D3es2xiYEQnSfPS8ZFs
obm9PrKSvWU+kCHcr0d3
=rx5h
-----END PGP SIGNATURE-----

--Mr1kgXGtxXQ5EA7TtocNNule20vK0B7me--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
