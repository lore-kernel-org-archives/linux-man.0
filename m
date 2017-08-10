From: NeilBrown <neilb@suse.com>
Subject: Re: [PATCH man-pages] open.2: improve O_PATH documentation.
Date: Fri, 11 Aug 2017 09:04:42 +1000
Message-ID: <87mv77qb1x.fsf@notabene.neil.brown.name>
References: <873790rtni.fsf@notabene.neil.brown.name> <20170810102104.GA16888@gardel-login> <1502373778.9644.27.camel@sysmikro.com.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <1502373778.9644.27.camel@sysmikro.com.pl>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Krzysztof =?utf-8?Q?B=C5=82aszkowski?= <kb@sysmikro.com.pl>, Lennart Poettering <lennart@poettering.net>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, linux-man@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10 2017, Krzysztof B=C5=82aszkowski wrote:

> Mr Poettering,
>
>
> I don't know exactly what is the whole discussion about but Mr
> consider (very seriously) this regarding C language, C coding,
> compilers and program execution:
>
> claim #1: "=3D=3D" is compare operator another words result is considered
> to be true if both arguments are same binary
>
> claim #2: it is possible to compare different types to each other, e.g.
> int to char, long long to short
>
> claim #3: if both arguments are of different sizes then compiler
> extends shorter type to the size of larger argument padding with 0s.
>
> claim #4: compiler uses type of variable for immediate constant when
> comparing the variable to it. thus even bitfields comparisons work.
>
> claim #5: the compiler is modern gcc
>
> thus your whole thesis is damn crap especially your claim like "Linux
> is broken". you could write glibc is broken because it does not
> "expose" (which is not strictly true) the fsword_t=C2=A0
>
> Do you know what the term "Linux" stands for ?
> I can give you explanation but there are so many other noble developers
> which can do this better and it is disappointing that they haven't done
> this yet.
>
>
> I could ignore your email like others did but once upon I gave you a
> proof that because systemd-logging can't do better recovery than
> underlying file system then doing so by systemd-logging is utterly
> stupid, so if you, Mr Poettering, stop doing more userspace crap then
> whole "Linux" will only benefit from this.
>
>
> And the Red Hat should fire you out.
> I reckon that fools are the worst plague in the World and that's why I
> stopped tolerating fools.
> I am a racist - I hate fools.

Please keep the discussion civil.  This sort of language is not welcome.

NeilBrown

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAlmM5osACgkQOeye3VZi
gblAsw//a8r62Qyegv0hOpUJb2m6BgDmjFUDJ0oVFJd8y8HgpFFG1uHnz8+a/bAU
ZZa2GJAMCbq6MRSaEBYi8fmelcIp+uh60JuLJhwvILZUKLOwDKwVMI678xn2LPqN
YQ8/6hnjp59UM2IpDjILIEfAqCBG9Qgr695t+Xgv2wZ9l7238vcFkprIaKfKIJg0
JZn5zSLdjwbqEyL/PWtP/myU5i8/yAd9Rld1ER1yIS6Ya5Ps/4uelxk2ZGfKRhnK
gCdE7Av5FM0/dpIqXJ78Ryfu9x6rK7JtUcqcAPQqFrQtSwPONk1X96Zqq63Y8xEv
Zfd0gkeTHDyyOWE7bLgi/6PZyOewLPOHMIIyKRCM+HcDDGjH7ohV7YAVM0lDnMWj
tbeod50sDReazr7X86pF85Qq/THthjNvMoOnQIZ7g6tjJ+DkWZLRdKb+S9ZsWFeG
uZNuUv+X7Q4BkygVt08f1WEzUTki40ZnX3oJq4H936SJ7lhn+zvM1laz+gjehWF9
Cdh/UCwuoHoR62anBFRaKjYNUUrxhOabWAZYq2Xxor6Sv40sL5FCepi8dawqYXZM
oWCX8mYg0ezgCR7izFBFH/BO5FrMAocDx4Eu2+2biyHMCN4Sl9RCb6Ix6VLnbSZv
0ifU6k2iQXFgT9ZFNcvYdnxJT8tTmInXuWvf/xsHctrHnyG60g0=
=xWlJ
-----END PGP SIGNATURE-----
--=-=-=--
