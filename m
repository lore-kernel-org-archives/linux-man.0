From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Error in man page: realloc(ptr, 0) is not equivalent to free(ptr)
Date: Tue, 26 Feb 2008 16:12:32 +0100
Message-ID: <47C42C60.20004@gmail.com>
References: <47BD19AF.4000101@trn.iki.fi> <200802210159.03465.vapier@gentoo.org> <cfd18e0f0802220215l6e61ab90h4a2d9b2e3e2a194d@mail.gmail.com> <200802230138.11461.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200802230138.11461.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, =?ISO-8859-1?Q?Lasse_?= =?ISO-8859-1?Q?K=E4rkk=E4inen?= <tronic-ze05kZMmeybHOG6cAo2yLw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org



Mike Frysinger wrote:
> On Friday 22 February 2008, Michael Kerrisk wrote:
>> On Thu, Feb 21, 2008 at 7:59 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> =
wrote:
>>> On Thursday 21 February 2008, Lasse K=E4rkk=E4inen wrote:
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
is
>>>  > equal to zero, the call is equivalent to free(ptr).  Unless ptr =
is
>>>  > NULL, it must have been returned by an earlier call to malloc(),
>>>  > calloc() or realloc().  If the area pointed to was moved, a free=
(ptr)
>>>  > is done. [...]
>>>  > realloc()  returns a pointer to the newly allocated memory, whic=
h is
>>>  > suitably aligned for any kind of variable and may be different f=
rom
>>>  > ptr, or NULL if the request fails.  If  size  was equal to 0, ei=
ther
>>>  > NULL or a pointer suitable to be passed to free() is returned.  =
If
>>>  > realloc() fails the original block is left untouched; it is not =
freed
>>>  > or moved.
>>>
>>>  i would just word it to say that when realloc() is given a size of=
 0, it
>>> is implementation defined as to the behavior, but it tends to match=
 the
>>> behavior of malloc(0) (which too is implementation defined).  POSIX=
 and
>>> C99 allow both cases to return either a NULL pointer or a "unique"
>>> pointer.  glibc will return a unique pointer (which cannot actually=
 be
>>> used to store anything), but uClibc may return NULL.
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
> a quick read and it leaves me wondering "what if i call realloc(NULL,=
 0) ?". =20
> if i re-read it a few times, i can work out that the documentation, b=
y not=20
> saying anything about size in the first statement, implies that mallo=
c(size)=20
> is for all values of size.  but perhaps that should be made explicit =
?
>=20
> ... If ptr is NULL, then the call is equivalent to malloc(size) for a=
ll values=20
> of size; ...

Yes, good idea.  I've made that change.

> otherwise, it looks good to me, thanks

Thanks for checking it over.

Cheers,

Michael

--=20
Michael Kerrisk
Maintainer of the Linux man-pages project
http://www.kernel.org/doc/man-pages/
Want to report a man-pages bug?  Look here:
http://www.kernel.org/doc/man-pages/reporting_bugs.html
