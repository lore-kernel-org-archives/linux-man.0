From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: iNotify Man Page: Prefix Header + Tail Array vs C Structure
Date: Mon, 14 Dec 2015 12:01:46 +0100
Message-ID: <566EA19A.8060309@gmail.com>
References: <566D6009.7050409@o2online.de> <566DB08E.6090305@bfs.de> <566E9009.7030703@o2online.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <566E9009.7030703-X3bqsT2AMO4b1SvskN2V4Q@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Titke <michael.tiedtke-X3bqsT2AMO4b1SvskN2V4Q@public.gmane.org>, wharms-fPG8STNUNVg@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Michael,

On 12/14/2015 10:46 AM, Michael Titke wrote:
>=20
>=20
> On 13/12/2015 18:53, walter harms wrote:
>> I am not sure that i understood what you want ...
>>
>> i would answer the question:
>>
>> * what is the actual size of struct inotify_event ?
>>
>> inotify(7) says:
>> the length of each inotify_event structure is thus sizeof(struct ino=
tify_event)+len
>=20
> Please fix the manual page: the actual size is sizeof (struct=20
> inotify_event) where struct inotify_event is as described below with =
a=20
> size parameter for the name field of NAME_MAX+1=20

If I understand you correctly, what you're saying is not correct.
The 'name' field is variable length,

> and the actual string=20
> contained in that field has a length of /len/ (and is probably NULL=20
> terminated at len+1).

Again, if I understand what you are trying to say, this is not
correct. The man page is I think rather clear:

       The name field is present only when an event is returned for  a
       file  inside  a watched directory; it identifies the file path=E2=
=80=90
       name relative to the watched directory.  This pathname is null-
       terminated,  and may include further null bytes ('\0') to align
       subsequent reads to a suitable address boundary.

       The len field counts all of the bytes in  name,  including  the
       null  bytes; the length of each inotify_event structure is thus
       sizeof(struct inotify_event)+len.

> With your answer the actual size would be the length of the fixed pre=
fix=20
> fields (w/o) plus the size of a pointer (sizeof(void*)=20

That's not what Walter said.

> for the name=20
> field w/o parameter plus len): thus you might be off by the size of a=
=20
> pointer. Each inotify message has the same width. This only refers to=
=20
> the structure described in the manual page! An actual sizeof (struct=20
> inotify_event) might yield the correct result as the system headers=20
> probably contain the correct structure.=20

If you grep through the headers in /usr/include, I think
you'll get a surprise...

> But that diversion is what makes=20
> the manual page a little bit confusing and presenting a pointer inste=
ad=20
> of a fixed size array is just plainly wrong.

The man page is not presenting a pointer. See below.

> Please review my original message as well as reference documentation=20
> regarding the C programming language.

Sorry to say, but I think you might want to review the C standard.
The syntax shown in the man page is precisely the C99 way for
declaring a flexible length array at the end of a structure:

https://en.wikipedia.org/wiki/Flexible_array_member

IOW, I think the page is fine.

Cheers,

Michael


>>> The current version of the manual page describing /inotify/ (as wel=
l as
>>> the version installed with Ubuntu 15.04 frozen to Violet Indigo)
>>> contains a descriptive C structure describing the /inotify//message=
s/:
>>>
>>>             struct inotify_event {
>>>                 int      wd;       /* Watch descriptor */
>>>                 uint32_t mask;     /* Mask describing event */
>>>                 uint32_t cookie;   /* Unique cookie associating rel=
ated
>>>                                       events (for rename(2)) */
>>>                 uint32_t len;      /* Size of name field */
>>>                 char     name[];   /* Optional null-terminated name=
 */
>>>             };
>>>
>>> As part of the development of VSI I translated the above structure
>>> without much thinking into a corresponding byte structure descripti=
on:
>>>
>>> (define inotify-event-header
>>>    (byte-structure-description
>>>     (wd   int)
>>>     (mask   4) ; [sic! that was an uint32]
>>>     (cookie 4)
>>>     (len    4)
>>>     ;(name   pointer) ; That's not a pointer but an array: NAME_MAX=
 + 1
>>> ))
>>>
>>> Now while the prefix (or header) of the message is described adequa=
tely
>>> the specification of the tail array as a char name[] would in C be
>>> interpreted as a pointer onto a char. One might insert a length
>>> parameter like char name[NAME_MAX + 1] or exclude that tail array f=
rom
>>> the structure and describe the message in terms of /prefix/ or /hea=
der/
>>> and /tail array/.
>>>
>>>             struct inotify_event {
>>>                 int      wd;       /* Watch descriptor */
>>>                 uint32_t mask;     /* Mask describing event */
>>>                 uint32_t cookie;   /* Unique cookie associating rel=
ated
>>>                                       events (for rename(2)) */
>>>                 uint32_t len;      /* Size of name field */
>>>                 char     name[NAME_MAX + 1];   /* Optional
>>> null-terminated name */
>>>             };
>>>
>>> With that length parameter in the structure the size of the message=
s is
>>> described adequately but the actual length of the name might be con=
fused
>>> with the maximum size which usually includes some (tail) padding.
>>>
>>> I'm sorry but I don't know enough about /iNotify/ to craft a patch =
for
>>> this. Is this a datagram channel where half-read messages will vani=
sh?
>>> Perhaps I should continue reading the manual page. :-)
>>>
>>> Regards,
>>> Michael
>>>
>>> --=20
>>> VSI: https://code.launchpad.net/viper-system-interface
>>>
>>>   (reason: 550 5.7.1 Content-Policy reject msg: The message contain=
s HTML
>>> subpart, therefore we consider it SPAM or Outlook Virus.  TEXT/PLAI=
N is
>>> accepted.! BF:<U
>>>
>>>
>>> PS That's not really up to the standard but "... since hosts aren't
>>> required to relay mail at all ..." someone presumes something.
>>> --=20
>>> To unsubscribe from this list: send the line "unsubscribe linux-man=
" in
>>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
