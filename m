From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Wrong formulae for complex elementary functions
Date: Thu, 15 Sep 2011 20:38:22 +0200
Message-ID: <CAKgNAkiv7-FL95p2D_80EaRTxhbwDOTun7N_uSsPr2e71Cz8EA@mail.gmail.com>
References: <4CEF7677.30500@ginac.de> <AANLkTinAUyVTdjxY9KVgnOerWxhXtnvmHeTQ-Gb0-TxC@mail.gmail.com>
 <4E3C61FE.1010107@ginac.de> <CAKgNAkjamtuK95ouh6+zsCS1dHiZO0-1q72GpN0CSaFk9XxWqg@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjamtuK95ouh6+zsCS1dHiZO0-1q72GpN0CSaFk9XxWqg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Richard B. Kreckel" <kreckel-HEL5OUoDxoc@public.gmane.org>
Cc: Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andreas Enge <andreas.enge-MZpvjPyXg2s@public.gmane.org>, Bill Allombert <Bill.Allombert-AE+LCD0i0auq1rftRos53FaPQRlvutdw@public.gmane.org>, Karim Belabas <Karim.Belabas-AE+LCD0i0auq1rftRos53FaPQRlvutdw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Richard,

On Thu, Sep 15, 2011 at 6:31 AM, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8@public.gmane.org=
m> wrote:
> Hello Richard,
>
> On Fri, Aug 5, 2011 at 11:34 PM, Richard B. Kreckel <kreckel-HEL5OUoDxoc@public.gmane.org=
> wrote:
>> Hi everybody,
>>
>> On 11/27/2010 08:37 AM, Michael Kerrisk wrote:
>>>
>>> Hi Andries,
>>>
>>> Since you are the mathematician, can you comment?
>>>
>>> Thanks,
>>>
>>> Michael
>>>
>>> On Fri, Nov 26, 2010 at 9:57 AM, Richard B. Kreckel<kreckel@ginac.d=
e>
>>> =A0wrote:
>>>>
>>>> Hi!
>>>>
>>>> The man pages for cacos, cacosf, cacosl, catan, catanf, catanl, ca=
cosh,
>>>> cacoshf, cacoshl, catanh, catanhf, and catanhl contain wrong maths=
=2E
>>>>
>>>> cacos, cacosf, cacosl:
>>>> =A0The formula given in the man page
>>>> =A0 =A0cacos(z) =3D -i clog(z + csqrt(z * z - 1))
>>>> =A0gives wrong results in second and fourth quadrant of complex pl=
ain.
>>>> =A0The formula
>>>> =A0 =A0cacos(z) =3D -i clog(z + I*csqrt(1 - z * z))
>>>> =A0gives correct results.
>>>>
>>>> catan, catanf, catanl:
>>>> =A0The formula given in the man page
>>>> =A0 =A0catan(z) =3D 1 / 2i clog((1 + iz) / (1 - iz))
>>>> =A0gives wrong results on the negative imaginary axis beginning at=
 -I
>>>> =A0(along one of the two branch cuts). Besides, the formula is wri=
tten
>>>> =A0in an ambiguous way.
>>>> =A0The formula
>>>> =A0 =A0catan(z) =3D (clog(1 + iz) - clog(1 - iz)) / 2i
>>>> =A0gives correct results.
>>>>
>>>> cacosh, cacoshf, cacoshl:
>>>> =A0The formula given in the man page
>>>> =A0 =A0cacosh(z) =3D (0.5) * clog((1 + z) / (1 - z))
>>>> =A0gives wrong results everywhere in the complex plain. (The formu=
la
>>>> =A0seems to be copied from the one for catanh, where it is sometim=
es
>>>> =A0correct.)
>>>> =A0The formula
>>>> =A0 =A0cacosh(z) =3D 2 * clog(csqrt((z + 1)/2) + csqrt((z - 1)/2))
>>>> =A0gives correct results.
>>>>
>>>> catanh, catanhf, catanhl:
>>>> =A0The formula given in the man page
>>>> =A0 =A0catanh(z) =3D 0.5 * clog((1 + z) / (1 - z))
>>>> =A0gives wrong results on the positive real axis beginning at 1 (a=
long
>>>> =A0one of the two branch cuts).
>>>> =A0The formula
>>>> =A0 =A0catanh(z) =3D 0.5 * (clog(1 + z) - clog(1 - z))
>>>> =A0gives correct results.
>>>>
>>>> I've also checked casin, casinf, casinl, casinh, casinhf, and casi=
nhl and
>>>> the formulae given there
>>>> =A0 =A0casin(z) =3D -i clog(iz + csqrt(1 - z * z))
>>>> =A0 =A0casinh(z) =3D clog(z + csqrt(z * z + 1))
>>>> are actually correct.
>>>>
>>>> I suspect that some of these errors are due to somebody trying to
>>>> "simplify"
>>>> these formulae. Since this can ruin the behavior, I recommend to a=
dd a
>>>> comment to the upstream sources that warns against attempt of
>>>> simplification.
>>>>
>>>> For the sake of reference, I am looking at manpages-dev 3.25-1 on
>>>> Debian/squeeze.
>>>>
>>>> Bye!
>>>> =A0-richy.
>>>> --
>>>> Richard B. Kreckel
>>>> <http://www.ginac.de/~kreckel/>
>>
>> This doesn't have seem to have been fixed in the Linux man pages, do=
es it?
>
> Sorry -- no, not yet.
>
>> May I suggest a non-mathematical approach to moving forward?
>>
>> Just write a little C program and compare the complex results of
>> a) the library implementation of catan, cacos, etc.,
>> b) the formula written in the man page, and
>> c) the formula I proposed above.
>> If you include a couple of values from all four quadrants, you'll se=
e that
>> my formula always agrees with the implementation while the one from =
the man
>> page doesn't.
>
> Now there's a good idea ;-). It would have been even better if you'd
> sent me a program--I don't mess round with complex numbers every day
> of the week...
>
>> Is there anything else I can do to convince you that this should be =
fixed?
>> If yes, pretty please, let me know! I would really appreciate gettin=
g this
>> fixed.
>
> So, I eventually ironed out my complex math problems and came up with=
 the below:
