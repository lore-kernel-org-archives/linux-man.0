From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] process_vm_{read,write}v(3): initial man pages
Date: Sat, 14 Apr 2012 00:36:23 -0400
Message-ID: <201204140036.28834.vapier@gentoo.org>
References: <1331358148-17235-1-git-send-email-vapier@gentoo.org> <201203291517.46815.vapier@gentoo.org> <CAKgNAkiKL64_H2QT6v0hsP-=cM3w=wGJbjaph+JMq6R+Knhysg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3383482.ShAoErfC3N";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkiKL64_H2QT6v0hsP-=cM3w=wGJbjaph+JMq6R+Knhysg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Christopher Yeoh <cyeoh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart3383482.ShAoErfC3N
Content-Type: Text/Plain;
  charset="windows-1252"
Content-Transfer-Encoding: quoted-printable

On Friday 13 April 2012 21:07:28 Michael Kerrisk wrote:
> On Fri, Mar 30, 2012 at 8:17 AM, Mike Frysinger wrote:
> > On Thursday 29 March 2012 14:42:49 Michael Kerrisk wrote:
> >> .\" FIXME: What does the following sentence mean?
> >=20
> > heh, i was just about to suggest a clarification.  consider the case
> > where you want to read a C string from a remote process.  you don't know
> > its length, so it is probably cheaper to read too much data and then
> > discard the rest than it is to read it byte by byte in a single syscall.
> >=20
> > further consider the string lies in the last page of a valid mapping.
> >  you don't want to always say "read 500 bytes" because if the first 200
> > bytes are the last 200 bytes of the last page, the remaining 300 bytes
> > cover invalid memory, and so no data will be read.
> >=20
> > instead, you'd split the remote read array into two elements and have
> > them merge back into a single write array entry.  the first read entry
> > goes up to the page boundary while the second starts on the next page
> > boundary.
> >=20
> >> Keep this in mind when attempting to
> >> extract data of unknown length (such as C strings which are
> >> null-terminated) by avoiding spanning memory pages (typically 4KiB).
> >=20
> > ... by avoiding spanning memory pages (typically 4KiB) in a single iovec
> > element.
>=20
> Thanks for the clear explanation, and the crisp addition to the
> man-page text. I also adapted a piece of your explanation to add into
> the page after the above sentence:
>=20
> =3D=3D
> (Instead, split the remote read array into two
> .I iovec
> elements and have them merge back into a single write array entry.
> The first read entry goes up to the page boundary,
> while the second starts on the next page boundary.)
> =3D=3D
>=20
> However, as I look at the text, there is still a nagging doubt. The
> paragraph starts
> =3D=3D
> The count arguments and
> .IR local_iov
> are checked before doing any transfers.
> If the counts are too big, or
> .I local_iov
> is invalid,
> or the addresses refer to regions that are inaccessible to the local
> process, none of the vectors will be processed and an
> error will be returned immediately.
> =3D=3D
>=20
> That seems to contradict the advice "Instead, split the remote read
> array", because surely if the second of the iovec elements refers to
> an inaccessible region, then as stated in the early part of the
> paragraph, "none of the vectors will be processed". And the advice
> refers to the "remote read array".
>=20
> What am I missing? I suspect the advice should instead apply to the
> *remote_iov*, and perhaps be placed in the following paragraph.

the new text you added describes the remote args (the stuff that needs=20
splitting).  the existing text you refer to describes the local args.  i do=
n't=20
see any contradiction here -- the kernel first checks the local memory regi=
ons=20
to make sure the local process has full access to its own regions before=20
processing anything, and then it processes the remote memory regions one=20
element at a time while doing the actual transfers.

> >> Note, however, that these system calls do not check the memory regions
> >> in the remote process until just before doing the read/write.
> >> Consequently, a partial read/write may result if one of the
> >> .I remote_vec
> >> elements points to an invalid memory region in the remote process.
> >> No further reads/writes will be attempted beyond that point.
> >=20
> > should clarify that the partial read/write applies to iovec elements
> > granularity and not byte granularity.  i.e. the syscall won't return a
> > partial read that splits a single iovect element.
>=20
> I added this text under RETURN VALUE:
>=20
> =3D=3D
> (Partial transfers apply at the granularity of
> .I iovec
> elements.
> These system calls won't perform a partial
> transfer that splits a single
> .I iovec
> element.)
> =3D=3D
>=20
> And again a question does "a single iovec element" here apply to the
> remove iovec elements, the local iovec elements, or both?

if any local iovec element is invalid, then it returns immediately without =
any=20
transferring of data.  this is because the local process should know what=20
is/isn't valid about itself before making any requests.  however, it's hard=
=20
for it to know about the remote process, so the remote elements are "looser=
"=20
in checking (which is a good thing).
=2Dmike

--nextPart3383482.ShAoErfC3N
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJPiP7MAAoJEEFjO5/oN/WBGrsP/0DN3RIBHi2/vRSE24CghELB
/8HKRE3Cp+0y16zFmCK9DzPs14EkzlaDUKCLCMVsBM4uDGEd3vcyGGHf3urjsngz
SH6HFvigfR9aXokTmEIJC0B2WdyAgHCHeqn0mULXojE1aIByHwJZ/4VIDG5oPVac
qVXpo0wGLr6Dzh8Ab0gInE0sQlTJ7PVSuELloCYIubDAFtYHg3ruNgAF10ZzljOi
nweuBhRM5i+Dq+Om4UJTsOk1n+3hxpDh65DeiRlg4zJNiPOVo1Z9AlrggilCAjr9
xUSDBKvdxbQJ6pCsqrT+4t0Dw9fkqjkAq8EXu+3EW7TDs6Trg1qbTAeGHtkuiyQ+
Oxu+6Z3BFsk05U4tOygkFT2rydF1C/Z45h213VbPslW/Tw1LsPpDojszCn3F542i
lRg4NUC2eJ2HMKmHuCnHEoGBb2jHbFnBARcNolJrC8zrlPCpjyzBCcYdVoKfrjwJ
K+dBpvdXi/V2nLPsZCc6BiA0WK1rf3sDA6S+yi0NIC4WRYiYCY69LhG72H6pDM80
ZWQMG/b1cr/b2meNF/K1zIzjoqTPyObEuNuF1JNdYW3cOZDHg8NMvFI6tMwhV2I2
VIRZzvhptTbUZ2TiDuHS2mZqKa71BahvjYx8Di6sVyfstmpGuxJGEg2QuQJ1CsJL
XOEDzwRJyAKFz6TOcrj3
=1UZZ
-----END PGP SIGNATURE-----

--nextPart3383482.ShAoErfC3N--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
