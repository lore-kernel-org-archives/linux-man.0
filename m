From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: strlen man-page misinformation
Date: Thu, 18 Feb 2016 16:42:50 +0100
Message-ID: <56C5E67A.2010401@bfs.de>
References: <56B237F9.8010206@cox.net> <56C5C33E.7030407@gmail.com>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56C5C33E.7030407-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alan Aversa <alan.aversa-j9pdmedNgrk@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org



Am 18.02.2016 14:12, schrieb Michael Kerrisk (man-pages):
> Hello Alan,
>=20
> On 02/03/2016 06:25 PM, Alan Aversa wrote:
>> Hello,
>>
>> The 2015-08-08 strlen man-page is incorrect. Here's a diff:
>>
>>     --- a/man3/strlen.3
>>     +++ b/man3/strlen.3
>>     @@ -45,7 +45,7 @@ excluding the terminating null byte (\(aq\\0\(=
aq).
>>      .SH RETURN VALUE
>>      The
>>      .BR strlen ()
>>     -function returns the number of bytes in the string
>>     +function returns the number of *characters* in the string that
>>     precede the terminating null character
>=20
> I went for a simpler change: s/bytes/characters/


=46or my understanding this is wrong. 1 character may be represented by=
 2 or more bytes (utf8).
see this example, the string (test) is 3 characters long and takes 6 by=
tes space.

did i miss something ? did the specification of character change ?

re,
 wh

#include <stdio.h>
#include <string.h>

int main()
{
        char *test=3D"=C3=96=C3=84=C3=9C";
        int i;
        int len=3Dstrlen(test);
        printf("strlen=3D%d\n",len);

        for(i=3D0;i<len;i++)
                printf("%02x\n",(unsigned char)*(test+i));

        return 0;
}



output:
strlen=3D6
c3
96
c3
84
c3
9c



>=20
>>      .IR s .
>>      .SH ATTRIBUTES
>>      For an explanation of the terms used in this section, see
>>     @@ -60,7 +60,7 @@ T{
>>      T}     Thread safety   MT-Safe
>>      .TE
>>      .SH CONFORMING TO
>>     -POSIX.1-2001, POSIX.1-2008, C89, C99, SVr4, 4.3BSD.
>>     +POSIX.1-2001, POSIX.1-2008, C89, C99, C11, SVr4, 4.3BSD.
>=20
> Fixed.
>=20
>>      .SH SEE ALSO
>>      .BR string (3),
>>      .BR strnlen (3),
>>
>> Page 392 (PDF p. 390, =C2=A77.24.6.3) of the C11 standard
>> <http://www.open-std.org/jtc1/sc22/wg14/www/docs/n1570.pdf> says:
>>
>>     The *strlen* function returns the number of characters that prec=
ede
>>     the terminating null character.
>=20
> Thanks for the report. Interesting, POSIX.1 still uses the term "byte=
s"
> the spec.
>=20
> Cheers,
>=20
> Michael
>=20
>=20
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
