From: =?ISO-8859-1?Q?David_Pr=E9vot?= <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org>
Subject: [patch] koi8-r.7: potential wrong link, and letter names
Date: Fri, 22 Oct 2010 16:14:27 -0400
Message-ID: <i9srb4$sk2$1@dough.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

The koi8-r(7) (Russian Net Character Set) manual page refers to
iso-8859-7(7) manual page, which is the Latin/Greek one. I guess it
should refer instead to the iso-8859-5(7) (Latin/Cyrillic) one. This is
addressed at the end of the patch.

It has also been spotted that letter names are different in this manual
page and in the Unicode related page [0], the first part of the page
address this.

	0: http://www.unicode.org/charts/PDF/U0400.pdf


diff --git a/man7/koi8-r.7 b/man7/koi8-r.7
index 51478a6..2cd7047 100644
- --- a/man7/koi8-r.7
+++ b/man7/koi8-r.7
@@ -120,24 +120,24 @@ _
 275    189     BD      <BD>    FORMS VERTICAL DOUBLE AND HORIZONTAL SINGLE
 276    190     BE      <BE>    FORMS DOUBLE VERTICAL AND HORIZONTAL
 277    191     BF      <BF>    COPYRIGHT SIGN
- -300    192     C0      <C0>    CYRILLIC SMALL LETTER IU
+300    192     C0      <C0>    CYRILLIC SMALL LETTER YU
 301    193     C1      <C1>    CYRILLIC SMALL LETTER A
 302    194     C2      <C2>    CYRILLIC SMALL LETTER BE
 303    195     C3      <C3>    CYRILLIC SMALL LETTER TSE
 304    196     C4      <C4>    CYRILLIC SMALL LETTER DE
 305    197     C5      <C5>    CYRILLIC SMALL LETTER IE
 306    198     C6      <C6>    CYRILLIC SMALL LETTER EF
- -307    199     C7      <C7>    CYRILLIC SMALL LETTER GE
- -310    200     C8      <C8>    CYRILLIC SMALL LETTER KHA
- -311    201     C9      <C9>    CYRILLIC SMALL LETTER II
- -312    202     CA      <CA>    CYRILLIC SMALL LETTER SHORT II
+307    199     C7      <C7>    CYRILLIC SMALL LETTER GHE
+310    200     C8      <C8>    CYRILLIC SMALL LETTER HA
+311    201     C9      <C9>    CYRILLIC SMALL LETTER I
+312    202     CA      <CA>    CYRILLIC SMALL LETTER SHORT I
 313    203     CB      <CB>    CYRILLIC SMALL LETTER KA
 314    204     CC      <CC>    CYRILLIC SMALL LETTER EL
 315    205     CD      <CD>    CYRILLIC SMALL LETTER EM
 316    206     CE      <CE>    CYRILLIC SMALL LETTER EN
 317    207     CF      <CF>    CYRILLIC SMALL LETTER O
 320    208     D0      <D0>    CYRILLIC SMALL LETTER PE
- -321    209     D1      <D1>    CYRILLIC SMALL LETTER IA
+321    209     D1      <D1>    CYRILLIC SMALL LETTER YA
 322    210     D2      <D2>    CYRILLIC SMALL LETTER ER
 323    211     D3      <D3>    CYRILLIC SMALL LETTER ES
 324    212     D4      <D4>    CYRILLIC SMALL LETTER TE
@@ -145,31 +145,31 @@ _
 326    214     D6      <D6>    CYRILLIC SMALL LETTER ZHE
 327    215     D7      <D7>    CYRILLIC SMALL LETTER VE
 330    216     D8      <D8>    CYRILLIC SMALL LETTER SOFT SIGN
- -331    217     D9      <D9>    CYRILLIC SMALL LETTER YERI
+331    217     D9      <D9>    CYRILLIC SMALL LETTER YERU
 332    218     DA      <DA>    CYRILLIC SMALL LETTER ZE
 333    219     DB      <DB>    CYRILLIC SMALL LETTER SHA
