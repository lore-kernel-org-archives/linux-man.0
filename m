From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: Error in man page: realloc(ptr, 0) is not equivalent to free(ptr)
Date: Sat, 23 Feb 2008 03:41:13 -0500
Message-ID: <200802230341.14864.vapier@gentoo.org>
References: <47BD19AF.4000101@trn.iki.fi> <cfd18e0f0802220215l6e61ab90h4a2d9b2e3e2a194d@mail.gmail.com> <1203754246.3021.104.camel@linux.heathens.co.nz>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1364080.3kQ996fb2L";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1203754246.3021.104.camel-DBi1IKlRe8YXiSwHZUBl+UgmxNRb6L7S@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris =?utf-8?q?=E3=82=AF?= Heath <chris-FSXMH2gLahXJKwlM9GxbOw@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Lasse =?iso-8859-1?q?K=E4rkk=E4inen?= <tronic-ze05kZMmeybHOG6cAo2yLw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart1364080.3kQ996fb2L
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Saturday 23 February 2008, Chris =E3=82=AF Heath wrote:
> On Fri, 2008-02-22 at 11:15 +0100, Michael Kerrisk wrote:
> > On Thu, Feb 21, 2008 at 7:59 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wro=
te:
> > > On Thursday 21 February 2008, Lasse K=C3=A4rkk=C3=A4inen wrote:
> > >  > The man page says that realloc(ptr, 0) is equivalent to free, even
> > >  > though it isn't. The text on the man page says
> > >  >
> > >  > ---
> > >  > realloc()  changes the size of the memory block pointed to by ptr =
to
> > >  > size bytes.  The contents will be unchanged to the minimum of the
> > >  > old and new sizes;  newly  allocated memory  will  be=20
> > >  > uninitialized.   If ptr  is  NULL,  the call is equivalent to
> > >  > malloc(size); if size is equal to zero, the call is equivalent to
> > >  > free(ptr).  Unless ptr is NULL, it must have been returned by an
> > >  > earlier call to malloc(), calloc() or realloc().  If the area
> > >  > pointed to was moved, a free(ptr) is done. [...]
> > >  > realloc()  returns a pointer to the newly allocated memory, which =
is
> > >  > suitably aligned for any kind of variable and may be different from
> > >  > ptr, or NULL if the request fails.  If  size  was equal to 0, eith=
er
> > >  > NULL or a pointer suitable to be passed to free() is returned.  If
> > >  > realloc() fails the original block is left untouched; it is not
> > >  > freed or moved.
> > >
> > >  i would just word it to say that when realloc() is given a size of 0,
> > > it is implementation defined as to the behavior, but it tends to match
> > > the behavior of malloc(0) (which too is implementation defined).  POS=
IX
> > > and C99 allow both cases to return either a NULL pointer or a "unique"
> > > pointer.  glibc will return a unique pointer (which cannot actually be
> > > used to store anything), but uClibc may return NULL.
> > >  -mike
> >
> > Lasse, thanks for raising this; Mike, thanks for your input.
> >
> > For man-pages-2.79, I propose to amend the description of realloc() to
> > be:
> >
> >        realloc() changes the size of the memory block pointed to
> >        by  ptr to size bytes.  The contents will be unchanged to
> >        the minimum of the old and  new  sizes;  newly  allocated
> >        memory  will  be uninitialized.  If ptr is NULL, then the
> >        call is equivalent to malloc(size); if size is  equal  to
> >        zero, and ptr is not NULL, then the call is equivalent to
> >        free(ptr).   Unless  ptr  is  NULL,  it  must  have  been
> >        returned  by  an  earlier  call  to malloc(), calloc() or
> >        realloc().  If the area pointed to was moved, a free(ptr)
> >        is done.
>
> Hmmm.  The phrase
>
>                                            if size is  equal  to
>        zero, and ptr is not NULL, then the call is equivalent to
>        free(ptr).
>
> seems to contradict the following sentence, found under RETURN VALUES:
>
>                               If size was equal to 0, either NULL
>         or a pointer suitable to be passed to free() is returned.
>
> If realloc(ptr, 0) can return a non-NULL pointer, then it isn't
> equivalent to free(ptr).
>
> So which one is correct?  My tests with glibc 2.6 indicate that
> realloc(ptr, 0) always returns NULL, so it IS equivalent to free(ptr).
> However, I don't know if that is guaranteed to always be the case.

this isnt a question that can be answered here.  you would have to ask for=
=20
clarification on the open group mailing list as they are the ones who=20
maintain the POSIX documentation.

for the purposes of the man page, i think this can be ignored.  or replace =
the=20
sentence "the call is equivalent to free(ptr)" with "the ptr is freed".
=2Dmike

--nextPart1364080.3kQ996fb2L
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.7 (GNU/Linux)

iQIVAwUAR7/cKkFjO5/oN/WBAQI2PRAA5HpZh4/WhbHOJjBLHd1Twd2Z+4KiDoGy
SDtctBYwMikQRdyand+QrrZlp8Vl52vbdZ+iQ0AVz9PKarEnLIGKc2R0lbB9Efhz
rkR6zqgT4RiIxm5B3IrPPqAiOX+KwF3zXKG8Xgc03ICfvusXf8W1Tq6ePpoDZ7zO
zCk1olyyJ/tll1Ie+uQLR/gPjz8wWGTc6OFeAtnkfbdeP+Hs91XcP+K+FZdoC1Ts
gsiGRsbyX12u94Se87MP+7vaChtyprWa9Goe5lcbuTDfd13OeU/acdMiuHbnVet6
WBcRqEf46C/YnWlvW64CEnyXiNBtrHCclWEngZzku3YR95p2Iu5sL8Z6Wb1uf36N
MJLoZwCTIBjN/sxslo5epmDzFndmRJ7E2ThxVI6/a+Zf8iXdwSMCVCMF3YgLhnP/
KgKSrsTVBBdWaakWJkzun3n/7vLv3YN3zQ8j7xJlFxx0Qi+e8WsKcO6LpL3D4RjZ
K8flb6vEE8vIxZ6vqvd9EvlfVimOULTrNZphseEvys4AybFZwDAm1+Hel3ozUQ/c
PhaLeAz+yVTFX5KmaBhlb1JIyL+2rmXrdvYY7Uf552+7lPMGLX0qZY+oqSt5lAy4
tVlIFHUdOEWn/gTZKZkQ+HZw1ZrU7A9w1jnImi9t5tWGxGTl1CLTKT16YQMT7KpS
QxqebQwHPeg=
=kc8e
-----END PGP SIGNATURE-----

--nextPart1364080.3kQ996fb2L--
