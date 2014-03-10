From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] new Page: isalpha__3(3)
Date: Mon, 10 Mar 2014 14:24:47 +0100
Message-ID: <531DBD1F.5090400@gmail.com>
References: <5315F2B5.2040009@bfs.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5315F2B5.2040009-fPG8STNUNVg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wharms-fPG8STNUNVg@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Bruno Haible <bruno-nWNVUoHt2MvYtjvyW6yDsg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[CC +=3D Bruno;=20

Bruno, if you have *two* moments to spare, maybe you could confirm that=
=20
I am not saying stupid things about UTF-8, MBS, and WCS. If you have on=
ly
*one* moment to spare, I'd appreciate if you look at the program I prov=
ide
below as an example of the use of mbstowcs(); I plan to add it to the
mbstowcs() man page that you wrote, and I wonder if you might check
it to see that everything is in order.Thanks! To save time, just grep
for the instance of your name below...]


Hello Walter,

You've submitted a number of pages over the past months that I have
not found the energy to review. I respond to this submission, with=20
the goal of explaining why, since it shows many of the problems that
I see in the other submissions (and, in several cases, problems that
I have commented on in your past submissions).

On 03/04/2014 04:35 PM, walter harms wrote:
> Hi List,
> The ctype macros like  isalpha(3) have a locale specific counterpart.
> This page was missing.
>=20
> re,
>  wh
>=20
>=20
> Signed-off-by: wharms-fPG8STNUNVg@public.gmane.org <wharms-fPG8STNUNVg@public.gmane.org>
>=20
>=20
> .\" Copyright (c) 2013 by Walter Harms
> .\"
> .\" %%%LICENSE_START(VERBATIM)
> .\" Permission is granted to make and distribute verbatim copies of t=
his
> .\" manual provided the copyright notice and this permission notice a=
re
> .\" preserved on all copies.
> .\"
> .\" Permission is granted to copy and distribute modified versions of=
 this
> .\" manual under the conditions for verbatim copying, provided that t=
he
> .\" entire resulting derived work is distributed under the terms of a
> .\" permission notice identical to this one.
> .\"
> .\" Since the Linux kernel and libraries are constantly changing, thi=
s
> .\" manual page may be incorrect or out-of-date.  The author(s) assum=
e no
> .\" responsibility for errors or omissions, or for damages resulting =
from
> .\" the use of the information contained herein.  The author(s) may n=
ot
> .\" have taken the same level of care in the production of this manua=
l,
> .\" which is licensed free of charge, as they might when working
> .\" professionally.
> .\"
> .\" Formatted or processed versions of this manual, if unaccompanied =
by
> .\" the source, must acknowledge the copyright and authors of this wo=
rk.
> .\" %%%LICENSE_END

Problem: much of the text below is a straight copy from isalpha.3,
written by Thomas Koenig. You can't do this without attribution.=20
(Simplest would have been to retain Thomas's copyright line and=20
license; I see that you did the latter.) To be clear, I do not
believe you've done this maliciously; rather, you've done it in=20
ignorance of what the requirements of copyright law are. But, I=20
feel sure I've mentioned this issue to you in the past...

Problem: notwithstanding the copyright issue, the duplication of text
is done without good reason. A more sensible approach in this case woul=
d=20
be to perform some integration/reworking in the existing ispalpha.3 pag=
e,=20
or simply to defer to that page inside this page.

> .\"
> .\"
> .TH ISALPHA_L 3 2013-09-20 "GNU" "Linux Programmer's Manual"
> .SH NAME
> isalnum_l, isalpha_l, isblank_l, iscntrl_l, isdigit_l, isgraph_l, isl=
ower_l,
> isprint_l, ispunct_l, isspace_l, isupper_l, isxdigit_l \- character
> classification routines
> .SH SYNOPSIS
> .nf
> .B #include <ctype.h>
> .sp
> .BI "int isalnum_l(int " "c" ", locale_t " loc );
> .br
> .BI "int isalpha_l(int " "c" ", locale_t " loc );
> .br
> .BI "int isascii_l(int " "c" ", locale_t " loc );
> .br
> .BI "int isblank_l(int " "c" ", locale_t " loc );
> .br
> .BI "int iscntrl_l(int " "c" ", locale_t " loc );
> .br
> .BI "int isdigit_l(int " "c" ", locale_t " loc );
> .br
> .BI "int isgraph_l(int " "c" ", locale_t " loc );
> .br
> .BI "int islower_l(int " "c" ", locale_t " loc );
> .br
> .BI "int isprint_l(int " "c" ", locale_t " loc );
> .br
> .BI "int ispunct_l(int " "c" ", locale_t " loc );
> .br
> .BI "int isspace_l(int " "c" ", locale_t " loc );
> .br
> .BI "int isupper_l(int " "c" ", locale_t " loc );
> .br
> .BI "int isxdigit_l(int " "c" ", locale_t " loc );
> .fi
> .sp