- -334    220     DC      <DC>    CYRILLIC SMALL LETTER REVERSED E
+334    220     DC      <DC>    CYRILLIC SMALL LETTER E
 335    221     DD      <DD>    CYRILLIC SMALL LETTER SHCHA
 336    222     DE      <DE>    CYRILLIC SMALL LETTER CHE
 337    223     DF      <DF>    CYRILLIC SMALL LETTER HARD SIGN
- -340    224     E0      <E0>    CYRILLIC CAPITAL LETTER IU
+340    224     E0      <E0>    CYRILLIC CAPITAL LETTER YU
 341    225     E1      <E1>    CYRILLIC CAPITAL LETTER A
 342    226     E2      <E2>    CYRILLIC CAPITAL LETTER BE
 343    227     E3      <E3>    CYRILLIC CAPITAL LETTER TSE
 344    228     E4      <E4>    CYRILLIC CAPITAL LETTER DE
 345    229     E5      <E5>    CYRILLIC CAPITAL LETTER IE
 346    230     E6      <E6>    CYRILLIC CAPITAL LETTER EF
- -347    231     E7      <E7>    CYRILLIC CAPITAL LETTER GE
- -350    232     E8      <E8>    CYRILLIC CAPITAL LETTER KHA
- -351    233     E9      <E9>    CYRILLIC CAPITAL LETTER II
- -352    234     EA      <EA>    CYRILLIC CAPITAL LETTER SHORT II
+347    231     E7      <E7>    CYRILLIC CAPITAL LETTER GHE
+350    232     E8      <E8>    CYRILLIC CAPITAL LETTER HA
+351    233     E9      <E9>    CYRILLIC CAPITAL LETTER I
+352    234     EA      <EA>    CYRILLIC CAPITAL LETTER SHORT I
 353    235     EB      <EB>    CYRILLIC CAPITAL LETTER KA
 354    236     EC      <EC>    CYRILLIC CAPITAL LETTER EL
 355    237     ED      <ED>    CYRILLIC CAPITAL LETTER EM
 356    238     EE      <EE>    CYRILLIC CAPITAL LETTER EN
 357    239     EF      <EF>    CYRILLIC CAPITAL LETTER O
 360    240     F0      <F0>    CYRILLIC CAPITAL LETTER PE
- -361    241     F1      <F1>    CYRILLIC CAPITAL LETTER IA
+361    241     F1      <F1>    CYRILLIC CAPITAL LETTER YA
 362    242     F2      <F2>    CYRILLIC CAPITAL LETTER ER
 363    243     F3      <F3>    CYRILLIC CAPITAL LETTER ES
 364    244     F4      <F4>    CYRILLIC CAPITAL LETTER TE
@@ -177,10 +177,10 @@ _
 366    246     F6      <F6>    CYRILLIC CAPITAL LETTER ZHE
 367    247     F7      <F7>    CYRILLIC CAPITAL LETTER VE
 370    248     F8      <F8>    CYRILLIC CAPITAL LETTER SOFT SIGN
- -371    249     F9      <F9>    CYRILLIC CAPITAL LETTER YERI
+371    249     F9      <F9>    CYRILLIC CAPITAL LETTER YERU
 372    250     FA      <FA>    CYRILLIC CAPITAL LETTER ZE
 373    251     FB      <FB>    CYRILLIC CAPITAL LETTER SHA
- -374    252     FC      <FC>    CYRILLIC CAPITAL LETTER REVERSED E
+374    252     FC      <FC>    CYRILLIC CAPITAL LETTER E
 375    253     FD      <FD>    CYRILLIC CAPITAL LETTER SHCHA
 376    254     FE      <FE>    CYRILLIC CAPITAL LETTER CHE
 377    255     FF      <FF>    CYRILLIC CAPITAL LETTER HARD SIGN
@@ -188,7 +188,7 @@ _
 .TE
 .SH "SEE ALSO"
 .BR ascii (7),
- -.BR iso-8859-7 (7),
+.BR iso-8859-5 (7),
 .BR koi8-u (7),
 RFC\ 1489,
 http://koi8.pp.ru/


Regards

David


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkzB8KEACgkQ18/WetbTC/p5PgCfWbyAoJLMWXEF0pmpEMq42yLZ
jc8An0qz/U3TrSuL/hX9PzPJGKDVhq8C
=zNky
-----END PGP SIGNATURE-----

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
