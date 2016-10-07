From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] proc(5): clarify the root symlink and mount namespaces
Date: Fri, 7 Oct 2016 12:21:00 -0700
Message-ID: <20161007192100.GY21655@vapier.lan>
References: <20161006013609.17481-1-vapier@gentoo.org>
 <20161006172322.3253-1-vapier@gentoo.org>
 <03f48447-e197-fb88-c7fd-ec8c01c38cf7@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ON0CT8LY+wgE1XqS"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <03f48447-e197-fb88-c7fd-ec8c01c38cf7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--ON0CT8LY+wgE1XqS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07 Oct 2016 14:33, Michael Kerrisk (man-pages) wrote:
> On 10/06/2016 07:23 PM, Mike Frysinger wrote:
> > If the target process is in a different mount namespace, the root symli=
nk
> > actually shows that view of the filesystem.  As an example:
> >  /* Terminal 1 */
> >  $ unshare -Urnm
> >  # mount -t tmpfs tmpfs /etc
> >  # mount --bind /bin /dev
> >  # echo $$
> >  17168
> >=20
> >  /* Terminal 2 */
> >  # ls /etc                          # Normal view of /etc files.
> >  # ls /proc/17168/root/etc          # Empty view of the tmpfs.
> >  # ls /dev                          # Normal view of /dev files.
> >  # ls /proc/17168/root/dev          # Contents of /bin files.
>=20
> Thanks for the patch! And thanks for the commit message, which is I think
> actually useful text for the man page itself, so I added it (in somewhat
> modified form) to the page itself.

looks like some formatting is off ?
-mike

--- a/man5/proc.5
+++ b/man5/proc.5
@@ -1525,7 +1525,7 @@ and in that shell we create some new mount points:
 $ \fBPS1=3D'sh1# ' unshare \-Urnm\fP
 sh1# \fBmount \-t tmpfs tmpfs /etc\fP  # Mount empty tmpfs at /etc
 sh1# \fBmount \-\-bind /usr /dev\fP     # Mount /usr at /dev
-sh1# \fBecho $$
+sh1# \fBecho $$\fP
 27123
 .in
 .fi
@@ -1533,10 +1533,10 @@ sh1# \fBecho $$
 In a second terminal window, in the initial mount namespace,
 we look at the contents of the corresponding mounts in
 the initial and new namespaces:
-   =20
+
 .nf
 .in +4n
-$ \fBPS1=3D'sh2# ' sudo sh
+$ \fBPS1=3D'sh2# ' sudo sh\fP
 sh2# \fBls /etc | wc \-l\fP                  # In initial NS
 309
 sh2# \fBls /proc/27123/root/etc | wc \-l\fP  # /etc in other NS

--ON0CT8LY+wgE1XqS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX9/WcAAoJEEFjO5/oN/WBQOEQAL1F+aq6upG/2nADFwwnBImO
U55oZd01NhiU5maHnDyV8M+ewqgmTZnGaBY65Cos6qxDADZ7RqMZzenIqvoNTJik
GQ46oDulMu5qfGkkkwP6micOjHqGVcu3FyC4QLgRPooDubmbdTsnS2D3hKIF8lKF
BKkX9BK/J+bqmLKYAVKjifzmJpfefRpqmNnFSTM2MhWCJwhW+VxrKyJJKcfkaL2E
qbMpmjh0DA5hmIZXDeawgdsAK8bPKqgUy9DLQaugsujVKviZq39bdsxEMMgYzfvg
CgewT8BTAWE2PsqpHaoSkW7H+Wgp5U6UJ4ZV+zlHpXDj3HgnnMJ0BsMKr9dIwJ6y
oq/PglK8JvRyRIAlZ3sRO9ZYD3z8E29dE3a88XDhZqB2J95JzrUwPeijvQqAO2R4
Oabccc1fDsbBD6sHVrKp9lBbf7ohU3PAbjUmgQLxihkKbjmHnMjldTPpLIDXqoaw
FllnY9NqUaBbs1o3J0Gcs0Ur5v7NEVIhfhREkyS2nID2TC1UObQoBZJCyBLkPXH/
4VRe5XBInJQMyV3sOrItVQWBokupAEIZSfe2zFhZut3Cnk7epBDZvgQZHkqA/o37
FJ122qHdtu9qdXoa6UpGfW0/rXtsZxEQdHY5DKSIJZuLW/NrVNN8+0N/HheuVUS7
HHe8JScJAajK68yRz3s1
=RXrG
-----END PGP SIGNATURE-----

--ON0CT8LY+wgE1XqS--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
