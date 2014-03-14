From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: For review: newlocale.3
Date: Fri, 14 Mar 2014 10:55:33 +0100
Message-ID: <CAKgNAkiv7ajtPmFZQgzq=Z1gMOkmYYjAA9TY+kLR+6HmzqnhFw@mail.gmail.com>
References: <CAKgNAkhAR_LSqav=Lz_u+xJarZgBr4ft-NBeJirmCw7rd4LFSA@mail.gmail.com>
 <5663087.ED3DXCYTiR@vapier>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5663087.ED3DXCYTiR@vapier>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Mike,

On Thu, Mar 13, 2014 at 9:13 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wro=
te:
> On Wed 12 Mar 2014 16:47:43 Michael Kerrisk wrote:
>> .SH DESCRIPTION
>> The
>> .BR newlocale ()
>> function creates a new locale object, or modifies an existing object=
,
>> returning a reference to the new or modified object as the function =
result.
>> Whether the call creates a new object or modifies an existing object
>> is determined by the value of
>> .IR base :
>
> you discuss the value of |base| first ...
>
>> .PP
>> The
>> .I category_mask
>
> ... then the |category_mask| ...
>
>> The following preset values of
>> .I locale
>
> ... then the |locale| ...
>
> (side note: shouldn't there be a .PP to start this portion ?)

Yup, better. Added.

>> .PP
>> If
>> .I base
>
> ... then back to |base| ?  generally i expect the discussion of each =
argument
> to be together rather than split across paragraphs.  if i were referr=
ing to
> this for programming, i probably wouldn't have even made it this far.

Okay -- I moved that para to go with the rest of the description of 'ba=
se'.

>> .B EINVAL
>> One or more bits in
>> .I category_mask
>> does not correspond to a valid locale category.
>
> does->do

=46ixed.

>> Having created and initialized the locale object,
>> the program then applies it using
>> .BR uselocale (),
>
> shouldn't that be (3) ?

Yup.

>> Te Paraire, te 07 o Pout=C5=AB-te-rangi, 2014 00:38:44 CET
>> .fi
>> .in
>>
>> .in +4n
>> .nf
>>
>> .fi
>> .in
>> .SS Program source
>
> this ends up rendering 3 blank lines before "Program source" when rea=
lly only
> one is needed

=46unny, id didn't render that way for me. However, the above piece is
obviously cruft, and I removed it ;-).

>> .nf
>> #define _XOPEN_SOURCE 700
>> #include <stdio.h>
>> #include <stdlib.h>
>> #include <locale.h>
>> #include <time.h>
>>
>> #define errExit(msg)    do { perror(msg); exit(EXIT_FAILURE); \\
>>                         } while (0)
>
> not sure what standard you're aiming for, but if you include err.h, y=
ou don't
> need this macro.  you can just call err(1, msg).

I tend to avoid those functions because they're nonstandard (some of
the examples in man pages do compile and sun on non-Linux systems).
So, I just roll my own short macros.

>>     if (argc > 2) {
>>         nloc =3D newlocale(LC_TIME_MASK, argv[2], loc);
>>         if (loc =3D=3D (locale_t) 0)
>
> shouldn't you be testing nloc ?

Yup!

> if you're just going to exit on error, i wonder why even bother with =
nloc
> indirection

More to illustrate the point that this is how to do things generally
(i.e., we might be doing something other than exiting on error). I've
added a comment explaining this.

>>     s =3D strftime(buf, BUF_SIZE, "%c", tm);
>
> why not sizeof(buf) ?  avoids needing BUF_SIZE at all.

Yes, simpler. Done.

Thanks for the comments, Mike.

Cheers,

Michael



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
