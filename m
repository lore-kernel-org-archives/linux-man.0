From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] crypt(3): use real dashes in regex
Date: Thu, 17 Apr 2014 15:55:20 -0400
Message-ID: <3245891.ebzCqChYRm@vapier>
References: <1397756918-16350-1-git-send-email-vapier@gentoo.org> <CAKgNAkh4yU=nnEVoWA0g36bQovg6csR-ik54Z0FT3Q53Hrn8-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6386115.OoR05UdEG6"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkh4yU=nnEVoWA0g36bQovg6csR-ik54Z0FT3Q53Hrn8-g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--nextPart6386115.OoR05UdEG6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Thu 17 Apr 2014 21:22:31 Michael Kerrisk wrote:
> On Thu, Apr 17, 2014 at 7:48 PM, Mike Frysinger wrote:
> > I don't think rendering the dashes in the regex expression as the e=
n
> > style makes sense.  This is a literal regex, so use literal dashes.=

>=20
> I agree, but it looks like your patch is inconsistent. But you use
> '\-' in one part of the patch (right), and just '-' in the other part=
.
> How come?

i wrote the two hunks on different days.  iiuc, they should all be \-.
=2Dmike
--nextPart6386115.OoR05UdEG6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAABAgAGBQJTUDGoAAoJEEFjO5/oN/WBslUQAICrYHf8O+TlDWc2M7o+eySR
scfAQRMSF2OYwvzep1IXTJwNw0kSy+BKjD6Yxp3yuc2l7+fv5fW16y4/ZXLiiQ4y
GE4x//dAciK7Kz/TZB/SpdHiHTqNngY43mWl1wWYPPQQpnoCg2Ro9bYvlCoC3qbH
fsvnR6Wsr+xP57iC3kBSh7Az+y861mewmQ6ymTMEqgXr33JFmivlj0/eRN03bVrV
3h+/IFhJS0Zk9ORfg8mhwXgC4cuJUbUPP/M3J3QcBvSi6k5H6zA4LIB2hG+SCSK1
wF/xLeTWEoSd2MOKUvguJVhDTZMVS2UvUS8ENKXmqEPDNeW0Q67pUrUGkiVGRnF9
Ixy2ddcQO3/w2wgMBXd+jQKeFHvFvtZDsNl6GmZRXy2aT3fjzssVssvJRbuWpZH/
b7Cf3Bd2sGN16GL7jV5lCTuWOvoMt4sp4BF1Nd/8XlAeQYBogl8JZM1PlFb29Qdl
fK81TDypKHHVx+9YIGIxeZoDXrm0OhHThQsmkrZNl/ID2jqLNWusPtjK5vunPkDG
Rdq1qVWnfwE/fmHqcgreL6nNwY6qtnIVsPhSsVg5F2V7uFXJGV0XcqFk4zmzgsWi
hI5wflqCj31NpsXBNecpE/dQVRq/aX/o8pFeGpEYnI/IIHCSKU2cgyPNI1ip4yWY
DOp9DV5mcqtVyFL4M+oF
=FExr
-----END PGP SIGNATURE-----

--nextPart6386115.OoR05UdEG6--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