>
> =3D=3D=3D
> /* Link with "-lm" */
>
> #include <complex.h>
> #include <stdlib.h>
> #include <unistd.h>
> #include <stdio.h>
>
>
>
> int
> main(int argc, char *argv[])
> {
> =A0 =A0double complex z, c, f1, f2;
> =A0 =A0double complex i =3D I;
>
> =A0 =A0if (argc !=3D 3) {
> =A0 =A0 =A0 =A0fprintf(stderr, "Usage: %s <real> <imag>\n");
> =A0 =A0 =A0 =A0exit(EXIT_FAILURE);
> =A0 =A0}
>
> =A0 =A0z =3D atof(argv[1]) + atof(argv[2]) * I;
>
> =A0 =A0c =3D cacos(z);
>
> =A0 =A0printf("cacos() =3D %6.3f %6.3f*i\n", creal(c), cimag(c));
>
> =A0 =A0f1 =3D -i * clog(z + csqrt(z * z - 1));
> =A0 =A0f2 =3D -i * clog(z + i * csqrt(1 - z * z));
>
> =A0 =A0printf("f1 =A0 =A0 =A0=3D %6.3f %6.3f*i\n", creal(f1), cimag(f=
1));
> =A0 =A0printf("f2 =A0 =A0 =A0=3D %6.3f %6.3f*i\n", creal(f2), cimag(f=
2));
>
> =A0 =A0exit(EXIT_SUCCESS);
> }
> =3D=3D=3D
>
> Some sample runs certainly seem to prove your point for that function=
 at least:
>
> $ ./cacos 1 1
> cacos() =3D =A00.905 -1.061*i
> f1 =A0 =A0 =A0=3D =A00.905 -1.061*i
> f2 =A0 =A0 =A0=3D =A00.905 -1.061*i
> $ ./cacos -1 -1
> cacos() =3D =A02.237 =A01.061*i
> f1 =A0 =A0 =A0=3D =A02.237 =A01.061*i
> f2 =A0 =A0 =A0=3D =A02.237 =A01.061*i
> $ ./cacos -1 1
> cacos() =3D =A02.237 -1.061*i
> f1 =A0 =A0 =A0=3D -2.237 =A01.061*i
> f2 =A0 =A0 =A0=3D =A02.237 -1.061*i
> $ ./cacos 1 -1
> cacos() =3D =A00.905 =A01.061*i
> f1 =A0 =A0 =A0=3D -0.905 -1.061*i
> f2 =A0 =A0 =A0=3D =A00.905 =A01.061*i
>
> The above is what you meant, right?
>
> Thanks,
>
> Michael

=46or man-pages-3.33, I have applied the changes below. They should be
consistent with what you proposed (and Andries confirmed). Could you
please carefully check...

I think it's not so necessary to add a warning to the page source.
Nowadays we have version control and logs, so the reasoning should be
easy to find.

Thanks,

Michael


diff --git a/man3/cacos.3 b/man3/cacos.3
index b483a0c..1ae6ff5 100644
--- a/man3/cacos.3
+++ b/man3/cacos.3
@@ -27,7 +27,7 @@ is chosen in the interval [0,pi].
 One has:
 .nf

-    cacos(z) =3D \-i clog(z + csqrt(z * z \- 1))
+    cacos(z) =3D \-i * clog(z + i * csqrt(1 \- z * z))
 .fi
 .SH VERSIONS
 These functions first appeared in glibc in version 2.1.
diff --git a/man3/cacosh.3 b/man3/cacosh.3
index 7bf60c9..bf3d99b 100644
--- a/man3/cacosh.3
+++ b/man3/cacosh.3
@@ -30,7 +30,7 @@ is chosen nonnegative.
 One has:
 .nf

-    cacosh(z) =3D (0.5) * clog((1 + z) / (1 \- z))
+    cacosh(z) =3D 2 * clog(csqrt((z + 1) / 2) + csqrt((z \- 1) / 2))
 .fi
 .SH VERSIONS
 These functions first appeared in glibc in version 2.1.
diff --git a/man3/catan.3 b/man3/catan.3
index 30692bb..fe8c39e 100644
--- a/man3/catan.3
+++ b/man3/catan.3
@@ -25,7 +25,7 @@ The real part of y is chosen in the interval [\-pi/2,=
pi/2].
 One has:
 .nf

-    catan(z) =3D 1 / 2i clog((1 + iz) / (1 \- iz))
+    catan(z) =3D (clog(1 + i * z) \- clog(1 \- i * z)) / (2 * i)
 .fi
 .SH VERSIONS
 These functions first appeared in glibc in version 2.1.
diff --git a/man3/catanh.3 b/man3/catanh.3
index e396021..4f2f230 100644
--- a/man3/catanh.3
+++ b/man3/catanh.3
@@ -27,7 +27,7 @@ is chosen in the interval [\-pi/2,pi/2].
 One has:
 .nf

-    catanh(z) =3D 0.5 * clog((1 + z) / (1 \- z))
+    catanh(z) =3D 0.5 * (clog(1 + z) \- clog(1 \- z))
 .fi
 .SH VERSIONS
 These functions first appeared in glibc in version 2.1.



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
