From: Santosh Sivaraj <santosh-b8Fn+pY0OfAdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] vdso.7: __kernel_clock_gettime *_COARSE clock support in
 PPC64
Date: Mon, 5 Feb 2018 11:52:31 +0530
Message-ID: <20180205062229.ksm5ivju4wtmg6pu@santosiv.in.ibm.com>
References: <20171222002659.1930-1-santosh@fossix.org>
 <31d5abc7-d314-d4da-175f-b402e14678f0@gmail.com>
 <20171223031312.k5x4hbytlm7wwfzn@santosiv.in.ibm.com>
 <afd1b494-57f2-8e83-a0e5-f8b1a304f9c0@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="65z34rx2345dwjmz"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <afd1b494-57f2-8e83-a0e5-f8b1a304f9c0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--65z34rx2345dwjmz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote (on 2017-12-30=
 09:47:16 +0100):

> Hello Santosh,
>=20
> On 12/23/2017 04:13 AM, Santosh Sivaraj wrote:
> > * Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote (on 2017-1=
2-22 10:36:53 +0100):
> >=20
> > Hi Michael,
> >=20
> >> Hi Santosh
> >>
> >> On 12/22/2017 01:26 AM, Santosh Sivaraj wrote:
> >>> *_COARSE clocks are now supported in the __kernel_clock_gettime inter=
face in
> >>> PPC64. No longer falls back to the real system call.
> >>
> >> Can you tell me the kernel version where this change was=20
> >> made? It would be useful to include that in the text, I think.
> >> In fact, if you knew the kernel commit that made the change,
> >> that would also be of interest.
> >=20
> > The commit is currently in the PPC next tree. It should go to the mainl=
ine in
> > the 3.16 merge timeframe.
>=20
> Ahhh -- that info would have saved me quite some time hunting through sou=
rce
> code in order to try to verify the statements in the patch!
>=20
> So, would you be able to remind me about this when (if) the patch actuall=
y=20
> goes into 3.16?
>

Hi Michael,

The vdso COARSE clock patch is currently merged in the mainline. The commit=
 is
5c929885f1bb4b77f85b1769c49405a0e0f154a1. You want me to include the commit=
 in
the patch too?

Thanks,
Santosh

> Thanks,
>=20
> Michael
>=20
>=20
> > git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
> >=20
> > The commit ID in next tree is: 5c929885f1bb4b77f85b1769c49405a0e0f154a1
> >=20
> > https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commi=
t/?h=3Dnext&id=3D5c929885f1bb4b77f85b1769c49405a0e0f154a1
> >=20
> > If needed I can mention the commit once its merged into the mainline and
> > resend the patch.
> >=20
> >>
> >> Also, your patch changes just the entry for ppc/64. Does
> >> the same statement hold true for ppc/32?
> >=20
> > No, changes are made only for vdso64.
> >=20
> > Thanks,
> > Santosh
> >>
> >> Thanks,
> >>
> >> Michael
> >>
> >>
> >>> CC: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>> CC: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
> >>> Signed-off-by: Santosh Sivaraj <santosh-b8Fn+pY0OfAdnm+yROfE0A@public.gmane.org>
> >>> ---
> >>>  man7/vdso.7 | 4 +---
> >>>  1 file changed, 1 insertion(+), 3 deletions(-)
> >>>
> >>> diff --git a/man7/vdso.7 b/man7/vdso.7
> >>> index 9af02a8aa..c7399939c 100644
> >>> --- a/man7/vdso.7
> >>> +++ b/man7/vdso.7
> >>> @@ -438,9 +438,7 @@ clocks are
> >>>  .I not
> >>>  supported by the
> >>>  .I __kernel_clock_getres
> >>> -and
> >>> -.I __kernel_clock_gettime
> >>> -interfaces;
> >>> +interface;
> >>>  the kernel falls back to the real system call.
> >>>  .SS s390 functions
> >>>  .\" See linux/arch/s390/kernel/vdso32/vdso32.lds.S
> >>>
> >=20

--=20

--65z34rx2345dwjmz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCAAxFiEEEPhI2K1zm+w17KotztxEnntb8vcFAlp3+CUTHHNhbnRvc2hA
Zm9zc2l4Lm9yZwAKCRDO3ESee1vy91npD/9D3kL0Yfb4ctYQsoYJwq1l3p09V8Ut
2QX3U1Ydg3YOU9kdlsUo0WjI+3duOEnGqeuXAXxafa2sdWp8ZzB1l46CdUl4DfSP
hp5YkEx/Uvdamop7BOR61ohWiGQINbVFcAd6dgEEqYeXqMHzT+Vh9VyaYGp6H/A6
qZhzR7vGZ9MQlYw0c/kOoTHAcepA71mdp+tmh11inBgq6vNrjZuxayBH0oGABRYb
JXeN9WCSriZYrzdukuzijISzQkSNKtCQ1b5lY+UjomZwpqFz4auQC6uXc0pDQ8ul
K3qXtAjRUsIlYbFoNPAXUoUGDBSzbNwt6qrm8TURmaTqLKLEgDWP2WoNyFeGMua+
58mdeROwhLRztUCD0batFGWyqIA8Oa/4n9Z6/WoczmB3I7cRuFwtc53uWaC2SiUx
9jiq5MJJ8eHwlM5j+RMqwfeb0GncYCY4k1shYS+ejUsIntX+T12llR2sGrluaJuP
OVnOMx6eFCAO+eqHcSxFTj0dZ/wwYi3DUFoJ8WXmumeSp9Q6mfcoj8oCp/toNRRj
5/hSHLjhcuX3x2JEc5ulNvEDE80tCuPzLVd6dbC+t2/PdoWBJK5aEq7T61KRq6GA
i+oPyZvHLGQSORCev5MTGZCknEuO3BOJp16zZ2+bxqvJVqlkq27tQP0mcoh5huN4
ELNoMAbt55xplQ==
=FbLb
-----END PGP SIGNATURE-----

--65z34rx2345dwjmz--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
