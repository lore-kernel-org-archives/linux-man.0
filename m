From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] charsets.7: update to reflect past developments
Date: Wed, 04 Jun 2014 08:51:28 +0300
Message-ID: <538EB3E0.5050600@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Starner <dstarner98-RXPF2eSzNizNLxjTenLetw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

while working with locale related pages charsets(7) and charmap(5) were=
 found to be pretty out of date and page for repertoiremap(5) missing a=
ltogether. While at least charsets(7) could still be improved now it do=
esn't look so outdated anymore.

=46rom 9710bee5517d5869ed019875e6bbf7a6a488a000 Mon Sep 17 00:00:00 200=
1
=46rom: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date: Mon, 2 Jun 2014 16:36:06 +0300
Subject: [PATCH] charsets.7: update to reflect past developments

Rewrite the introduction to make Unicode's prominence more obvious.
Reformulate parts of the text to reflect current Unicode world.
Minor clarification for ASCII/ISO sections, some minor syntax fixes.
---
 man7/charsets.7 |  335 +++++++++++++++++++++++++----------------------=
--------
 1 files changed, 152 insertions(+), 183 deletions(-)

diff --git a/man7/charsets.7 b/man7/charsets.7
index de04d06..73b412c 100644
--- a/man7/charsets.7
+++ b/man7/charsets.7
@@ -11,162 +11,142 @@
 .\" This is combined from many sources, including notes by aeb and
 .\" research by esr.  Portions derive from a writeup by Roman Czyborra=
=2E
 .\"
-.\" Last changed by David Starner <dstarner98-RXPF2eSzNizNLxjTenLetw@public.gmane.org>.
+.\" Changes also by David Starner <dstarner98-RXPF2eSzNizNLxjTenLetw@public.gmane.org>.
 .\"
-.\" FIXME This page was written long ago, and various pieces are proba=
bly
-.\"    no longer quite current. A reworking by someone knowledgeable
-.\"    on charsets is needed. Among other things, the page needs to
-.\"    give more prominence to Unicode. mtk, May 2014
-.\"
-.TH CHARSETS 7 2014-05-28 "Linux" "Linux Programmer's Manual"
+.TH CHARSETS 7 2014-06-02 "Linux" "Linux Programmer's Manual"
 .SH NAME
-charsets \- programmer's view of character sets and internationalizati=
on
+charsets \- character set standards and internationalization
 .SH DESCRIPTION
-Linux is an international operating system.
-Various of its utilities
-and device drivers (including the console driver) support multilingual
-character sets including Latin-alphabet letters with diacritical
-marks, accents, ligatures, and entire non-Latin alphabets including
-Greek, Cyrillic, Arabic, and Hebrew.
+This manual page gives an overview on different character set standard=
s
+and how they were used on Linux before Unicode became ubiquitous.
+Some of this information is still helpful for people working with lega=
cy
+systems and documents.
+.LP
+Standards discussed include such as
+ASCII, GB 2312, ISO 8859, JIS, KOI8\-R, KS, and Unicode.
 .LP
-This manual page presents a programmer's-eye view of different
-character-set standards and how they fit together on Linux.
-Standards
-discussed include ASCII, ISO 8859, KOI8-R, Unicode, ISO 2022 and
-ISO 4873.
-The primary emphasis is on character sets actually used as
-locale character sets, not the myriad others that can be found in data
+The primary emphasis is on character sets that were actually used by
+locale character sets, not the myriad others that could be found in da=
ta
 from other systems.
 .SS ASCII
 ASCII (American Standard Code For Information Interchange) is the orig=
inal
-7-bit character set, originally designed for American English.
-It is currently described by the ECMA-6 standard.
+7\-bit character set, originally designed for American English.
+Also known as US\-ASCII.
+It is currently described by the ISO 646:1991 IRV
+(International Reference Version) standard.
 .LP
 Various ASCII variants replacing the dollar sign with other currency
