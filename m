From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: Error in man page: realloc(ptr, 0) is not equivalent to free(ptr)
Date: Sat, 23 Feb 2008 01:38:10 -0500
Message-ID: <200802230138.11461.vapier@gentoo.org>
References: <47BD19AF.4000101@trn.iki.fi> <200802210159.03465.vapier@gentoo.org> <cfd18e0f0802220215l6e61ab90h4a2d9b2e3e2a194d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1423437.fZDH1by278";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0802220215l6e61ab90h4a2d9b2e3e2a194d-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Lasse =?iso-8859-1?q?K=E4rkk=E4inen?= <tronic-ze05kZMmeybHOG6cAo2yLw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart1423437.fZDH1by278
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Friday 22 February 2008, Michael Kerrisk wrote:
> On Thu, Feb 21, 2008 at 7:59 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> > On Thursday 21 February 2008, Lasse K=E4rkk=E4inen wrote:
> >  > The man page says that realloc(ptr, 0) is equivalent to free, even
> >  > though it isn't. The text on the man page says
> >  >
> >  > ---
> >  > realloc()  changes the size of the memory block pointed to by ptr to
> >  > size bytes.  The contents will be unchanged to the minimum of the old
> >  > and new sizes;  newly  allocated memory  will  be  uninitialized.   =
If
> >  > ptr  is  NULL,  the call is equivalent to malloc(size); if size is
> >  > equal to zero, the call is equivalent to free(ptr).  Unless ptr is
> >  > NULL, it must have been returned by an earlier call to malloc(),
> >  > calloc() or realloc().  If the area pointed to was moved, a free(ptr)
> >  > is done. [...]
> >  > realloc()  returns a pointer to the newly allocated memory, which is
> >  > suitably aligned for any kind of variable and may be different from
> >  > ptr, or NULL if the request fails.  If  size  was equal to 0, either
> >  > NULL or a pointer suitable to be passed to free() is returned.  If
> >  > realloc() fails the original block is left untouched; it is not freed
> >  > or moved.
> >
> >  i would just word it to say that when realloc() is given a size of 0, =
it
> > is implementation defined as to the behavior, but it tends to match the
> > behavior of malloc(0) (which too is implementation defined).  POSIX and
> > C99 allow both cases to return either a NULL pointer or a "unique"
> > pointer.  glibc will return a unique pointer (which cannot actually be
> > used to store anything), but uClibc may return NULL.
> >  -mike
>
> Lasse, thanks for raising this; Mike, thanks for your input.
>
> For man-pages-2.79, I propose to amend the description of realloc() to be:
>
>        realloc() changes the size of the memory block pointed to
>        by  ptr to size bytes.  The contents will be unchanged to
>        the minimum of the old and  new  sizes;  newly  allocated
>        memory  will  be uninitialized.  If ptr is NULL, then the
>        call is equivalent to malloc(size); if size is  equal  to
>        zero, and ptr is not NULL, then the call is equivalent to
>        free(ptr).   Unless  ptr  is  NULL,  it  must  have  been
>        returned  by  an  earlier  call  to malloc(), calloc() or
>        realloc().  If the area pointed to was moved, a free(ptr)
>        is done.

a quick read and it leaves me wondering "what if i call realloc(NULL, 0) ?"=
=2E =20
if i re-read it a few times, i can work out that the documentation, by not=
=20
saying anything about size in the first statement, implies that malloc(size=
)=20
is for all values of size.  but perhaps that should be made explicit ?

=2E.. If ptr is NULL, then the call is equivalent to malloc(size) for all v=
alues=20
of size; ...

otherwise, it looks good to me, thanks
=2Dmike

--nextPart1423437.fZDH1by278
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.7 (GNU/Linux)

iQIVAwUAR7+/U0FjO5/oN/WBAQJpog//evXUgnjmY0wm+C1FWNoJiU2GKXQWSuoo
KcOLvDpuSopr19UzyKOKHWgsPh7vB2yGsinywxxMbxb+NhmtqF1DjkCQotdXIqWO
vVFzzXo72WEOjawnxIiMj0XwJm2dKg5/ql+cNaXK0e/Z3Eq+RF1FFYR1VnXtJxn1
NbwUORM4Hic/opytQNak7fKigblB8bGZhLiY/LFVBgtG8y2fpcCOmcAiMWedq7Lh
5pP76zH7HMApKsNZSy3MBBekRFPka2KUGB52+TGVuQ+2kjjgp67t+X2UjQCfzamv
rlpmIIbn5won9Oy9oumO8dWXqJSpGUpc7T8rVzVvJY9lrm7lT11TSGuzGa1/SXw6
tCtpiunb7QpVf2ZAYEAMs8P5qxCU6Lk3agCHMI4K37asCWLkg2inRt2lMEjRRSf5
XzsmnLE782fDn8BNdUvHKiWetK9ZfRD9fqPobznK8GqvRH2FjnIqNcn2TSY5tUqs
EBd5JrfWZENxL7CSBQgoXsSJE3qmtqy9CP76ojETGLvtlrk1Mp6gUnOXujByiy7R
k1q0EGZ/+qZGhTramYQ3fX9P7NprHCFu5BlDhyW0Hyu+pqyjlV2I3r8BJWnB2VIF
dd5tYEbqpKCT3Msv+3Vb1Y4ljY51yRejcggE1GmtScMZgSwPwXnjRTTZCMvCp4s1
5mkuc9hnHLs=
=VSAt
-----END PGP SIGNATURE-----

--nextPart1423437.fZDH1by278--
