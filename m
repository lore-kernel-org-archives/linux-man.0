From: Chris =?UTF-8?Q?=22=E3=82=AF=22?= Heath <chris-FSXMH2gLahXJKwlM9GxbOw@public.gmane.org>
Subject: Re: Error in man page: realloc(ptr, 0) is not equivalent to
	free(ptr)
Date: Sun, 02 Mar 2008 18:53:26 -0500
Message-ID: <1204502006.5238.86.camel@linux.heathens.co.nz>
References: <47BD19AF.4000101@trn.iki.fi>
	 <200802210159.03465.vapier@gentoo.org>
	 <cfd18e0f0802220215l6e61ab90h4a2d9b2e3e2a194d@mail.gmail.com>
	 <1203754246.3021.104.camel@linux.heathens.co.nz> <47C42C68.405@gmail.com>
	 <cfd18e0f0803020501y4e803b6dk5479db1f1f36b37@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0803020501y4e803b6dk5479db1f1f36b37-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Lasse =?ISO-8859-1?Q?K=E4rkk=E4inen?= <tronic-ze05kZMmeybHOG6cAo2yLw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, 2008-03-02 at 14:01 +0100, Michael Kerrisk wrote:
> Chris,
>=20
> Ping!  Did you have anything further to add?

I stopped following this thread because I realized that my main issue
was with the standards.

I have one comment though:  I believe that the ISO C standard mandates
that, for ptr !=3D NULL, realloc(ptr,0) be equivalent to free() (and
return NULL), whereas POSIX uses the vaguer phrase "pointer is
freed" (and return a null pointer or a unique pointer that can be
successfully passed to free()).

The man-page is mixing the two standards, saying it is equivalent to
free() but returns a null pointer or a unique pointer that can be
successfully passed to free().  While this is technically correct, it i=
s
less internally consistent than either of the standards.  How about
following POSIX and using "ptr is freed" instead of "equivalent to
free(ptr)"?

Chris


> Cheers,
>=20
> Michael
>=20
> On Tue, Feb 26, 2008 at 4:12 PM, Michael Kerrisk
> <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> >
> > Chris =E3=82=AF Heath wrote:
> > > On Fri, 2008-02-22 at 11:15 +0100, Michael Kerrisk wrote:
> > >> On Thu, Feb 21, 2008 at 7:59 AM, Mike Frysinger <vapier@gentoo.o=
rg> wrote:
> > >>> On Thursday 21 February 2008, Lasse K=C3=A4rkk=C3=A4inen wrote:
> > >>>  > The man page says that realloc(ptr, 0) is equivalent to free=
, even
> > >>>  > though it isn't. The text on the man page says
> > >>>  >
> > >>>  > ---
> > >>>  > realloc()  changes the size of the memory block pointed to b=
y ptr to
> > >>>  > size bytes.  The contents will be unchanged to the minimum o=
f the old
> > >>>  > and new sizes;  newly  allocated memory  will  be  uninitial=
ized.   If
> > >>>  > ptr  is  NULL,  the call is equivalent to malloc(size); if s=
ize is equal
> > >>>  > to zero, the call is equivalent to free(ptr).  Unless ptr is=
 NULL, it
> > >>>  > must have been returned by an earlier call to malloc(), call=
oc() or
> > >>>  > realloc().  If the area pointed to was moved, a free(ptr) is=
 done.
> > >>>  > [...]
> > >>>  > realloc()  returns a pointer to the newly allocated memory, =
which is
> > >>>  > suitably aligned for any kind of variable and may be differe=
nt from ptr,
> > >>>  > or NULL if the request fails.  If  size  was equal to 0, eit=
her NULL or
> > >>>  > a pointer suitable to be passed to free() is returned.  If r=
ealloc()
> > >>>  > fails the original block is left untouched; it is not freed =
or moved.
> > >>>
> > >>>  i would just word it to say that when realloc() is given a siz=
e of 0, it is
> > >>>  implementation defined as to the behavior, but it tends to mat=
ch the behavior
> > >>>  of malloc(0) (which too is implementation defined).  POSIX and=
 C99 allow both
> > >>>  cases to return either a NULL pointer or a "unique" pointer.  =
glibc will
> > >>>  return a unique pointer (which cannot actually be used to stor=
e anything),
> > >>>  but uClibc may return NULL.
> > >>>  -mike
> > >> Lasse, thanks for raising this; Mike, thanks for your input.
> > >>
> > >> For man-pages-2.79, I propose to amend the description of reallo=
c() to be:
> > >>
> > >>        realloc() changes the size of the memory block pointed to
> > >>        by  ptr to size bytes.  The contents will be unchanged to
> > >>        the minimum of the old and  new  sizes;  newly  allocated
> > >>        memory  will  be uninitialized.  If ptr is NULL, then the
> > >>        call is equivalent to malloc(size); if size is  equal  to
> > >>        zero, and ptr is not NULL, then the call is equivalent to
> > >>        free(ptr).   Unless  ptr  is  NULL,  it  must  have  been
> > >>        returned  by  an  earlier  call  to malloc(), calloc() or
> > >>        realloc().  If the area pointed to was moved, a free(ptr)
> > >>        is done.
> > >
> > > Hmmm.  The phrase
> > >
> > >                                            if size is  equal  to
> > >        zero, and ptr is not NULL, then the call is equivalent to
> > >        free(ptr).
> > >
> > > seems to contradict the following sentence, found under RETURN VA=
LUES:
> > >
> > >                               If size was equal to 0, either NULL
> > >         or a pointer suitable to be passed to free() is returned.
> > >
> > > If realloc(ptr, 0) can return a non-NULL pointer, then it isn't
> > > equivalent to free(ptr).
> > >
> > > So which one is correct?  My tests with glibc 2.6 indicate that
> > > realloc(ptr, 0) always returns NULL, so it IS equivalent to free(=
ptr).
> > > However, I don't know if that is guaranteed to always be the case=
=2E
> >
> > Chris,
> >
> > The text under RETURN VALUE is quite close to the POSIX.1 spec for
> > realloc(), which says this:
> >
> >       If size is 0, either a null pointer or a
> >       unique pointer that can be successfully passed to  free()
> >       shall be returned.
> >
> > After Mike's last suggestion, the body of the Linux man page says t=
his:
> >
> >       If ptr is NULL, then the
> >       call is equivalent to malloc(size),  for  all  values  of
> >       size; if size is equal to zero, and ptr is not NULL, then
> >       the call is equivalent to free(ptr).
> >
> > So:
> >
> > a) If ptr is NULL, and size is zero, then realloc() is equivalent t=
o
> > malloc(0), which does the following (as already documented in the L=
inux
> > malloc.3 man page):
> >
> >       If size is 0, then malloc() returns either NULL, or a unique
> >       pointer value that can later be successfully passed to free()=
=2E
> >
> > That seems entirely consistent with the text under RETURN VALUE for=
 the
> > Linux malloc.3 man page.
> >
> > b) If ptr is not NULL, and size is zero, then the standard isn't (A=
=46AICS)
> > explicit about whether "a null pointer or a unique pointer that can=
 be
> > successfully passed to free()" shall be returned, but the former ce=
rtainly
> > seems more reasonable, and is what you observed for glibc.
> >
> >
> > Cheers,
> >
> > Michael
> >
> > --
> > Michael Kerrisk
> > Maintainer of the Linux man-pages project
> > http://www.kernel.org/doc/man-pages/
> > Want to report a man-pages bug?  Look here:
> > http://www.kernel.org/doc/man-pages/reporting_bugs.html
> >
> >
> >
>=20
>=20
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