-symbols and replacing punctuation with non-English alphabetic characte=
rs
-to cover German, French, Spanish, and others in 7 bits exist.
-All are
-deprecated; glibc doesn't support locales whose character sets aren't
-true supersets of ASCII.
-(These sets are also known as ISO-646, a close
-relative of ASCII that permitted replacing these characters.)
+symbols and replacing punctuation with non\-English alphabetic
+characters to cover German, French, Spanish, and others in 7 bits
+emerged.
+All are deprecated;
+glibc does not support locales whose character sets are not true
+supersets of ASCII.
 .LP
-As Linux was written for hardware designed in the US, it natively
-supports ASCII.
+As Unicode, when using UTF\-8, is ASCII\-compatible, plain ASCII text
+still renders properly on modern UTF\-8 using systems.
 .SS ISO 8859
-ISO 8859 is a series of 15 8-bit character sets all of which have US
-ASCII in their low (7-bit) half, invisible control characters in
-positions 128 to 159, and 96 fixed-width graphics in positions 160-255=
=2E
+ISO 8859 is a series of 15 8\-bit character sets all of which have ASC=
II
+in their low (7\-bit) half, invisible control characters in positions
+128 to 159, and 96 fixed-width graphics in positions 160\-255.
 .LP
-Of these, the most important is ISO 8859-1 (Latin-1).
-It is natively
-supported in the Linux console driver, fairly well supported in X11R6,
-and is the base character set of HTML.
+Of these, the most important is ISO 8859\-1
+("Latin Alphabet No .1" / Latin\-1).
+It was widely adopted and supported by different systems,
+and is gradually being replaced with Unicode.
+The ISO 8859-1 characters are also the first 256 characters of Unicode=
=2E
 .LP
 Console support for the other 8859 character sets is available under
