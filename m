From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Subject: Re: [PATCH] man7/mdoc_samples.7: srcfix: Avoid a warning
 about a wrong section
Date: Thu, 28 Feb 2019 01:20:53 +1100
Message-ID: <20190227142051.qixjkdvlwseogkmp@crack.deadbeast.net>
References: <20190216180340.GA7407@rhi.hi.is>
	<7a5597f7-2c4e-95ca-2eb5-20369a5857cb@gmail.com>
	<20190227094847.bkasny3d4obp2n25@crack.deadbeast.net>
	<20190227123429.GA60888@athene.usta.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5a5y7btghhlye3le"
Return-path: <groff-bounces+gcpgg-help-groff=m.gmane.org@gnu.org>
Content-Disposition: inline
In-Reply-To: <20190227123429.GA60888@athene.usta.de>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/groff>,
	<mailto:groff-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/groff/>
List-Post: <mailto:groff@gnu.org>
List-Help: <mailto:groff-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/groff>,
	<mailto:groff-request@gnu.org?subject=subscribe>
Errors-To: groff-bounces+gcpgg-help-groff=m.gmane.org@gnu.org
Sender: "groff" <groff-bounces+gcpgg-help-groff=m.gmane.org@gnu.org>
To: linux-man@vger.kernel.org, groff@gnu.org
List-Id: linux-man@vger.kernel.org


--5a5y7btghhlye3le
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

At 2019-02-27T13:34:29+0100, Ingo Schwarze wrote:
> > as those are part of the interface of a macro package,
>=20
> I think this phrase invites a misunderstanding.  With a library or
> macro package, the term "interface" is usually understood as "user
> interface" or "API", i.e. what application programs (or end-user
> documents like manual pages in the case of a macro package) are
> supposed to use.
>=20
> But the .doc-* macros are specifically *NOT* intended for use by
> manual pages.  They are supposed to be *INTERNAL* implementation
> details of the mdoc(7) macro package, and as such, they can change
> at any time without any notice whatsoever.  The .doc-* prefix is
> specifically intended to stress the internal character of these
> macros and avoid clashes with user-defined macros - even though
> defining macros inside manual pages certainly wouldn't be good
> style, it still makes sense that a macro set keeps the global
> namespace as clean as possible.  Just like a library might start
> the names of private, internal symbols that application programs
> are not supposed to access with, e.g., an "_" prefix.

Ah, okay, I stand corrected.  groff doesn't have namespaces or true
lexical scopes--though I would not dare assert that they could not be
hacked into existence--and I am too unfamiliar with mdoc to know which
symbols are intended for use by man page writers and which aren't.

> > Come to think of it, because this _was_ an interface change for mdoc,
> > this change should have been documented in the NEWS file for groff
> > 1.22.4.  That it was not was my oversight, and I apologize.
>=20
> Branden, i respectfully disagree, and quite strongly.  You did nothing
> wrong.  This was not an interface change, certainly not in the sense
> that needs to be announced to users.  It was a purely internal
> implementation change, entirely irrelevant for users.

Ah, okay.  Well, if I _didn't_ screw up, I'll accept that.  :)

>     I'm not sure whether it is better for you to include or not
>     include it.  There is probably value in having mdoc(7) documentation
>     out of the box with the Linux man-pages project.  Then again,
>     having groff_mdoc(7) in both the Linux man-pages package and
>     in the groff package - or having mdoc(7) in both the Linux
>     man-pages project and the mandoc(1) package - might cause
>     packaging conflicts for some distributions.

This should not be a problem for any self-respecting distribution.
Package maintainers frequently choose not to "ship" certain files in
certain packages due to conflicts/overlap, and sophisticated package
management systems (like dpkg) allow for migration of files between
packages across upgrades, with rollback in case of problems.

>     I don't rightly know how such conflicts are typically handled by
>     Linux distributions.  Not being able to install the Linux
>     man-pages pages project, groff(1) and mandoc(1) all together on
>     the same Linux machine would certainly be a bad situation...

I don't think has been a technical challenge for at least 25 years.

Regards,
Branden

--5a5y7btghhlye3le
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAlx2nLgACgkQ0Z6cfXEm
bc4PhQ//fJfb3H25H4wWK0suGPdZAU05QXIn/cHOZFDCb/gaIhDfsDB4BN562c9k
NDFrKcwyHQP8Mh6wXrQLOeOssVXz4XNDYNvfjJZKbEmRFmpXT4emGiaKjk1xuRiH
zg+K0bGEo61E/Qxi9ockDG9s8CISeUHILwo2PIs70W1GjfnRJkkuawybprJkgaVi
Dz99Q6wax3c4zwbAfi7DRfuQ+cwK058m1NNSuG5xHwDXVuti7FgBW+FGG8kElBKN
skr6g+4TNJoW1/TUr7U4dOkgUHSwilgSYaDDcFQXO0iSY029wmR4RQVmVT1NBs3B
LOWHMTs3aA5BScDI2X0eNnC65Avh+owcvAo/qucAGd9m+byZvHB5dabHOuQjj8B2
X+dzxhfKPVl/iErkqznM7Deluc/O/41W9kAWBnc5bPU8Dym0Ou944F7GdYq6i0DY
+gPUu8+2fsjtjTxYeysAPsT4zlm8OZ9YjiAmx3QNuDL3ooRePsGsKDOyq/C4EyeQ
0Io0zR/VzwY0CKb2d6gPrUxHrdabBbBD8E18AWRUe8kmloLlQcg0mjpAAf15XfKQ
n5VP7Ojk4/SmSXl9XH6N81B14kzbQ0ePAL2kikFJk4v6s9bH5rQLfFi+L30BFUr/
TZYOVbFn7Jp2dUWrRonVIpVHLI0n9UwOoIgW68GCV7eDB9zz724=
=MjGJ
-----END PGP SIGNATURE-----

--5a5y7btghhlye3le--