Problem: no description of the feature test macro requirements for thes=
e=20
pages. See man-pages(7).

Problem: this patch includes no "link" pages (containing just=20
".so man3/isalpha_l.3" for the dozen or so other functions documented o=
n=20
this page.)

> .SH DESCRIPTION
> These functions check whether
> .IR c ,
> which must have the value of an
> .I unsigned char
> or
> .BR EOF ,
> falls into a certain character class according to the current locale.

The above sentence applies for the functions documented in isalpha.3,
but is meaningless for the functions listed in the SYNOPSIS of this pag=
e,
where the conversion is dependent on the locale 'loc', not the current=20
locale.

Problem: all of the rest of the DESCRIPTION contains nothing new that i=
sn't
already in isalpha.3.

> .TP
> .BR isalnum_l ()
> checks for an alphanumeric character; it is equivalent to
> .BI "(isalpha(" c ") || isdigit(" c "))" \fR.
> .TP
> .BR isalpha_l ()
> checks for an alphabetic character; in the standard \fB"C"\fP
> locale, it is equivalent to
> .BI "(isupper_l(" c ") || islower_l(" c "))" \fR.
> In some locales, there may be additional characters for which
> .BR isalpha ()
> is true\(emletters which are neither upper case nor lower
> case.
> .TP
> .BR isascii_l ()
> checks whether \fIc\fP is a 7-bit
> .I unsigned char
> value that fits into
> the ASCII character set.
> .TP
> .BR isblank_l ()
> checks for a blank character; that is, a space or a tab.
> .TP
> .BR iscntrl_l ()
> checks for a control character.
> .TP
> .BR isdigit_l ()
> checks for a digit (0 through 9).
> .TP
> .BR isgraph_l ()
> checks for any printable character except space.
> .TP
> .BR islower_l ()
> checks for a lower-case character.
> .TP
> .BR isprint_l ()
> checks for any printable character including space.
> .TP
> .BR ispunct_l ()
> checks for any printable character which is not a space or an
> alphanumeric character.
> .TP
> .BR isspace_l ()
> checks for white-space characters.
> In the
> .B """C"""
> and
> .B """POSIX"""
> locales, these are: space, form-feed
> .RB ( \(aq\ef\(aq ),
> newline
> .RB ( \(aq\en\(aq ),
> carriage return
> .RB ( \(aq\er\(aq ),
> horizontal tab
> .RB ( \(aq\et\(aq ),
> and vertical tab
> .RB ( \(aq\ev\(aq ).
> .TP
> .BR isupper_l ()
> checks for an uppercase letter.
> .TP
> .BR isxdigit_l ()
> checks for a hexadecimal digits, that is, one of
> .br
> .BR "0 1 2 3 4 5 6 7 8 9 a b c d e f A B C D E F" .

Problem: there is no mention of the requirements on 'loc'. (It must be=20
a valid locale handle and must not be LC_GLOBAL_LOCALE.)

> .SH RETURN VALUE
> The values returned are nonzero if the character
> .I c
> falls into the tested class, and a zero value
> if not.

(Minor) problem: no VERSIONS section.

> .SH CONFORMING TO
> POSIX.1-2008 specifies all of these functions.
> .SH NOTES
> The details of what characters belong into which class depend on the =
current
> locale.
> .sp
> from
> .IR locale.h :
> The concept of one static locale per category is not very well
> thought out.  Many applications will need to process its data using
> information from several different locales.  Another application is
> the implementation of the internationalization handling in the
> upcoming ISO C++ standard library.  To support this another set of
> the functions using locale data exist which have an additional
> argument.

Simply quoting this text from locale.h without explanation does not
really add much to the description. The point is that the *_l
pages are designed to address the limitation that the traditional
locale APIs do not mix well with multi-threaded applications
and with applications that must deal with multiple locales.
A general statement to that effect needs to appear somewhere, though
probably not on this page. (I'll add something to locale(7).)

> For example,
> .BR isupper ()
> will not recognize an A-umlaut (\(:A) as an uppercase letter in the d=
efault
> .B "C"
> locale.

Problem: The sentence above relates to a function not even in the=20
SYNOPSIS of this page.

> .SH EXAMPLE
> The following example takes a locale abbreviation like "de_DE" as arg=
ument.
> Is no argument is supplied it will use "C". With "de_DE" the code wil=
l
> identify the O-Umlaut correctly as alphanumeric character but not wit=
h "C".
> In contrast the punctuation will perform as before.

> .nf
>=20
> #include <stdio.h>
> #include <locale.h>
>=20
> int main(int argc,char *argv[])
> {
>   char *str=3D"c2p\(:O.,";
>   int i;
>   locale_t loc;
>     if (argc > 1 )
>       loc =3D newlocale (LC_ALL_MASK, argv[1], NULL);
>     else
>       loc =3D newlocale (LC_ALL_MASK, "C", NULL);
>=20
>   for(i=3D0;str[i]!=3D0;i++) {
>     if (isalnum_l(str[i],loc))
> 	printf("The character %c is alphanumeric.\\n",str[i]);
>     if ( ispunct_l(str[i],loc) )
> 	printf ("The character %c is punctuation.\\n",str[i]);
>   }
>   return 0;
> }
>=20
> .fi

The example program above violates multiple guidelines from man-pages(7=
),=20
including, for example:

* 4-space indent levels
* spacing around operators and parentheses does not follow K&R norms
  ("indent -kr" fixes most of this) or the norms demonstrated in numero=
us
  existing pages.
* The program does not compile without warnings when using 'cc -Wall"
  (in particular, _XOPEN_SOURCE needs to be defined as 700).
* Various header files that should be included, are not.
* The program does not do error checking of function calls.

But, more to the point, the program appears to be broken, if you are
operating in a UTF-8 locale, which I assume you are. I suppose=20
the program does work if you are operating in an iso-8859-1 locale
(though that seems an unlikely set-up these days), but that
point would need some careful explanation in the man page, or some=20
clarification in a shell session log that shows a run of the program,
otherwise the program would cause much confusion for people on UTF-8=20
systems.

=46unctions such as isalnum_l() can't be applied to UTF-8 characters.
POSIX seems clear:

       The  c argument is an int, the value of which the application
       shall ensure is representable as an unsigned char or equal to
       the  value  of  the  macro EOF. If the argument has any other
       value, the behavior is undefined.

(It would have been useful to see sample output from your program as=20
part of the man page, as a help to the reader, but also as a check of
what you believe is happening, and what locale you are working with.)=20

Instead, a conversion to wide characters is needed (mbstowcs(3)), and
then the use of the isw*_l() functions. See my example, further down.

A modified version of your program illustrates the problem:

#define _XOPEN_SOURCE 700
#include <locale.h>
#include <string.h>
#include <stdio.h>
#include <locale.h>
#include <ctype.h>

int main(int argc, char *argv[])
{
    char *str =3D "c2p=C3=96.,";
    int i;
    locale_t loc;

    printf("string length =3D %ld\n", (long) strlen(str));
    if (argc > 1)
        loc =3D newlocale(LC_ALL_MASK, argv[1], NULL);
    else
        loc =3D newlocale(LC_ALL_MASK, "C", NULL);

    for (i =3D 0; str[i] !=3D 0; i++) {
        printf("%d: %x %c: ", i, str[i] & 0xff, str[i] & 0xff);

        printf("%salphanumeric ", isalnum_l(str[i], loc) ? "" : "!");
        printf("%spunctuation ", ispunct_l(str[i], loc) ? "" : "!");
        printf("\n");
    }
    return 0;
}

See what happens when we run this:

$ ./a.out de_DE
string length =3D 7
0: 63 c: alphanumeric !punctuation=20
1: 32 2: alphanumeric !punctuation=20
2: 70 p: alphanumeric !punctuation=20
3: c3 =EF=BF=BD: alphanumeric !punctuation   <=3D=3D=3D=3D
4: 96 =EF=BF=BD: !alphanumeric !punctuation  <=3D=3D=3D=3D
5: 2e .: !alphanumeric punctuation=20
6: 2c ,: !alphanumeric punctuation=20

Assuming you are operating in a UTF-8 system, the fourth glyph
in your string (O-umlaut) is actually treated as two bytes,=20
not one character by the program, but the construction of your=20
program hides this, because it does not print information about
all of the bytes!

Now, I am no expert (and so I may yet end up embarrassed),=20
but it appears to me that you have misunderstood some of the=20
fundamentals of how multibyte characters, UTF-8, and wide character=20
strings work, and you didn't gain that understanding while writing=20
the page. (Good reading:=20
http://www.joelonsoftware.com/articles/Unicode.html=20
http://www.cprogramming.com/tutorial/unicode.html=20
And I admit I learned a whole lot as I pulled your program apart.)

> .SH SEE ALSO

Repeating the SEE ALSO from isalpha.3 isn't really correct (or useful)=20
here.

> .BR iswalnum (3),
> .BR iswalpha (3),
> .BR iswblank (3),
> .BR iswcntrl (3),
> .BR iswdigit (3),
> .BR iswgraph (3),
> .BR iswlower (3),
> .BR iswprint (3),
> .BR iswpunct (3),
> .BR iswspace (3),
> .BR iswupper (3),
> .BR iswxdigit (3),
> .BR setlocale (3),
> .BR toascii (3),
> .BR tolower (3),
> .BR toupper (3),
> .BR ascii (7),
> .BR locale (7)

(Minor) problem: probably, other pages (at least, locale(7)) should=20
add SEE ALSO references to this page. That change is not in this patch.

=3D=3D

Now, to be clear: many page submissions that I receive fail on some
of the points mentioned above, but this page fails on multiple counts.

In summary... Walter, you are often good at finding things that need to=
=20
be documented, and I know your work is well intended. However, the page=
s
you submit often require so much review/repair effort (in some cases,=20
initial drafts of pages appear not to even have been run through a spel=
l
checker, though this page seems okay), that it is often faster to write
the pages myself. And some of the same problems that I comment on in
earlier submissions turn up again in new submissions. Thus, it is hard=20
for me to find the enthusiasm to review these pages myself (and I have
in any case very limited bandwidth) and help them get repaired (and=20
it's rare that others step in, though I noticed that Stefan Puiu did=20
take a shot on one of your submissions). I do not know what the solutio=
n=20
is here, but this mail explains the problems from my side, and why=20
I'm often unresponsive / slow to respond to your submissions (and=20
am likely to remain so, unless something changes).

And here's how I think the kind of thing you intended to do in your exa=
mple=20
program actually needs to be done. (Bruno, perhaps you can confirm that=
 this=20
code is okay, as I plan to place this example in the wcstombs(3) man pa=
ge.)

---8x------8x------8x------8x------8x------8x------8x------8x------8x--=
-

#include <locale.h>
#include <wchar.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int
main(int argc, char *argv[])
{
    size_t mbslen;	/* Number of multibyte characters in source */
    wchar_t *wcs;	/* Pointer to converted wide character string */
    wchar_t *wp;

    if (argc < 3) {
        fprintf(stderr, "Usage: %s <locale> <string>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    /* Apply the specified locale */

    if (setlocale(LC_ALL, argv[1]) =3D=3D NULL) {
        perror("setlocale");
        exit(EXIT_FAILURE);
    }

    /* Calculate the length required to hold argv[2] converted to
       a wide character string */
      =20
    mbslen =3D mbstowcs(NULL, argv[2], 0);
    if (mbslen =3D=3D -1) {
        perror("mbstowcs");
        exit(EXIT_FAILURE);
    }

    /* Describe the source string to the user */

    printf("Length of source string (excluding terminator):\n");
    printf("    %ld bytes\n", (long) strlen(argv[2]));
    printf("    %ld multibyte characters\n\n", (long) mbslen);

    /* Allocate wide character string of the desired size.  Add 1
       to allow for terminating null wide character (L'\0'). */

    wcs =3D calloc(mbslen + 1, sizeof(wchar_t));
    if (wcs =3D=3D NULL) {
        perror("calloc");
        exit(EXIT_FAILURE);
    }
   =20
    /* Convert the multibyte character string in argv[2] to a=20
       wide character string */

    if (mbstowcs(wcs, argv[2], mbslen + 1) =3D=3D -1) {
        perror("mbstowcs");
        exit(EXIT_FAILURE);
    }

    printf("Wide character string is: %ls (%ld characters)\n",
            wcs, (long) mbslen);

    /* Now do some inspection of the classes of the characters in
       the wide character string */
   =20
    for (wp =3D wcs; *wp !=3D 0; wp++) {
        printf("    %lc ", (wint_t) *wp);

        if (!iswalpha(*wp))
            printf("!");
        printf("alpha ");

        if (iswalpha(*wp)) {
            if (iswupper(*wp))
                printf("upper ");

            if (iswlower(*wp))
                printf("lower ");
        }

        putchar('\n');
    }

    exit(EXIT_SUCCESS);
}

---8x------8x------8x------8x------8x------8x------8x------8x------8x--=
-

And here's an example of what we see when running the program:

$ ./a.out de_DE.UTF-8 "Gr=C3=BC=C3=9Fe!"
Length of source string (excluding terminator):
    8 bytes
    6 multibyte characters

Wide character string is: Gr=C3=BC=C3=9Fe! (6 characters)
    G alpha upper=20
    r alpha lower=20
    =C3=BC alpha lower=20
    =C3=9F alpha lower=20
    e alpha lower=20
    ! !alpha

With kind regards,

Michael

PS I'm working on adding the *_l functions to the isalpha.3 page, and
will send a draft to the list.

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