-Linux through user-mode utilities (such as
+Linux through user\-mode utilities (such as
 .BR setfont (8))
-.\" // some distributions still have the deprecated consolechars
 that modify keyboard bindings and the EGA graphics
 table and employ the "user mapping" font table in the console
 driver.
 .LP
 Here are brief descriptions of each set:
 .TP
-8859-1 (Latin-1)
-Latin-1 covers most Western European languages such as Albanian, Catal=
an,
-Danish, Dutch, English, Faroese, Finnish, French, German, Galician,
-Irish, Icelandic, Italian, Norwegian, Portuguese, Spanish, and
-Swedish.
-The lack of the ligatures Dutch ij, French oe and old-style
-,,German`` quotation marks is considered tolerable.
+8859\-1 (Latin\-1)
+Latin\-1 covers many West European languages such as Albanian, Basque,
+Danish, English, Faroese, Galician, German, Icelandic, Irish, Italian,
+Norwegian, Portuguese, Spanish, and Swedish.
+The lack of the ligatures Dutch =C4=B2/=C4=B3, French =C5=93, and old-=
style =E2=80=9EGerman=E2=80=9C
+quotation marks was considered tolerable.
 .TP
-8859-2 (Latin-2)
-Latin-2 supports most Latin-written Slavic and Central European
-languages: Croatian, Czech, German, Hungarian, Polish, Romanian,
+8859\-2 (Latin\-2)
+Latin\-2 supports many Latin\-written Central and East European
+languages such as Bosnian, Croatian, Czech, German, Hungarian, Polish,
 Slovak, and Slovene.
+Replacing Romanian =C8=99/=C8=9B with =C5=9F/=C5=A3 was considered tol=
erable.
 .TP
-8859-3 (Latin-3)
-Latin-3 is popular with authors of Esperanto, Galician, and Maltese.
-(Turkish is now written with 8859-9 instead.)
+8859\-3 (Latin\-3)
+Latin\-3 was designed to cover of Esperanto, Maltese, and Turkish but
+8859\-9 later superseded it for Turkish.
 .TP
-8859-4 (Latin-4)
-Latin-4 introduced letters for Estonian, Latvian, and Lithuanian.
-It is essentially obsolete; see 8859-10 (Latin-6) and 8859-13 (Latin-7=
).
+8859\-4 (Latin\-4)
+Latin\-4 introduced letters for North European languages such as
+Estonian, Latvian, Lithuanian but was superseded by 8859\-10 and
+8859\-13.
 .TP
-8859-5
+8859\-5
 Cyrillic letters supporting Bulgarian, Byelorussian, Macedonian,
-Russian, Serbian, and Ukrainian.
-Ukrainians read the letter "ghe"
-with downstroke as "heh" and would need a ghe with upstroke to write a
-correct ghe.
-See the discussion of KOI8-R below.
+Russian, Serbian, and (almost completely) Ukrainian.
+It was never widely used, see the discussion of KOI8\-R/KOI8\-U below.
 .TP
-8859-6
-Supports Arabic.
-The 8859-6 glyph table is a fixed font of separate
+8859\-6
+Was created for Arabic.
+The 8859\-6 glyph table is a fixed font of separate
 letter forms, but a proper display engine should combine these
 using the proper initial, medial, and final forms.
 .TP
-8859-7
-Supports Modern Greek.
+8859\-7
+Was created for modern Greek in 1987, updated in 2003.
 .TP
-8859-8
+8859\-8
 Supports modern Hebrew without niqud (punctuation signs).
-Niqud and full-fledged Biblical Hebrew are outside the scope of this
-character set; under Linux, UTF-8 is the preferred encoding for
-these.
+Niqud and full\-fledged Biblical Hebrew were outside the scope of this
+character set.
 .TP
-8859-9 (Latin-5)
-This is a variant of Latin-1 that replaces Icelandic letters with
+8859\-9 (Latin\-5)
+This is a variant of Latin\-1 that replaces Icelandic letters with
 Turkish ones.
 .TP
-8859-10 (Latin-6)
-Latin 6 adds the last Inuit (Greenlandic) and Sami (Lappish) letters
-that were missing in Latin 4 to cover the entire Nordic area.
-RFC 1345 listed a preliminary and different "latin6".
-Skolt Sami still
-needs a few more accents than these.
+8859\-10 (Latin\-6)
+Latin\-6 added Inuit (Greenlandic) and Sami (Lappish) letters that wer=
e
+missing in Latin\-4 to cover the entire Nordic area.
 .TP
-8859-11
-This exists only as a rejected draft standard.
-The draft standard
-was identical to TIS-620, which is used under Linux for Thai.
+8859\-11
+Supports the Thai alphabet and is nearly identical to the TIS\-620
+standard.
 .TP
-8859-12
+8859\-12
 This set does not exist.
-While Vietnamese has been suggested for this
-space, it does not fit within the 96 (noncombining) characters ISO
-8859 offers.
-UTF-8 is the preferred character set for Vietnamese use
-under Linux.
 .TP
-8859-13 (Latin-7)
+8859\-13 (Latin\-7)
 Supports the Baltic Rim languages; in particular, it includes Latvian
-characters not found in Latin-4.
+characters not found in Latin\-4.
 .TP
-8859-14 (Latin-8)
-This is the Celtic character set, covering Gaelic and Welsh.
-This charset also contains the dotted characters needed for Old Irish.
+8859\-14 (Latin\-8)
+This is the Celtic character set, covering Old Irish, Manx, Gaelic,
+Welsh, Cornish, and Breton.
 .TP
-8859-15 (Latin-9)
-This adds the Euro sign and French and Finnish letters that were missi=
ng in
-Latin-1.
+8859\-15 (Latin\-9)
+Latin\-9 is similar to widely used Latin\-1 but replaces some less
+common symbols with the Euro sign and French and Finnish letters that
+were missing in Latin\-1.
 .TP
-8859-16 (Latin-10)
-This set covers many of the languages covered by 8859-2, and supports
-Romanian more completely than that set does.
-.SS KOI8-R
-KOI8-R is a non-ISO character set popular in Russia.
-The lower half
-is US ASCII; the upper is a Cyrillic character set somewhat better
-designed than ISO 8859-5.
-KOI8-U is a common character set, based off
-KOI8-R, that has better support for Ukrainian.
-Neither of these sets
-are ISO-2022 compatible, unlike the ISO-8859 series.
+8859\-16 (Latin\-10)
+This set covers many Southeast European languages, and most
+importantly supports Romanian more completely than Latin\-2.
+.SS KOI8\-R / KOI8\-U
+KOI8\-R is a non\-ISO character set popular in Russia before Unicode.
+The lower half is ASCII;
+the upper is a Cyrillic character set somewhat better designed than
+ISO 8859\-5.
+KOI8\-U, based off KOI8\-R, has better support for Ukrainian.
+Neither of these sets are ISO\-2022 compatible,
+unlike the ISO\-8859 series.
 .LP
-Console support for KOI8-R is available under Linux through user-mode
+Console support for KOI8\-R is available under Linux through user\-mod=
e
 utilities that modify keyboard bindings and the EGA graphics table,
 and employ the "user mapping" font table in the console driver.
 .\" Thanks to Tomohiro KUBOTA for the following sections about
@@ -175,69 +155,63 @@ and employ the "user mapping" font table in the c=
onsole driver.
 JIS X 0208 is a Japanese national standard character set.
 Though there are some more Japanese national standard character sets (=
like
 JIS X 0201, JIS X 0212, and JIS X 0213), this is the most important on=
e.
-Characters are mapped into a 94x94 two-byte matrix,
-whose each byte is in the range 0x21-0x7e.
+Characters are mapped into a 94x94 two\-byte matrix,
+whose each byte is in the range 0x21\-0x7e.
 Note that JIS X 0208 is a character set, not an encoding.
 This means that JIS X 0208
 itself is not used for expressing text data.
 JIS X 0208 is used
-as a component to construct encodings such as EUC-JP, Shift_JIS,
-and ISO-2022-JP.
-EUC-JP is the most important encoding for Linux
-and includes US ASCII and JIS X 0208.
-In EUC-JP, JIS X 0208
+as a component to construct encodings such as EUC\-JP, Shift_JIS,
+and ISO\-2022\-JP.
+EUC\-JP is the most important encoding for Linux
+and includes ASCII and JIS X 0208.
+In EUC\-JP, JIS X 0208
 characters are expressed in two bytes, each of which is the
 JIS X 0208 code plus 0x80.
 .SS KS X 1001
 KS X 1001 is a Korean national standard character set.
 Just as
-JIS X 0208, characters are mapped into a 94x94 two-byte matrix.
+JIS X 0208, characters are mapped into a 94x94 two\-byte matrix.
 KS X 1001 is used like JIS X 0208, as a component
-to construct encodings such as EUC-KR, Johab, and ISO-2022-KR.
-EUC-KR is the most important encoding for Linux and includes
-US ASCII and KS X 1001.
+to construct encodings such as EUC\-KR, Johab, and ISO\-2022\-KR.
+EUC\-KR is the most important encoding for Linux and includes
+ASCII and KS X 1001.
 KS C 5601 is an older name for KS X 1001.
 .SS GB 2312
 GB 2312 is a mainland Chinese national standard character set used
 to express simplified Chinese.
 Just like JIS X 0208, characters are
-mapped into a 94x94 two-byte matrix used to construct EUC-CN.
-EUC-CN
-is the most important encoding for Linux and includes US ASCII and
+mapped into a 94x94 two\-byte matrix used to construct EUC\-CN.
+EUC\-CN
+is the most important encoding for Linux and includes ASCII and
 GB 2312.
-Note that EUC-CN is often called as GB, GB 2312, or CN-GB.
+Note that EUC\-CN is often called as GB, GB 2312, or CN\-GB.
 .SS Big5
-Big5 is a popular character set in Taiwan to express traditional
+Big5 was a popular character set in Taiwan to express traditional
 Chinese.
 (Big5 is both a character set and an encoding.)
-It is a superset of US ASCII.
-Non-ASCII characters are expressed in two bytes.
-Bytes 0xa1-0xfe are used as leading bytes for two-byte characters.
-Big5 and its extension is widely used in Taiwan and Hong Kong.
-It is not ISO 2022-compliant.
-.SS TIS 620
-TIS 620 is a Thai national standard character set and a superset
-of US ASCII.
-Like ISO 8859 series, Thai characters are mapped into
-0xa1-0xfe.
-TIS 620 is the only commonly used character set under
-Linux besides UTF-8 to have combining characters.
-.SS UNICODE
-Unicode (ISO 10646) is a standard which aims to unambiguously represen=
t every
-character in every human language.
+It is a superset of ASCII.
+Non\-ASCII characters are expressed in two bytes.
+Bytes 0xa1\-0xfe are used as leading bytes for two\-byte characters.
+Big5 and its extension were widely used in Taiwan and Hong Kong.
+It is not ISO 2022 compliant.
+.SS TIS\-620
+TIS\-620 is a Thai national standard character set and a superset
+of ASCII.
+Like in the ISO 8859 series, Thai characters are mapped into
+0xa1\-0xfe.
+.SS Unicode
+Unicode (ISO 10646) is a standard which aims to unambiguously represen=
t
+every character in every human language.
 Unicode's structure permits 20.1 bits to encode every character.
-Since most computers don't include 20.1-bit
-integers, Unicode is usually encoded as 32-bit integers internally and
-either a series of 16-bit integers (UTF-16) (needing two 16-bit intege=
rs
-only when encoding certain rare characters) or a series of 8-bit bytes
-(UTF-8).
-Information on Unicode is available at
-.UR http://www.unicode.org
-.UE .
+Since most computers don't include 20.1\-bit integers, Unicode is
+usually encoded as 32\-bit integers internally and either a series of
+16\-bit integers (UTF\-16) (needing two 16\-bit integers only when
+encoding certain rare characters) or a series of 8-bit bytes (UTF\-8).
 .LP
-Linux represents Unicode using the 8-bit Unicode Transformation Format
-(UTF-8).
-UTF-8 is a variable length encoding of Unicode.
+Linux represents Unicode using the 8\-bit Unicode Transformation Forma=
t
+(UTF\-8).
+UTF\-8 is a variable length encoding of Unicode.
 It uses 1
 byte to code 7 bits, 2 bytes for 11 bits, 3 bytes for 16 bits, 4 bytes
 for 21 bits, 5 bytes for 26 bits, 6 bytes for 31 bits.
@@ -246,41 +220,41 @@ Let 0,1,x stand for a zero, one, or arbitrary bit=
=2E
 A byte 0xxxxxxx
 stands for the Unicode 00000000 0xxxxxxx which codes the same symbol
 as the ASCII 0xxxxxxx.
-Thus, ASCII goes unchanged into UTF-8, and
+Thus, ASCII goes unchanged into UTF\-8, and
 people using only ASCII do not notice any change: not in code, and not
 in file size.
 .LP
-A byte 110xxxxx is the start of a 2-byte code, and 110xxxxx 10yyyyyy
+A byte 110xxxxx is the start of a 2\-byte code, and 110xxxxx 10yyyyyy
 is assembled into 00000xxx xxyyyyyy.
 A byte 1110xxxx is the start
-of a 3-byte code, and 1110xxxx 10yyyyyy 10zzzzzz is assembled
+of a 3\-byte code, and 1110xxxx 10yyyyyy 10zzzzzz is assembled
 into xxxxyyyy yyzzzzzz.
-(When UTF-8 is used to code the 31-bit ISO 10646
-then this progression continues up to 6-byte codes.)
+(When UTF\-8 is used to code the 31\-bit ISO 10646
+then this progression continues up to 6\-byte codes.)
 .LP
-For most people who use ISO-8859 character sets, this means that the
+For most texts in ISO\-8859 character sets, this means that the
 characters outside of ASCII are now coded with two bytes.
 This tends
 to expand ordinary text files by only one or two percent.
 For Russian
-or Greek users, this expands ordinary text files by 100%, since text i=
n
+or Greek texts, this expands ordinary text files by 100%, since text i=
n
 those languages is mostly outside of ASCII.
 For Japanese users this means
-that the 16-bit codes now in common use will take three bytes.
-While there
-are algorithmic conversions from some character sets (especially ISO-8=
859-1) to
-Unicode, general conversion requires carrying around conversion tables=
,
-which can be quite large for 16-bit codes.
+that the 16\-bit codes now in common use will take three bytes.
+While there are algorithmic conversions from some character sets
+(especially ISO 8859\-1) to Unicode, general conversion requires
+carrying around conversion tables, which can be quite large for 16\-bi=
t
+codes.
 .LP
-Note that UTF-8 is self-synchronizing: 10xxxxxx is a tail, any other
+Note that UTF\-8 is self\-synchronizing: 10xxxxxx is a tail, any other
 byte is the head of a code.
 Note that the only way ASCII bytes occur
-in a UTF-8 stream, is as themselves.
+in a UTF\-8 stream, is as themselves.
 In particular, there are no
 embedded NULs (\(aq\\0\(aq) or \(aq/\(aqs that form part of some large=
r code.
 .LP
 Since ASCII, and, in particular, NUL and \(aq/\(aq, are unchanged, the
-kernel does not notice that UTF-8 is being used.
+kernel does not notice that UTF\-8 is being used.
 It does not care at
 all what the bytes it is handling stand for.
 .LP
@@ -288,32 +262,28 @@ Rendering of Unicode data streams is typically ha=
ndled through
 "subfont" tables which map a subset of Unicode to glyphs.
 Internally
 the kernel uses Unicode to describe the subfont loaded in video RAM.
-This means that in UTF-8 mode one can use a character set with 512
-different symbols.
+This means that the Linux console in UTF\-8 mode one can use a charact=
er
+set with 512 different symbols.
 This is not enough for Japanese, Chinese and
 Korean, but it is enough for most other purposes.
 .LP
-At the current time, the console driver does not handle combining
-characters.
-So Thai, Sioux and any other script needing combining
-characters can't be handled on the console.
 .SS ISO 2022 and ISO 4873
-The ISO 2022 and 4873 standards describe a font-control model
+The ISO 2022 and 4873 standards describe a font\-control model
 based on VT100 practice.
 This model is (partially) supported
 by the Linux kernel and by
 .BR xterm (1).
-It is popular in Japan and Korea.
+It used to be popular in Japan and Korea.
 .LP
 There are 4 graphic character sets, called G0, G1, G2, and G3,
 and one of them is the current character set for codes with
 high bit zero (initially G0), and one of them is the current
 character set for codes with high bit one (initially G1).
 Each graphic character set has 94 or 96 characters, and is
-essentially a 7-bit character set.
+essentially a 7\-bit character set.
 It uses codes either
-040-0177 (041-0176) or 0240-0377 (0241-0376).
-G0 always has size 94 and uses codes 041-0176.
+040\-0177 (041\-0176) or 0240\-0377 (0241\-0376).
+G0 always has size 94 and uses codes 041\-0176.
 .LP
 Switching between character sets is done using the shift functions
 \fB^N\fP (SO or LS1), \fB^O\fP (SI or LS0), ESC n (LS2), ESC o (LS3),
@@ -326,7 +296,7 @@ The function SS\fIn\fP makes character set G\fIn\fP=
 (\fIn\fP=3D2 or 3)
 the current one for the next character only (regardless of the value
 of its high order bit).
 .LP
-A 94-character set is designated as G\fIn\fP character set
+A 94\-character set is designated as G\fIn\fP character set
 by an escape sequence ESC ( xx (for G0), ESC ) xx (for G1),
 ESC * xx (for G2), ESC + xx (for G3), where xx is a symbol
 or a pair of symbols found in the ISO 2375 International
@@ -338,7 +308,7 @@ instead of currency sign), ESC ( M selects a charac=
ter set
 for African languages, ESC ( ! A selects the Cuban character
 set, and so on.
 .LP
-A 96-character set is designated as G\fIn\fP character set
+A 96\-character set is designated as G\fIn\fP character set
 by an escape sequence ESC \- xx (for G1), ESC . xx (for G2)
 or ESC / xx (for G3).
 For example, ESC \- G selects the Hebrew alphabet as G1.
@@ -357,9 +327,8 @@ In particular, \fB^N\fP and \fB^O\fP are not used a=
nymore, ESC ( xx
 can be used only with xx=3DB, and ESC ) xx, ESC * xx, ESC + xx
 are equivalent to ESC \- xx, ESC . xx, ESC / xx, respectively.
 .SH SEE ALSO
+.BR iconv (1),
 .BR console (4),
-.BR console_codes (4),
-.BR console_ioctl (4),
 .BR ascii (7),
 .BR iso_8859-1 (7),
 .BR unicode (7),
--
1.7.1

Thanks,

--=20
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
