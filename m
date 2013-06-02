From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: strtok - strings without delimiters
Date: Sun, 02 Jun 2013 14:28:17 +0200
Message-ID: <51AB3A61.5030004@gmail.com>
References: <20130512202212.GL21458@x220.fritz.box> <51993A39.3060606@gmail.com> <20130601205854.GP21458@x220.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130601205854.GP21458-w6h1d7rV6+VwFLYp8hBm2A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Georg Sauthoff <mail-vzQcyvifq/Y@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Georg,

On 06/01/13 22:58, Georg Sauthoff wrote:
> On Sun, May 19, 2013 at 10:46:49PM +0200, Michael Kerrisk wrote:

[...]

>>> but perhaps it makes sense to explicitly
>>> address these issues in the Linux man page.
> =20
>> Anyway, I agree that the page could be clearer. I've added the follo=
wing text:
> =20
>>        A sequence of calls to strtok() that operate on the same stri=
ng
>>        maintains  a  pointer  that  determines the point from which =
to
>>        start searching for the next token.  The first call to strtok=
()
>>        sets  this  pointer  to  point to the first byte of the strin=
g.
>=20
>>        The start of the next token is determined by  scanning  forwa=
rd
>>        for  the  next  nondelimiter  byte  in  str.  If such a byte =
is
>>        found, it is taken as the start of the next token.  If no  su=
ch
>>        byte  is  found,  then  there  are no more tokens, and strtok=
()
>>        returns NULL.  (A string that is empty or  that  contains  on=
ly
>>        delimiter  will thus cause strtok() to return NULL on the fir=
st
>=20
> plural, delimiters?

=46ixed now.
>>        call.)
>>
>>        The end of each token is found by scanning forward until eith=
er
>>        the  next delimiter byte is found or until the terminating nu=
ll
>>        byte ('\0') is encountered.  If a delimiter byte is  found,  =
it
>>        is overwritten with a null byte to terminate the current toke=
n,
>>        and strtok() saves  a  pointer  to  the  following  byte;  th=
at
>>        pointer  will  be used as the starting point when searching f=
or
>>        the next token.  In this case, strtok() returns  a  pointer  =
to
>>        the start of the found token.
>=20
>>        From  the above description, it follows thatt a sequence of t=
wo
>=20
> typo: /thatt/that/

Looks like I already fixed that one.

>>        or more contiguous delimiter bytes in the parsed string is co=
n=E2=80=90
>>        sidered  to  be a single delimiter, and that delimiter bytes =
at
>>        the start or end of the string are ignored.  Put  another  wa=
y:
>>        the  tokens  returned  by strtok() are always nonempty string=
s.
>>        Thus, for example, given  the  string  "aaa;;bbb,",  successi=
ve
>>        calls  to strtok() that specify the delimiter string ";," wou=
ld
>>        return the strings "aaa" and "bbb", and then a NULL pointer.
> =20
>> Sufficient?
>=20
> Yes!

Good. thank you for checking the text.

Cheers,

Michael

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
