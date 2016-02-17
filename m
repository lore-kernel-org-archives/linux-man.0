From: =?UTF-8?Q?St=C3=A9phane?= Aulery <saulery@legtux.org>
Subject: Bug#794947: manpages-dev: printf(3) example: possible integer overflow
Date: Wed, 17 Feb 2016 13:40:07 +0100
Message-ID: <e62670273dd84e658fe32cda6e16e94b@legtux.org>
Reply-To: saulery@legtux.org, 794947@bugs.debian.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <bounce-debian-bugs-dist=glddb-debian-bugs-dist=m.gmane.org@lists.debian.org>
Resent-To: debian-bugs-dist@lists.debian.org
Resent-Message-ID: <handler.794947.B794947.14557127674927@bugs.debian.org>
List-URL: <https://lists.debian.org/debian-bugs-dist/>
List-Post: <mailto:debian-bugs-dist@lists.debian.org>
List-Help: <mailto:debian-bugs-dist-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-bugs-dist-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-bugs-dist-request@lists.debian.org?subject=unsubscribe>
To: 794947@bugs.debian.org, control@bugs.debian.org, linux-man@vger.kernel.org, wharms@bfs.de
List-Id: linux-man@vger.kernel.org

retitle 794947 printf(3): possible integer overflow in make_message=20
example
severity 794947 wishlist
tags 794947 + confirmed
tags 794947 + upstream
forwarded 794947 linux-man@vger.kernel.org
stop

-----

Hello Walter,

Jakub Wilk reported a possible integer overflow in make_message example=20
:

> The example in the printf(3) manpages looks like this (with boring=20
> parts
> omitted):
>=20
> int n;
> /* ... */
>   n =3D vsnprintf(p, size, fmt, ap);
>    /* ... */
>    if (n < 0) {
>        /* ... */
>        return NULL;
>    }
>    /* ... */
>    size =3D n + 1;
>=20
>=20
> But vsnprintf could return INT_MAX, which would then cause "n + 1" to
> overflow.
>=20
> (AFAICS, the glibc vsnprintf implementation never returns INT_MAX, but
> it could in principle.)
>=20
> I'd suggest changing "n < 0" to "n < 0 || n =3D=3D INT_MAX".


Since this example has been modified by you (Walter Harms), after the=20
bug #794947 [1] has been reported, I wanted to ask your opinion on the=20
best option.

Should we add this test to good practice, or rather a comment to mention=20
that the case is not taken into account because the example uses glibc?

Regards,

[1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D794947

--=20
St=C3=A9phane Aulery
