From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: STV_PROTECTED
Date: Wed, 9 Mar 2016 00:01:36 -0500
Message-ID: <20160309050136.GR6588@vapier.lan>
References: <20150929101411.GA17105@skagos.loria.fr>
 <56DF7669.70204@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1WqHV5/jCvFSwawE"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56DF7669.70204-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gabriel Corona <gabriel.corona-Pj3lBMu8rt9bbU8NOSLlsg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--1WqHV5/jCvFSwawE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 09 Mar 2016 02:03, Michael Kerrisk (man-pages) wrote:
> On 09/29/2015 12:14 PM, Gabriel Corona wrote:
> > The elf manpage [2] claims that:
> >=20
> >> STV_PROTECTED   Not preemptible, not exported.
> >=20
> > However the System V gABI [1] claims that:
> >=20
> >> A symbol defined in the current component is protected if it is
> >> visible in other components but not preemptable
> >=20
> > Should the manpage read something like:
> >=20
> >> STV_PROTECTED   Not preemptible but exported.
> >=20
> > [1] http://www.sco.com/developers/gabi/2003-12-17/ch4.symtab.html
> >=20
> > [2] http://man7.org/linux/man-pages/man5/elf.5.html
>=20
> I think you are right, but let's see if Mike might confirm,
> since he originally added that text. (Mike, I suspect there
> was a wordo here.)

i didn't really author that content, but take it from elf.h in glibc:
#define STV_PROTECTED	3		/* Not preemptible, not exported */

and binutils says:
#define STV_PROTECTED	3		/* Treat as STB_LOCAL inside current component */

and llvm says:
  STV_PROTECTED =3D 3   // Visible in other components but not preemptable

gabi says:
https://refspecs.linuxbase.org/elf/gabi4+/ch4.symtab.html
A symbol defined in the current component is protected if it is visible in =
other=20
components but not preemptable, meaning that any reference to such a symbol=
 from=20
within the defining component must be resolved to the definition in that=20
component, even if there is a definition in another component that would pr=
eempt=20
by the default rules. A symbol with STB_LOCAL binding may not have STV_PROT=
ECTED=20
visibility. If a symbol definition with STV_PROTECTED visibility from a sha=
red=20
object is taken as resolving a reference from an executable or another shar=
ed=20
object, the SHN_UNDEF symbol table entry created has STV_DEFAULT visibility.

solaris/oracle says:
https://docs.oracle.com/cd/E26502_01/html/E26507/chapter6-79797.html
A symbol that is defined in the current component is protected if the symbo=
l is=20
visible in other components, but cannot be preempted. Any reference to such=
 a=20
symbol from within the defining component must be resolved to the definitio=
n in=20
that component. This resolution must occur, even if a symbol definition exi=
sts=20
in another component that would interpose by the default rules. A symbol wi=
th=20
STB_LOCAL binding will not have STV_PROTECTED visibility.

but i think this ibm article is probably the most understandable:
https://www.ibm.com/developerworks/aix/library/au-aix-symbol-visibility/
The symbol is visible outside the current executable or shared object, but =
it=20
may not be overridden. In other words, if a protected symbol in a shared li=
brary=20
is referenced by an other code in the shared library, the other code will a=
lways=20
reference the symbol in the shared library, even if the executable defines =
a=20
symbol with the same name.

so while "Not preemptible but exported" is more correct, i'm not sure it's
still all that great.  maybe "Exported; not preemptible in current module."=
 ?
-mike

--1WqHV5/jCvFSwawE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJW364wAAoJEEFjO5/oN/WBLYgQAK91CoEgKV2DTna22ZjkEr/3
8WkXDcIMVmOoiLP025wS22NMaWsOUA0SOpkL4WeLGr8lbNMDyFXP1+v3fKZ6S3AV
QgJ68q7VVJlp33LxoUJcAZf95ZMzg8nFDhJGH40uDb4serAI5G9xNUZRUcRzcKB8
HTZYcOBEmm3S84qO3cde2vP56e36umP1icaEaOmuLck+jWZ6Vqvn9DKfNsGriDjM
KCF2IKB8IoyYCX0QIkwJmSXFaMlIqCAWtZyXkY9g/eSZ0s0t8dqDGvgNAIvV+Qzi
KwvRzhIF5giRPM5mM5acSGZRdmSEmlCny8Ei8JGtHpW4bdFC77V1GFQLJJHeJ0Oc
jBpu9t4ux8RELPru/9nF95V3DnafrR1V0D0sJjE1T8dq6VzaVGuYjsrlx2AxiedT
OW/0q+/3U6YP1dhZlrL9wuptz/yjetnAlUw/EZa4/EJrK48ae+d1auStIymjyHGm
5FccIiG5j1ypP/D9qw0Jjoo07ipVQMnKWiFJT1ML5L7Qowydl/HzHvrCauRtITBU
evy+j4zJacpGOugtFocVO0T3+gbUYhlwjjelUUKi5wxE4NMsXUDqQJxu66RuzbVh
HCUJdMAx3MERz/oyu8qlvpy+vmrEft0Q+mCI1ga41EKrtiX9ToKhPPd5Xq8CM2gZ
iTS/qIIUDheIAS15geEE
=4frb
-----END PGP SIGNATURE-----

--1WqHV5/jCvFSwawE--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
