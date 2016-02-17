From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: manpages-dev: printf(3) example: possible integer overflow
Date: Wed, 17 Feb 2016 22:13:13 +0100
Message-ID: <56C4E269.5020108@bfs.de>
References: <e62670273dd84e658fe32cda6e16e94b@legtux.org>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e62670273dd84e658fe32cda6e16e94b-lkSrsyIBln0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: saulery-lkSrsyIBln0dnm+yROfE0A@public.gmane.org
Cc: 794947-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, control-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org



Am 17.02.2016 13:40, schrieb St=C3=A9phane Aulery:
> retitle 794947 printf(3): possible integer overflow in make_message e=
xample
> severity 794947 wishlist
> tags 794947 + confirmed
> tags 794947 + upstream
> forwarded 794947 linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> stop
>=20
> -----
>=20
> Hello Walter,
>=20
> Jakub Wilk reported a possible integer overflow in make_message examp=
le :
>=20
>> The example in the printf(3) manpages looks like this (with boring p=
arts
>> omitted):
>>
>> int n;
>> /* ... */
>>   n =3D vsnprintf(p, size, fmt, ap);
>>    /* ... */
>>    if (n < 0) {
>>        /* ... */
>>        return NULL;
>>    }
>>    /* ... */
>>    size =3D n + 1;
>>
>>
>> But vsnprintf could return INT_MAX, which would then cause "n + 1" t=
o
>> overflow.
>>
>> (AFAICS, the glibc vsnprintf implementation never returns INT_MAX, b=
ut
>> it could in principle.)
>>
>> I'd suggest changing "n < 0" to "n < 0 || n =3D=3D INT_MAX".
>=20
>=20

Hi,

the bug is real, the type of size should be size_t (in my original post=
 it was int)
That would make the error check useless, so we would need to store
the vsnprintf return value in an int.

The problem is that the idea was to have a simple example and clutterin=
g
it with error checks will make it hard to read. How many people would
notice that size_t is unsigned and n is signed ? (i added an comment).

IMHO we should simply add a sentence that "examples are examples and
will not check for every possible error condition."

re,
 wh

#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>

char *
make_message2 (const char *fmt, ...)
{
  int n =3D 0;
  size_t size=3D0;
  char *p =3D NULL;
  va_list ap;

  /* figure our required size */
  va_start (ap, fmt);
  n =3D vsnprintf (p, size, fmt, ap);
  va_end (ap);

  if (n < 0)
    return NULL;

  /* size is unsigned */
  size=3Dn;

  /* leave room for \0 */
  size++;
  p =3D malloc (size);
  if (p =3D=3D NULL)
    return NULL;

  va_start (ap, fmt);
  n =3D vsnprintf (p, size, fmt, ap);
  va_end (ap);

return p;
}




> Since this example has been modified by you (Walter Harms), after the
> bug #794947 [1] has been reported, I wanted to ask your opinion on th=
e
> best option.
>=20
> Should we add this test to good practice, or rather a comment to ment=
ion
> that the case is not taken into account because the example uses glib=
c?
>=20
> Regards,
>=20
> [1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D794947
>=20
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
