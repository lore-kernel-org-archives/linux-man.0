From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: statfs.2: f_spare[4]  or f_spare[5]
Date: Sun, 15 Feb 2015 05:08:14 -0500
Message-ID: <20150215100814.GD32251@vapier>
References: <5453FE6F.3010501@redhat.com>
 <20141101035621.GH26840@vapier.wh0rd.info>
 <5454CB4C.6000805@redhat.com>
 <20141101153635.GB21263@vapier.wh0rd.info>
 <54D33A66.1080908@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3Pql8miugIZX0722"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54D33A66.1080908-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>, roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org
List-Id: linux-man@vger.kernel.org


--3Pql8miugIZX0722
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05 Feb 2015 10:39, Michael Kerrisk (man-pages) wrote:
> Rich Felker a while back also wrote about problems in the man page:
> http://thread.gmane.org/gmane.linux.man/6749
>=20
> [[
> The man page for statfs(2) is using macros which are glibc
> implementation internals (not part of the public interface) for
> defining struct statfs. This leads programmers to believe they should
> use these macros in applications (a cast to __SWORD_TYPE has recently
> appeared in util-linux; see link [1] below) and __SWORD_TYPE isn't
> even the correct type on glibc/x32.
>=20
> Note that glibc also has the signedness of these members wrong; in the
> kernel, they're rightfully unsigned for 32-bit and only signed on
> 64-bit (where it doesn't matter). musl does not have this mismatch; we
> use unsigned types where they make sense (e.g. storing unsigned
> filesystem magic numbers that don't fit in signed 32-bit).
>=20
> Since the types of these fields are such a mess, I think the man page
> should refrain from documenting specific types, and should include
> advice on safe usage, including how to safely compare f_type -- on
> glibc, the value will wrongly be negative for many filesystems, and
> although default integer promotions will fix this for direct
> comparison with the fs magic constants, the safe way to use f_type
> seems to be explicitly casting it to uint32_t.
> ]]
>=20
> So, this all seems a glibc mess to me. However,perhaps I'm not=20
> understanding something. What is the glibc expectation, regarding=20
> how people should work with these fields? I mean, suppose one wants
> to copy one of the __fsword_t to a local variable, what type is
> one supposed to do? What I'd kind of hope for is publicly export
> system data(s). But lacking that, what does one do? It appears
> that "unsigned int" should do the job. What about the following=20
> text for the man page:
>=20
>     The  __fsword_t  type  used  for  various  fields in the statfs
>     structure definition is a glibc internal type, not intended for
>     public use.  This leaves the programmer in a bit of a conundrum
>     when trying to copy or compare these fields to local  variables
>     in  a  program.  Using unsigned int for such variables suffices
>     on most systems.

looking at the history of the file in glibc (which stretches back to at lea=
st=20
1995), i think trying to deal with differences across arches/ABIs/OSs/LFS=
=20
settings has lead it to be macro heavy in favor of the maintainers rather t=
han=20
directly considering the usage by developers.  especially since the functio=
n=20
isn't documented in the glibc manual ... it's being provided more as a low=
=20
level/historical requirement rather than a desire to get it right.

maybe Roland can comment since he's the author of some of these commits :).
-mike

--3Pql8miugIZX0722
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJU4HAOAAoJEEFjO5/oN/WBKJMQANC+QKu3AXA8H+E+ljmD5shi
YdCaRbMDPjyBmI//vk2lZ29CaIKPvtOfs1SrSPhLOw+wAJ7fsQzWXmdVK8cfMO0Z
YFybbXwLC/pKnvpoQHUksSslWSajjCzBN9n4Shwg8Kk5TK50oUO1aTAvmfzb6Se7
HMVTyHLTytdvPxNALzat/JET/y7a3vFVkoOkiEScolfyKSy+3msMw38koTYmLZ+z
jvHAR4wq8miWJsqsCPygUadi+ViRTdUn6b6BlOX3WmrU2y2MVfBYnYujd3w336jq
N+p/sH7b2D+0Jv45gI3f6daRVww7g+OLAwH/pXR7mE+l6IwlElUDlu9JYboTmBNx
0mWeCTuxQK0LbZD7dJJrFKP7u87ypqYh2zCF0Pp7eLEto6SK/w+xzAODsaFmuGYv
xC+Bu6g9U+gMM+eIy+TvbjIImFTGRTbuWtqQJ0+WL8V1CbhNLAo56RPAynmwRNx6
4+HWsUaFToCSBmAxfIR6Fqnl008ySbnZV1a4F2Az9z+TsdV+41nmJ6nJ6ZqLDw7e
86AmapjBiRdVXrP75eKhtSsrhJTfNTUZiXlKGn0SSVDtxGtfVZMx0h4ByfNamaZW
0Io3zSrpkQrHtKVkhEL717npJXZjduZO/wcpuW2+3gSUSKS4nBIPms2M8cI8gHLQ
Si6b0rBqPAZkEUS22ljK
=J0UE
-----END PGP SIGNATURE-----

--3Pql8miugIZX0722--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
