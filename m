From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: statfs.2: f_spare[4]  or f_spare[5]
Date: Sat, 1 Nov 2014 11:36:35 -0400
Message-ID: <20141101153635.GB21263@vapier.wh0rd.info>
References: <5453FE6F.3010501@redhat.com>
 <20141101035621.GH26840@vapier.wh0rd.info>
 <5454CB4C.6000805@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kORqDWCi7qDJ0mEj"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5454CB4C.6000805-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--kORqDWCi7qDJ0mEj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01 Nov 2014 13:00, Jan Chaloupka wrote:
> On 11/01/2014 04:56 AM, Mike Frysinger wrote:
> > On 31 Oct 2014 22:26, Jan Chaloupka wrote:
> >> there is probably a wrong number in description of statfs structure. In
> >> description section, struct statfs contains as a last field f_spare[5].
> >> But the /usr/include/bits/statfs.h itself contains f_spare[4]
> >> (glibc-headers-2.18 on f20).
> >>
> >> Looking into glibc-2.20, there is f_spare[6]. Looks like the structure
> >> is gradually evolving :).
> >>
> >> Inspecting upstream history (gitk statfs.h), it shows it was f_spare[6]
> >> since 1997.
> > i wonder if we should strip f_spare from the man page.  it's not really=
 useful.
>=20
> I would prefer to keep f_spare.

why ?  it serves no useful purpose, and people should be including the head=
er to=20
get the definition.  the man page is there to describe the fields that actu=
ally=20
get used.

> As Siddhesh wrote, statfs.h is architecture/OS dependent in general. In=
=20
> a case of fedora (f20, f22) armv7hl, x86_64 and i686 has f_spare[4].
>=20
> We could add a sentence right under struct statfs:
> "Depending on your architecture or OS, length of f_spare of statfs=20
> struct can vary."

this man page is Linux specific

> > the __SWORD_TYPE should probably be replaced with __fsword_t, and drop =
the
> > __WORDSIZE logic.  that gets ugly with syscall ABIs.
>=20
>   I am not sure if __SWORD_TYPE is no longer valid type and is replace=20
> by __fsword_t everywhere (all architectures and OS).

the latest headers use __fsword_t
-mike

--kORqDWCi7qDJ0mEj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUVP4DAAoJEEFjO5/oN/WBWbEQAJ5eDWNz8iiP4b0baOdn9uHV
AyqyMFOwqx2SaTIeY7BotmywSVuo7JRnAHAellGQSNl0NvjuL1EO/MciEYgKW9zk
quFJQZvcRUKgF5+H0cUAKkFyxWLZ5i+2DluCus8oI4taKDsquCXDuTqm/eDSNXdY
31D9wdpSf8d8nabmE58znbO07HmXTFCVBJoOpz6YIx3b19rX5x4+Rx5RlRsjmmov
N04UYPRSQafpu6aJ2lk/7aTZC+N8PKrXeK2zutaERSSj7QTCJFoOmRVHLxxufccp
6XWQ3qKGZ0GEcOKtUebnrnim2MmMkWuaQf4kg6nRBTfJyTezmSZFvcG1++VgtSBk
Bn756DAmjP3Tj6CSKElkBLxq7V57+iOAWIpIQ+tDCRxN6BBgmiOjqKVY1Mj9ugXS
zF6LRCEQUgRfWJVS5oCVE+Fi8BTe7g5IodkJgDoDQGw50gzR1/xrOXGcsODuSi7H
seLhxA65XhVyfNAblhgseSxoSqYmuxze9X0JNglksLPjdrYkxn0cjPlxFuEW2i2x
RuWr9sVcsoZu0QT+iSP+9vfTdOLHdq+mnqki8AFV8NovNVGuBQoTjXcR4uI24bfx
buCIu+8Cqx5ta9cVZflaNNhDdfTomiD767fhwwXOSTcgFwMD4kQy+nDzhtDVplGz
wUQ+U+aQvaGwwE1xCZuA
=1dYy
-----END PGP SIGNATURE-----

--kORqDWCi7qDJ0mEj--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
