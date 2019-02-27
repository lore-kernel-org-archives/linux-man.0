From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Subject: Re: [PATCH] man7/mdoc_samples.7: srcfix: Avoid a warning
 about a wrong section
Date: Wed, 27 Feb 2019 20:48:50 +1100
Message-ID: <20190227094847.bkasny3d4obp2n25@crack.deadbeast.net>
References: <20190216180340.GA7407@rhi.hi.is>
	<7a5597f7-2c4e-95ca-2eb5-20369a5857cb@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="et764kdjaaaplz4o"
Return-path: <groff-bounces+gcpgg-help-groff=m.gmane.org@gnu.org>
Content-Disposition: inline
In-Reply-To: <7a5597f7-2c4e-95ca-2eb5-20369a5857cb@gmail.com>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/groff>,
	<mailto:groff-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/groff/>
List-Post: <mailto:groff@gnu.org>
List-Help: <mailto:groff-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/groff>,
	<mailto:groff-request@gnu.org?subject=subscribe>
Errors-To: groff-bounces+gcpgg-help-groff=m.gmane.org@gnu.org
Sender: "groff" <groff-bounces+gcpgg-help-groff=m.gmane.org@gnu.org>
To: linux-man@vger.kernel.org
Cc: groff@gnu.org
List-Id: linux-man@vger.kernel.org


--et764kdjaaaplz4o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

At 2019-02-27T10:09:44+0100, Michael Kerrisk (man-pages) wrote:
> Bjarni,
>=20
> On 2/16/19 7:03 PM, Bjarni Ingi Gislason wrote:
> > Usage: .Rv -std in sections 2 and 3 only (#1672)
> >=20
> >   The output from "nroff" and "groff" is unchanged
>=20
> Can you please elaborate on what the problem problem is (.,
> how do you see the warning)?

I can't answer the parenthetical definitively--I think Bjarni has
customized local versions of man-db and groff that enable or supplement
warnings, making a kind of lint tool for man pages.

But I think I can speak to the underlying change.  The names of some
symbols in the mdoc macro package got their "doc-" prefixes restored to
them in groff 1.22.4.  They had been getting rewritten by "the stripper"
in the groff source tree, a sed script which applies a bunch of
transforms to a few of the macro packages to make them run more
efficiently.  Groff's parser does not tokenize its input, let alone
compile it down to an intermediate representation, so for instance if
you have a 72-character comment line inside a macro definition or loop,
thus:

=2E\" ********************************************************************

=2E..groff will re-parse the 73 characters (counting the newline) every
time the macro is called or the loop iterates.

Unfortunately it is only the stripped version of the macro packages that
get installed, which makes them pretty hostile to user comprehension,
like JavaScript minification.

Opinions on the utility of the stripper script among the groff
development team are mixed.  One thing no one cared to defend was using
the stripper to change the names of string or number registers, as those
are part of the interface of a macro package, not cosmetic or stylistic
stuff.  The whole issue arose because the stripper script inadvertently
renamed a symbol in "mom", an entirely different macro package, contrary
to the knowledge and intentions of its developer.

Here is the commit in question.

https://lists.gnu.org/archive/html/groff-commit/2017-11/msg00098.html

Come to think of it, because this _was_ an interface change for mdoc,
this change should have been documented in the NEWS file for groff
1.22.4.  That it was not was my oversight, and I apologize.

> > Signed-off-by: Bjarni Ingi Gislason <bjarniig@rhi.hi.is>
> > ---
> >  man7/mdoc.samples.7 | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/man7/mdoc.samples.7 b/man7/mdoc.samples.7
> > index 6d1887481..7109afba4 100644
> > --- a/man7/mdoc.samples.7
> > +++ b/man7/mdoc.samples.7
> > @@ -1668,11 +1668,11 @@ will generate the following text:
> >  .Pp
> >  .\" fake section 3 to avoid error message from Rv
> >  .\".ds cH 3
> > -.ds section 3
> > +.ds doc-section 3
> >  .Rv -std atexit
> >  .\" and back to 7 again
> >  .\".ds cH 7
> > -.ds section 7
> > +.ds doc-section 7
> >  .Pp
> >  The
> >  .Fl std

Regards,
Branden

--et764kdjaaaplz4o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAlx2XO4ACgkQ0Z6cfXEm
bc5NhQ//U+yQkK1TJmzYie+cXmVzT5lW0cSGFyJulu4j4i0+g4Iz/MfNaGXI6GzX
yOfNkmDw5/yA0dxP5pvpX47LLuWT6xdZ24jbvCvctNxRTxhL/Mq/6cBvB/ZYM2wH
FmG/DUmmIEiFb/LoBw745YefqNmO8ALYyWfGX0OXqaL8tu1QYrvgSI8aveDVRhiF
xxh3kJxbK2duuTtzBDKSRiOcDqbBIuRgXOxVbJcuRH6Sjv2kjfrz2wKfrj/urQxw
xlhvuJ2In/Tj4gR1sCLDx8n5EhWGLGtNG5SCiwqeHipBhJHKklOzHnDVOLlsYYQw
HK98r4saGc2rSlP0rcPLrJtgqyewdQpelIYLBrGRz3JWMr4C7I2Co0ryCSy38nLg
g1t1RsLJvg10X8uI+rd6Kl7iRBSU9SHu/IsBAmQucB7acJupnTfuTMnf4hE0qfc4
diwxOscPpfVTePcQpaaio4U+F3D1SgB1+S2jv8VwDk5c3YEmqpJu3VJnFv8nJJnp
NG0XVDu7Ap3QtPSMtCPda9lPFVssH3sID8MPEuaqA2EGa1lmjOCt9kKHPeLDZU6X
e/Rc6kko5J/eMQ5sQ5BQkYv1bH/UYHOLi/aIoYTwColOdK1cX4Y4FeI46GNm0WoQ
rrCDgSk6rO7eWQByMoY04a4jjyqEHy1IUXZlKnEHoTKy7OQQRz0=
=ao0X
-----END PGP SIGNATURE-----

--et764kdjaaaplz4o--
