From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Error in man page: realloc(ptr, 0) is not equivalent to	free(ptr)
Date: Tue, 26 Feb 2008 16:12:40 +0100
Message-ID: <47C42C68.405@gmail.com>
References: <47BD19AF.4000101@trn.iki.fi>	 <200802210159.03465.vapier@gentoo.org>	 <cfd18e0f0802220215l6e61ab90h4a2d9b2e3e2a194d@mail.gmail.com> <1203754246.3021.104.camel@linux.heathens.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1203754246.3021.104.camel-DBi1IKlRe8YXiSwHZUBl+UgmxNRb6L7S@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?IkNocmlzIFwi44KvXCIgSGVhdGgi?= <chris-FSXMH2gLahXJKwlM9GxbOw@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, =?UTF-8?B?TGFzc2UgS8Okcmtrw6RpbmVu?= <tronic-ze05kZMmeybHOG6cAo2yLw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Chris =E3=82=AF Heath wrote:
> On Fri, 2008-02-22 at 11:15 +0100, Michael Kerrisk wrote:
>> On Thu, Feb 21, 2008 at 7:59 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> =
wrote:
>>> On Thursday 21 February 2008, Lasse K=C3=A4rkk=C3=A4inen wrote:
>>>  > The man page says that realloc(ptr, 0) is equivalent to free, ev=
en
>>>  > though it isn't. The text on the man page says
>>>  >
>>>  > ---
>>>  > realloc()  changes the size of the memory block pointed to by pt=
r to
>>>  > size bytes.  The contents will be unchanged to the minimum of th=
e old
>>>  > and new sizes;  newly  allocated memory  will  be  uninitialized=
=2E   If
>>>  > ptr  is  NULL,  the call is equivalent to malloc(size); if size =
is equal
>>>  > to zero, the call is equivalent to free(ptr).  Unless ptr is NUL=
L, it
>>>  > must have been returned by an earlier call to malloc(), calloc()=
 or
>>>  > realloc().  If the area pointed to was moved, a free(ptr) is don=
e.
>>>  > [...]
>>>  > realloc()  returns a pointer to the newly allocated memory, whic=
h is
>>>  > suitably aligned for any kind of variable and may be different f=
rom ptr,
>>>  > or NULL if the request fails.  If  size  was equal to 0, either =
NULL or
>>>  > a pointer suitable to be passed to free() is returned.  If reall=
oc()
>>>  > fails the original block is left untouched; it is not freed or m=
oved.
>>>
>>>  i would just word it to say that when realloc() is given a size of=
 0, it is
>>>  implementation defined as to the behavior, but it tends to match t=
he behavior
>>>  of malloc(0) (which too is implementation defined).  POSIX and C99=
 allow both
>>>  cases to return either a NULL pointer or a "unique" pointer.  glib=
c will
>>>  return a unique pointer (which cannot actually be used to store an=
ything),
>>>  but uClibc may return NULL.
>>>  -mike
>> Lasse, thanks for raising this; Mike, thanks for your input.
>>
>> For man-pages-2.79, I propose to amend the description of realloc() =
to be:
>>
>>        realloc() changes the size of the memory block pointed to
>>        by  ptr to size bytes.  The contents will be unchanged to
>>        the minimum of the old and  new  sizes;  newly  allocated
>>        memory  will  be uninitialized.  If ptr is NULL, then the
>>        call is equivalent to malloc(size); if size is  equal  to
>>        zero, and ptr is not NULL, then the call is equivalent to
>>        free(ptr).   Unless  ptr  is  NULL,  it  must  have  been
>>        returned  by  an  earlier  call  to malloc(), calloc() or
>>        realloc().  If the area pointed to was moved, a free(ptr)
>>        is done.
>=20
> Hmmm.  The phrase
>=20
>                                            if size is  equal  to
>        zero, and ptr is not NULL, then the call is equivalent to
>        free(ptr).
>=20
> seems to contradict the following sentence, found under RETURN VALUES=
:
>=20
>                               If size was equal to 0, either NULL
>         or a pointer suitable to be passed to free() is returned. =20
>=20
> If realloc(ptr, 0) can return a non-NULL pointer, then it isn't
> equivalent to free(ptr).
>=20
> So which one is correct?  My tests with glibc 2.6 indicate that
> realloc(ptr, 0) always returns NULL, so it IS equivalent to free(ptr)=
=2E
> However, I don't know if that is guaranteed to always be the case.

Chris,

The text under RETURN VALUE is quite close to the POSIX.1 spec for
realloc(), which says this:

       If size is 0, either a null pointer or a
       unique pointer that can be successfully passed to  free()
       shall be returned.

After Mike's last suggestion, the body of the Linux man page says this:

       If ptr is NULL, then the
       call is equivalent to malloc(size),  for  all  values  of
       size; if size is equal to zero, and ptr is not NULL, then
       the call is equivalent to free(ptr).

So:

a) If ptr is NULL, and size is zero, then realloc() is equivalent to
malloc(0), which does the following (as already documented in the Linux
malloc.3 man page):

       If size is 0, then malloc() returns either NULL, or a unique
       pointer value that can later be successfully passed to free().

That seems entirely consistent with the text under RETURN VALUE for the
Linux malloc.3 man page.

b) If ptr is not NULL, and size is zero, then the standard isn't (AFAIC=
S)
explicit about whether "a null pointer or a unique pointer that can be
successfully passed to free()" shall be returned, but the former certai=
nly
seems more reasonable, and is what you observed for glibc.

Cheers,

Michael

--=20
Michael Kerrisk
Maintainer of the Linux man-pages project
http://www.kernel.org/doc/man-pages/
Want to report a man-pages bug?  Look here:
http://www.kernel.org/doc/man-pages/reporting_bugs.html
